from django.contrib import admin
from .models import *


# Register your models here.
admin.site.register(User)
admin.site.register(Contact)
admin.site.register(Room)
admin.site.register(Amenity)
admin.site.register(Booking)
admin.site.register(Order)