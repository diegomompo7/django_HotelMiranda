from django.http import HttpResponseRedirect
from django.shortcuts import render,redirect
from django.contrib import messages
from ..models.Booking import Booking
from ..models.Room import Room
from ..models.Contact import Contact
from ..Form import *
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User  
from django.urls import reverse
from datetime import datetime
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required
from ..models.Order import Order
from django.shortcuts import get_object_or_404

def checkAvailability(request):
    print(request)
    form = CheckAvailabilityForm(request.POST)
    
    print(form)

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
    
    form = FormContact(request.POST)
    
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
    
def postLogin(request):
    
    loginUser = FormLogin(request.POST)
    if request.method == 'POST':
        if loginUser.is_valid():
            
                usernameLogin = request.POST.get("username")
                passwordLogin = request.POST.get("password")
                checkLogin = authenticate(request, username=usernameLogin, password=passwordLogin)
                print("1", checkLogin)
                
                if checkLogin is not None:
                    
                    login(request, checkLogin)
                    return HttpResponseRedirect(f'/profile/')
                
                
                if User.objects.filter(username=usernameLogin).exists():
                    message = (f"account not exists on database\nThe Miranda Hotel")
                    return HttpResponseRedirect(f'/login?message={message}')
                    
                message = (f"Invalid email or password\n or account not exists\nThe Miranda Hotel")
                return HttpResponseRedirect(f'/login?message={message}')

        else:
            return HttpResponseRedirect(f'/login')
            
    return render(
        request,
        "../templates/website/login.html",
        {"login": loginUser}
    )

def createUser(request):
    
    signup = FormSignup(request.POST)
    active_tab = 'signup'
    
    print(signup)
    
    if request.method == 'POST':
        if signup.is_valid():
            username= request.POST.get("username")
            email = request.POST.get("email")
            firstName = request.POST.get("first_name")
            lastName = request.POST.get("last_name")
            password1 = request.POST.get("password1")
            password2 = request.POST.get("password2")
            
            if User.objects.filter(username=username).exists():
                message = (f"The username exists on database\nThe Miranda Hotel")
                return render(request, "../templates/website/login.html", {"signup": signup, "active_tab": active_tab, "message": message})
            
            if User.objects.filter(email=email).exists():
                message = (f"The emails exists on database\nThe Miranda Hotel")
                return render(
                    request,
                    "../templates/website/login.html",
                    {"singup": signup,"active_tab" : active_tab, "message" : message}
                )
                
            if password1 != password2:
                message = (f"The password don't match\nThe Miranda Hotel")
                return render(
                    request,
                    "../templates/website/login.html",
                    {"singup": signup,"active_tab" : active_tab, "message" : message}
                )
            
            User.objects.create_user(
                password = password1,
                username = username,
                first_name = firstName,
                last_name = lastName,
                email = email,
            )
            
            return HttpResponseRedirect(f'/login')
      
        errors = signup.errors.get_json_data()
        for error in errors:
            message = errors[error][0]['message']
        return render(request,"../templates/website/login.html",{"signup": signup, "active_tab" : active_tab,  "message": message})
            
    return render(
        request,
        "../templates/website/login.html",
        {"signup": signup}
    )
    
@login_required
def createOrder(request):
    
    formOrder = FormCreateOrder(request.POST)
    
    return render(
        request,
        "../templates/website/formOrder.html",
        {"submit" : "Create a Order", "formOrder" : formOrder, "method" : "create"}
    )
    
@login_required
def postOrder(request):
    
    user = request.user
    formOrder = FormCreateOrder(request.POST)
    print(formOrder)
    
    if request.method == 'POST':
        if formOrder.is_valid():
            
            roomId = request.POST.get("room_id")
            typeOrder = request.POST.get("type")
            description= request.POST.get("description")
            checkRoomId = Room.objects.filter(id = roomId).values()
            
            if len(checkRoomId) == 0:
                message = (f"Room not found\nThe Miranda Hotel")
                print(message)
                return render(
                    request,
                    "../templates/website/formOrder.html",
                    {"formOrder": formOrder, "message" : message, "method" : "create","submit" : "Create a Order"}
                )
            
            Order.objects.create(
                type = typeOrder,
                description = description,
                timestamps = date.today(),
                room_id = checkRoomId[0]["id"],
                user_id = user.id,
            )
            
            return HttpResponseRedirect("/orders/" )
           
        errors = formOrder.errors.get_json_data()
        print(errors)
        
            
    return render(
        request,
        "../templates/website/formOrder.html",
        {"formOrder": formOrder}
    )
    
@login_required
def updateOrder(request, idOrder):
    
    order = get_object_or_404(Order, id=idOrder)

    
    if request.method == 'POST':
        formOrder = FormUpdateOrder(request.POST, instance=order)
        
        if formOrder.is_valid():
            formOrder.save()
            return HttpResponseRedirect("/orders/")
    
    else:
        formOrder = FormUpdateOrder(instance=order)
    
        print(formOrder)
    return render(
        request,
        "../templates/website/formOrder.html",
        {"submit" : "Update a Order", "formOrder" : formOrder, "method" : "update", "id" : idOrder}
    )