from django.contrib import admin
from django.urls import include, path
from polls.views.Rooms import *
from polls.views.Booking import *
from polls.views.Contact import *
from polls.views.Home import *
from polls.views.About import *
from polls.views.Form import *

urlpatterns = [
    path("admin/", admin.site.urls),
    path("home/", home, name="home"),
    path("about/", about, name="about"),
    path("booking/", createBooking, name="bookings"),
    path("rooms/", roomsList, name="rooms"),
    path("room/<int:idRoom>/", roomIdList, name="roomDetail"),
    path("rooms/available", roomsAvailableInRange, name="roomAvailableRange"),
    path("offer/", roomsOffer,name="roomsOffer"),
    path("popular/", mostPopularRooms, name="mostPopularRooms"),
    path("contacts/", contact, name="contacts"),
    path("checkAva/", checkAvailability, name="checkAva"),
]