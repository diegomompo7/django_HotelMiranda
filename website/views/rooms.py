import json

from django.db.models.query import QuerySet
from ..models.Room import Room
from ..models.Booking import Booking
from django.db.models import Count, Value, CharField
from ..Form import CheckAvailabilityForm
from django.http import HttpResponse, Http404, JsonResponse
from django.core.paginator import Paginator, EmptyPage
from django.shortcuts import render
from django.db.models.functions import Concat
from django.views.generic import *
from ..Form import FormBooking

class RoomListView(ListView):
    model = Room
    template_name = "website/rooms.html"
    context_object_name = "roomsList"
    paginate_by = 10
    
    def get_queryset(self):
        return Room.objects.prefetch_related("amenities").filter(status = 'Available')
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        totalPages = (self.get_queryset().count() + self.paginate_by -1)
        context["pages"] = range(1, totalPages+1)
        context['pageNumber'] = self.request.GET.get('page', 1)
        del context['object_list']
        return context
    
    
class RoomDetailView(DetailView):
    model = Room
    template_name = "website/roomDetail.html"
    context_object_name = "room"
    lookup_url_kwarg = 'pk'
    
    def get_queryset(self):
        return Room.objects.prefetch_related("amenities").filter(id = self.kwargs['pk'])
    
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
        totalPages = (self.get_queryset().count() + self.paginate_by -1)
        context["pages"] = range(1, totalPages+1)
        context['pageNumber'] = self.request.GET.get('page', 1)
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

