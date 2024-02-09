import json
from ..models.Room import Room
from django.db.models import Count
from ..models.Booking import Booking
from ..Form import CheckAvailabilityForm
from ..models.Amenity import Amenity
from django.http import HttpResponse, Http404, JsonResponse
from django.core.paginator import Paginator, EmptyPage
from django.shortcuts import render

def roomsList(request):
    idRooms = []
    pageNumber = int(request.GET.get('page', 1))
    rooms = Room.objects.filter(status = 'Available').values()
    
    for room in rooms:
        idRooms.append(room['id'])
        
    amenities = Amenity.objects.filter(room__id__in = idRooms).select_related('room_id').values()
    
    roomsPerPage = 10
    
    startIndex = (pageNumber - 1) * 10
    endIndex = startIndex + roomsPerPage
    
    roomsPage = rooms[startIndex:endIndex]
    
    totalPages = (len(rooms) + roomsPerPage -1) // roomsPerPage

    return render(
        request,
        "../templates/rooms.html",
        {"roomsList": roomsPage, "amenities": amenities, "pages": range(1, totalPages+1), "pageNumber":pageNumber}
    )
def roomIdList(request, idRoom):
    idRooms = []
    room = Room.objects.filter(id = idRoom).values()
    amenities = Amenity.objects.filter(room = idRoom).values()
    print(room)
 
    relatedRooms = Room.objects.filter(roomType = room[0]['roomType'], status = "Available").order_by('?').values()
    
    for related in relatedRooms:
        idRooms.append(related['id'])
    
    relatedAmenities = Amenity.objects.filter(room__id__in = idRooms).select_related('room_id').values()
    
    print(relatedRooms)
    
    
    return render(
        request,
        "../templates/roomDetail.html",
    {"room" : room, "amenities" : amenities, "relatedRooms": relatedRooms, "relatedAmenities": relatedAmenities}
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
    idRooms = []
    prizeOffer = []
    rooms = Room.objects.filter(offer = 'YES').values()
    
    for room in rooms:
        idRooms.append(room['id'])
        prize = room["priceNight"] - (room["priceNight"] * room["discount"] / 100)
        prizeOffer.append({"id" : room["id"], "prize" : prize})
        
        
    amenities = Amenity.objects.filter(room__id__in = idRooms).select_related('room_id').values()
    
    roomsPopular = mostPopularRooms()
    
    return render(
            request,
        "../templates/offers.html",
        {"roomsList": rooms, "amenities": amenities, "prizeOffer" : prizeOffer, "roomsPopular" : roomsPopular['roomsPopular'], "amenitiesPopular" : roomsPopular['amenities']}
)
       
def mostPopularRooms():
    
    idRooms = []
    roomsPopular = Room.objects.all().select_related("room_id").annotate(
    total_bookings=Count('booking')).order_by('-total_bookings')[:3].values()
    
    for room in roomsPopular:
        idRooms.append(room['id'])
        
    amenities = Amenity.objects.filter(room__id__in = idRooms).select_related('room_id').values()

    return {"roomsPopular": roomsPopular, "amenities": amenities}
