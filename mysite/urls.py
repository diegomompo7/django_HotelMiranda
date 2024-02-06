from django.contrib import admin
from django.urls import include, path
from polls.views.Rooms import *
from polls.views.Booking import *
from polls.views.Contact import *

urlpatterns = [
    path("admin/", admin.site.urls),
    path("booking/", createBooking, name="bookings"),
    path("rooms/", roomsList, name="rooms"),
    path("rooms/<int:idRoom>/", roomIdList, name="roomsList"),
    path("rooms/available", roomsAvailable, name="roomsAvailable"), 
    path("contacts/", createContact, name="contacts"), 
]