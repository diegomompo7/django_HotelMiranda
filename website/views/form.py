from django.http import HttpResponseRedirect
from django.shortcuts import render,redirect
from django.contrib import messages
from ..models.Booking import Booking
from ..models.Room import Room

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
    print(request)
    if request.method == 'POST':
        form = FormBooking(request.POST)
        if form.is_valid():
            
            room = Room.objects.filter(id = idRoom)
            
            Booking.objects.create(
                name = request.POST.get("name"),
                email = request.POST.get("email"),
                phone = request.POST.get("phone"),
                orderDate = date.today(),
                check_in = request.POST.get("check_in"),
                hour_in = "18:00",
                check_out = request.POST.get("check_out"),
                hour_out = "12:00",
                room = room[0],
                specialRequest = request.POST.get("specialRequest"),
                status = 'Check In')
            return HttpResponse('¡Form save succesuflly!')
    else:
        form = FormBooking()