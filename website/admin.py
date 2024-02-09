from django.contrib import admin
from .models.Booking import Booking
from .models.Room import Room
from .models.Contact import Contact
from .models.User import User
from .models.Amenity import Amenity

# Register your models here.
admin.site.register(User)
admin.site.register(Contact)
admin.site.register(Room)
admin.site.register(Amenity)
admin.site.register(Booking)