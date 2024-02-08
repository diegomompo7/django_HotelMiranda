import json
from ..models.Room import Room
from ..models.Booking import Booking
from ..models.Form import CheckAvailabilityForm
from ..models.Amenity import Amenity
from django.http import HttpResponse, Http404, JsonResponse
from django.core.paginator import Paginator, EmptyPage
from django.shortcuts import render

def roomsList(request):
    pageNumber = int(request.GET.get('page', 1))
    rooms = Room.objects.filter(status = 'Available').values()
    
    roomsPerPage = 10
    
    startIndex = (pageNumber - 1) * 10
    endIndex = startIndex + roomsPerPage
    
    roomsPage = rooms[startIndex:endIndex]
    
    totalPages = (len(rooms) + roomsPerPage -1) // roomsPerPage

    return render(
        request,
        "../templates/rooms.html",
        {"roomsList": roomsPage, "pages": range(1, totalPages+1), "pageNumber":pageNumber}
    )
def roomIdList(request, idRoom): 
    room = Room.objects.filter(id = idRoom).values()
    amenities = Amenity.objects.filter(room = idRoom).values()
    return render(
        request,
        "../templates/roomDetail.html",
    {"room" : room, "amenities" : amenities}
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
    rooms = Room.objects.filter(id__in=bookingsAvailable)
    
    roomsPerPage = 10
    print(rooms)
    
    startIndex = (pageNumber - 1) * 10
    endIndex = startIndex + roomsPerPage
    
    roomsPage = rooms[startIndex:endIndex].values()
    
    totalPages = (len(rooms) + roomsPerPage -1) // roomsPerPage
    

    return render(
        request,
        "../templates/rooms.html",
        {"roomsList": roomsPage, "pages": range(1, totalPages+1), "pageNumber":pageNumber, "roomsList": roomsPage}
    )  
    
def roomsOffer(request):
    return render(
            request,
        "../templates/offers.html",
)