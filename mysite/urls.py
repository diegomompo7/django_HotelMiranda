from django.contrib import admin
from django.urls import include, path
from polls.views.Rooms import *
from polls.views.Booking import *
from polls.views.Contact import *
from polls.views.Home import *
from polls.views.About import *

urlpatterns = [
    path("admin/", admin.site.urls),
    path("home/", home, name="home"),
    path("about/", about, name="about"),
    path("booking/", createBooking, name="bookings"),
    path("rooms/", roomsList, name="rooms"),
    path("rooms/<int:idRoom>/", roomIdList, name="roomDetail"),
    path("rooms/available", roomsAvailable, name="roomsAvailable"),
    path("offer/", roomsOffer, name="roomsOffer"), 
    path("contacts/", contact, name="contacts"), 
]