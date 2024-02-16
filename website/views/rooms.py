from django.core.paginator import Paginator, EmptyPage
from django.db.models import Count
from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect
from django.views.generic import *

from website.models import *
from website.forms import *

class RoomListView(ListView):
    model = Room
    template_name = "website/rooms.html"
    context_object_name = "roomsList"
    paginate_by = 10
    
    def get_queryset(self):
        queryset = Room.objects.prefetch_related("amenities").filter(status='Available')
        
        form = OrderRoomsForm(self.request.GET)
        if form.is_valid():
            order_rooms = form.cleaned_data.get('order_rooms')
            if order_rooms == 'higher_price':
                queryset = queryset.order_by('-priceNight')
            elif order_rooms == 'less_price':
                queryset = queryset.order_by('priceNight')
        
        return queryset
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        paginator = Paginator(self.get_queryset(), self.paginate_by)
        page_number = self.request.GET.get('page', 1)
        context["pages"] = paginator.page_range
        context["totalPages"] = paginator.num_pages
        context['pageNumber'] = int(page_number)
        context['order_room'] = OrderRoomsForm(self.request.GET)

        

        del context['object_list']
        return context
    
    
class RoomDetailView(DetailView, FormView):
    model = Room
    template_name = "website/roomDetail.html"
    context_object_name = "room"
    form_class = FormBooking
    lookup_url_kwarg = 'pk'
    
    def get_queryset(self):
        return Room.objects.prefetch_related("amenities").filter(id = self.kwargs['pk'])
    
    def form_valid(self, form):
        
        checkInDate = form.cleaned_data.get("check_in")
        checkOutDate = form.cleaned_data.get("check_out")
            
        print(checkInDate, checkOutDate)
            
        checkRoom = Booking.objects.filter(room_id = self.kwargs['pk'], check_in__lt=checkOutDate, check_out__gt=checkInDate).values_list('room_id', flat=True)
            
            
        if len(checkRoom) == 0:
            Booking.objects.create(
                name = form.cleaned_data.get("name"),
                email = form.cleaned_data.get("email"),
                phone = form.cleaned_data.get("phone"),
                orderDate = date.today(),
                check_in = checkInDate,
                hour_in = "18:00",
                check_out = checkOutDate,
                hour_out = "12:00",
                room = self.get_queryset()[0],
                specialRequest = form.cleaned_data.get("specialRequest"),
                status = 'Check In')
            
            message = (f"¡Thank you for your request! \n We have received it correctly. Someone from our Team will get back to you very soon. \n The Miranda Hotel")
            
            return HttpResponseRedirect(f'/room/{self.kwargs["pk"]}?message={message}')

    def form_invalid(self, form):
        errors = form.errors.get_json_data()
            
        for error in errors:
            message = errors[error][0]['message']
            
        context = {
            "form" : form,
            "message" : message,
            "room": self.get_queryset()[0],
            "relatedRoom": Room.objects.prefetch_related("amenities").filter(roomType=self.get_queryset()[0].roomType, status="Available")
        }
        return render(self.request, self.template_name, context)
                
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        room = self.get_queryset()[0]
        context['relatedRooms'] = Room.objects.prefetch_related("amenities").filter(roomType=room.roomType, status="Available").order_by('?')
        context['form'] = FormBooking(self.request.POST or None)
        context['message'] = self.request.GET.get('message', None)
        del context['object']
        
        return context
    
    
class RoomsAvailableInRangeListView(ListView):
    
    model = Room
    template_name = "../templates/website/rooms.html"
    context_object_name = "roomsList"
    paginate_by = 10
    
    def get_queryset(self):
        return Room.objects.prefetch_related("amenities").filter(id__in=self.get_booking_available())
        
    def get_booking_available(self):
        
        checkInForm = self.request.GET.get('checkin')
        checkOutForm = self.request.GET.get('checkout')
        
        roomExclude = Booking.objects.filter(
            check_in__lt=checkOutForm,
            check_out__gt=checkInForm
        ).values_list('room_id', flat=True)
    
        return Booking.objects.exclude(room_id__in=roomExclude).values_list('room_id', flat=True).distinct()
        
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        paginator = Paginator(self.get_queryset(), self.paginate_by)
        page_number = self.request.GET.get('page', 1)
        context["pages"] = paginator.page_range
        context['pageNumber'] = page_number
        del context['object_list'] 
        return context
    
class RoomsOfferListView(ListView):
    model = Room
    template_name = "../templates/website/offers.html"
    context_object_name = "roomsList"
    
    def get_queryset(self):
        return Room.objects.prefetch_related("amenities").filter(offer = 'YES')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        del context['object_list']
        rooms = context['roomsList']
        prize_offer = [{"id": room.id, "prize": room.priceNight - (room.priceNight * room.discount / 100)} for room in rooms]
        context['prizeOffer'] = prize_offer
        context['roomsPopular'] = self.most_popular_rooms()
        return context
    
    def most_popular_rooms(self):
        return Room.objects.prefetch_related("amenities").all().annotate(total_bookings=Count('booking')).order_by('-total_bookings')[:3]

