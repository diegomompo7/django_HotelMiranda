from django.http import HttpResponseRedirect
from django.shortcuts import render,redirect
from django.contrib import messages
from ..models.Booking import Booking
from ..models.Room import Room
from ..models.Contact import Contact

from ..Form import *

def checkAvailability(request):
    print(request)
    form = CheckAvailabilityForm(request.POST)

    if form.is_valid():
        check_in = form.cleaned_data["check_in"]
        check_out = form.cleaned_data["check_out"]
        print(check_in, check_out)
        return HttpResponseRedirect(f'/rooms/available?checkin={check_in}&checkout={check_out}&page=1')
    else:
        errors = form.errors.as_data()
        message =errors['__all__'][0].message
        return render(
        request,
        "../templates/website/index.html",
        {"form": form, "message": message}
    )

def createBooking(request, idRoom):
    room = Room.objects.prefetch_related("amenities").filter(id = idRoom)
    
    form = FormBooking(request.POST)
 
    relatedRooms = Room.objects.prefetch_related("amenities").filter(roomType = room[0].roomType, status = "Available").order_by('?')
    
    if request.method == 'POST':
        if form.is_valid():
            
            checkInDate = request.POST.get("check_in")
            checkOutDate = request.POST.get("check_out")
            
            print(checkInDate, checkOutDate)
            
            checkRoom = Booking.objects.filter(room_id = idRoom, check_in__lt=checkOutDate, check_out__gt=checkInDate).values_list('room_id', flat=True)
            
            
            if len(checkRoom) == 0:
                Booking.objects.create(
                    name = request.POST.get("name"),
                    email = request.POST.get("email"),
                    phone = request.POST.get("phone"),
                    orderDate = date.today(),
                    check_in = checkInDate,
                    hour_in = "18:00",
                    check_out = checkOutDate,
                    hour_out = "12:00",
                    room = room[0],
                    specialRequest = request.POST.get("specialRequest"),
                    status = 'Check In')
            
                message = (f"¡Thank you for your request! \n We have received it correctly. Someone from our Team will get back to you very soon. \n The Miranda Hotel")
            
                return HttpResponseRedirect(f'/room/{idRoom}?message={message}')
            else:
                message = (f"¡We are sorry!\nThis room is not available for the dates you need. Please try different dates or try a different room.\n The Miranda Hotel")
                
                return render(
                    request,
                    "../templates/website/roomDetail.html",
                {"form": form, "message": message,"room" : room, "relatedRooms": relatedRooms})
                
        else:
            errors = form.errors.get_json_data()
            
            for error in errors:
                message = errors[error][0]['message']
                
            return render(
            request,
            "../templates/website/roomDetail.html",
            {"form": form, "message": message,"room" : room, "relatedRooms": relatedRooms}  
            )
    else:
        form = FormBooking()
        
def createContact(request):
    
    print("hola")
    form = FormContact(request.POST)
    
    print(form)
    
    if request.method == 'POST':
        if form.is_valid():
            
                newContact = form.save()
            
                Contact.objects.create(
                    fullName = request.POST.get("fullName"),
                    email = request.POST.get("email"),
                    phone = request.POST.get("phone"),
                    date = date.today(),
                    subject = request.POST.get("subject"),
                    message = request.POST.get("message"),
                )
            
                message = (f"¡Thank you for your message \n We have received it correctly.\n The Miranda Hotel")
            
                return HttpResponseRedirect(f'/contacts?message={message}')
  
        else:
            errors = form.errors.get_json_data()
            
            for error in errors:
                message = errors[error][0]['message']
                
            return render(
            request,
            "../templates/website/contact.html",
            {"form": form, "message": message}  
            )
    return render(
        request,
        "../templates/website/contact.html",
        {"form": form}
    )