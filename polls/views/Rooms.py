import json
from ..models.Room import Room
from ..models.Booking import Booking
from ..models.Amenity import Amenity
from django.http import HttpResponse, Http404, JsonResponse
from django.core.paginator import Paginator, EmptyPage
from django.shortcuts import render

def roomsList(request):
    pageNumber = int(request.GET.get('page', 1))
    rooms = Room.objects.all().values()
    
    roomsPerPage = 10
    
    startIndex = (pageNumber - 1) * 10
    endIndex = startIndex + roomsPerPage
    
    roomsPage = rooms[startIndex:endIndex]
    
    totalPages = (len(rooms) + roomsPerPage -1) // roomsPerPage
    
    print(totalPages)

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
    
def roomsAvailable(request):
    checkInDate = parse_date(request.GET.get("checkin"))
    checkOutDate = parse_date(request.GET.get("checkout"))
    
    if not checkInDate or not checkOutDate:
        return JsonResponse({'error': 'Invalid dates provided'}, status=400)
    
    
    bookingBooked = Booking.objects.filter(check_in__lt = checkOutDate.isoformat(), check_out__gt = checkInDate.isoformat())
    
    idBookedRooms = bookingBooked.values_list('room_id', flat=True)
    
    roomsAva = Room.objects.all().exclude(id__in = idBookedRooms).values()
    
    print(idBookedRooms)
    
    return render(
        request,
        "../templates/rooms.html",
    )
    
def roomsOffer(request):
    return render(
            request,
        "../templates/offers.html",
    )