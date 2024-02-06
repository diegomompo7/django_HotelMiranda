from ..models.Room import Room
from ..models.Booking import Booking
from django.http import HttpResponse, Http404, JsonResponse
from django.shortcuts import render

def roomsList(request):
    rooms = Room.objects.all().values()
    return render(
        request,
        "../templates/rooms.html",
    )
def roomIdList(request, idRoom):
    try: 
        rooms = Room.objects.filter(id = idRoom).values()
        return render(
            request,
        "../templates/roomDetail.html",
    )

    except Room.DoesNotExist:
        raise Http404("Room does not exist")
    
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