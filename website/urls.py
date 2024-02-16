from django.contrib import admin
from django.urls import include, path
from .views.rooms import *
from .views.contact import *
from .views.home import *
from .views.auth import *
from .views.about import *
from .views.form import *
from .views.profile import *
from .views.order import *

urlpatterns = [
    path("", HomeView.as_view(), name="home"),
    path("admin/", admin.site.urls),
    path("login/", LoginFormView.as_view(), name="login"),
    path("profile/", profile, name="profile"),
    path("logout/", LogOutView.as_view(), name="logout"),
    path("signup/", SignupFormView.as_view(), name="signup"),
    path("about/", AboutView.as_view(), name="about"),
    path("createBooking/<int:idRoom>/", createBooking, name="createBook"),
    path("createContact/", createContact, name="createContact"),
    path("rooms/", RoomListView.as_view(), name="rooms"),
    path("room/<int:pk>/", RoomDetailView.as_view(), name="roomDetail"),
    path("rooms/available", RoomsAvailableInRangeListView.as_view(), name="roomAvailableRange"),
    path("offer/", RoomsOfferListView.as_view(),name="roomsOffer"),
    path("contacts/", contact, name="contacts"),
    path("orders/", getOrder, name="orders"),
    path("createOrder/", createOrder, name="createOrder"),
    path("updateOrder/<int:idOrder>/", updateOrder, name="updateOrder"),
    path("postOrder/", postOrder, name="postOrder")
]