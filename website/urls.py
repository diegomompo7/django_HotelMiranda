from django.contrib import admin
from django.urls import include, path
from website.views.rooms import *
from website.views.booking import *
from website.views.contact import *
from website.views.home import *
from website.views.about import *
from website.views.form import *

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