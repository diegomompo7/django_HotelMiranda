from django.contrib import admin
from django.urls import path
from .views.rooms import *
from .views.contact import *
from .views.home import *
from .views.auth import *
from .views.about import *
from .views.profile import *
from .views.order import *

urlpatterns = [
    path("", HomeView.as_view(), name="home"),
    path("admin/", admin.site.urls),
    path("login/", LoginFormView.as_view(), name="login"),
    path("profile/", ProfileView.as_view(), name="profile"),
    path("logout/", logout_view, name="logout"),
    path("signup/", SignupFormView.as_view(), name="signup"),
    path("about/", AboutView.as_view(), name="about"),
    path("rooms/", RoomListView.as_view(), name="rooms"),
    path("room/<int:pk>/", RoomDetailView.as_view(), name="roomDetail"),
    path("rooms/available/", RoomsAvailableInRangeListView.as_view(), name="roomAvailableRange"),
    path("offer/", RoomsOfferListView.as_view(),name="roomsOffer"),
    path("contacts/", ContactFormView.as_view(), name="contacts"),
    path("orders/", OrderListView.as_view(), name="orders"),
    path("createOrder/", CreateOrderForm.as_view(), name="createOrder") ,  
    path("updateOrder/<int:pk>/", UpdateOrderForm.as_view(), name="updateOrder"),
]
