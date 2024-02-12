from django.contrib import admin
from django.urls import include, path
from .views.rooms import *
from .views.contact import *
from .views.home import *
from .views.about import *
from .views.form import *

urlpatterns = [
    path("admin/", admin.site.urls),
    path("home/", home, name="home"),
    path("about/", about, name="about"),
    path("createBooking/<int:idRoom>/", createBooking, name="booking"),
    path("rooms/", roomsList, name="rooms"),
    path("room/<int:idRoom>/", roomIdList, name="roomDetail"),
    path("rooms/available", roomsAvailableInRange, name="roomAvailableRange"),
    path("offer/", roomsOffer,name="roomsOffer"),
    path("popular/", mostPopularRooms, name="mostPopularRooms"),
    path("contacts/", contact, name="contacts"),
    path("checkAva/", checkAvailability, name="checkAva"),
]