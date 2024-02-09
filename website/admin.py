from django.contrib import admin
from .models.Booking import Booking
from .models.Room import Room, Amenity
from .models.Contact import Contact
from .models.User import User

# Register your models here.
admin.site.register(User)
admin.site.register(Contact)
admin.site.register(Room)
admin.site.register(Amenity)
admin.site.register(Booking)