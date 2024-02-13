from django.contrib import admin
from django.urls import include, path
from .views.rooms import *
from .views.contact import *
from .views.home import *
from .views.auth import *
from .views.about import *
from .views.form import *
from .views.profile import *

urlpatterns = [
    path("admin/", admin.site.urls),
    path("login/", getLogin, name="login"),
    path("profile/", profile, name="profile"),
    path("logout/", getLogOut, name="logout"),
    path("signup/", getSignup, name="signup"),
    path("createUser/", createUser, name="createUser"),
    path("loginIn/", postLogin, name="postLogin"),
    path("home/", home, name="home"),
    path("about/", about, name="about"),
    path("createBooking/<int:idRoom>/", createBooking, name="createBook"),
    path("createContact/", createContact, name="createContact"),
    path("rooms/", roomsList, name="rooms"),
    path("room/<int:idRoom>/", roomIdList, name="roomDetail"),
    path("rooms/available", roomsAvailableInRange, name="roomAvailableRange"),
    path("offer/", roomsOffer,name="roomsOffer"),
    path("popular/", mostPopularRooms, name="mostPopularRooms"),
    path("contacts/", contact, name="contacts"),
    path("checkAva/", checkAvailability, name="checkAva"),
]