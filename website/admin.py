from django.contrib import admin
from .models.Booking import Booking
from .models.Room import Room, Amenity
from .models.Contact import Contact
from .models.User import User
from .models.Order import Order


# Register your models here.
admin.site.register(User)
admin.site.register(Contact)
admin.site.register(Room)
admin.site.register(Amenity)
admin.site.register(Booking)
admin.site.register(Order)