import json
from ..models.Room import Room
from ..models.Booking import Booking
from django.db.models import Count, Value, CharField
from ..Form import CheckAvailabilityForm
from django.http import HttpResponse, Http404, JsonResponse
from django.core.paginator import Paginator, EmptyPage
from django.shortcuts import render
from django.db.models.functions import Concat
from ..Form import FormBooking

def roomsList(request):
    pageNumber = int(request.GET.get('page', 1))
    rooms = Room.objects.prefetch_related("amenities").filter(status = 'Available')
    
    roomsPerPage = 10
    
    startIndex = (pageNumber - 1) * 10
    endIndex = startIndex + roomsPerPage
    
    roomsPage = rooms[startIndex:endIndex]

    totalPages = (len(rooms) + roomsPerPage -1) // roomsPerPage

    return render(
        request,
        "../templates/website/rooms.html",
        {"roomsList": roomsPage, "pages": range(1, totalPages+1), "pageNumber":pageNumber}
    )
    
    
def roomIdList(request, idRoom):
    room = Room.objects.prefetch_related("amenities").filter(id = idRoom)
    
    form = FormBooking(request.POST)
 
    relatedRooms = Room.objects.prefetch_related("amenities").filter(roomType = room[0].roomType, status = "Available").order_by('?')

    return render(
        request,
        "../templates/website/roomDetail.html",
    {"room" : room, "relatedRooms": relatedRooms, "form" : form}
    )   
    
    
    
def roomsAvailableInRange(request):
    
    checkInForm = request.GET.get('checkin')
    checkOutForm = request.GET.get('checkout')
    pageNumber = int(request.GET.get('page', 1))
    
    roomExclude = Booking.objects.filter(
    check_in__lt=checkOutForm,
    check_out__gt=checkInForm
    ).values_list('room_id', flat=True)
    
    bookingsAvailable = Booking.objects.exclude(room_id__in=roomExclude).values_list('room_id', flat=True).distinct()
    
    print(bookingsAvailable)
    rooms = Room.objects.prefetch_related("amenities").filter(id__in=bookingsAvailable)
    
    roomsPerPage = 10
    print(rooms)
    
    startIndex = (pageNumber - 1) * 10
    endIndex = startIndex + roomsPerPage
    
    roomsPage = rooms[startIndex:endIndex].values()
    
    totalPages = (len(rooms) + roomsPerPage -1) // roomsPerPage
    

    return render(
        request,
        "../templates/website/rooms.html",
        {"roomsList": roomsPage, "pages": range(1, totalPages+1), "pageNumber":pageNumber, "roomsList": roomsPage}
    )  
    
def roomsOffer(request):
    prizeOffer = []
    rooms = Room.objects.prefetch_related("amenities").filter(offer = 'YES')
    
    for room in rooms:
        prize = room.priceNight - (room.priceNight * room.discount / 100)
        prizeOffer.append({"id" : room.id, "prize" : prize})
        
    roomsPopular = mostPopularRooms()
    
    return render(
            request,
        "../templates/website/offers.html",
        {"roomsList": rooms, "prizeOffer" : prizeOffer, "roomsPopular" : roomsPopular['roomsPopular']}
)
       
def mostPopularRooms():
    roomsPopular = Room.objects.prefetch_related("amenities").all().annotate(
    total_bookings=Count('booking')).order_by('-total_bookings')[:3]
    
    return {"roomsPopular": roomsPopular}
