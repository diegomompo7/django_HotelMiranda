from django.contrib import admin
from .models import *

class UserAdmin(admin.ModelAdmin):
    list_display = [field.name for field in User._meta.get_fields()]
class ContactAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Contact._meta.get_fields()]
class RoomAdmin(admin.ModelAdmin):
    list_display = ["id", "photos", 'roomType', 'roomNumber', 'description', 'offer', 'priceNight', 'discount', 'cancellation', 'status', "amenities_display"]
    
    def amenities_display(self, obj):
        return ", ".join([amenity.amenity for amenity in obj.amenities.all()])

class AmenityAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Amenity._meta.get_fields()]
class BookingAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Booking._meta.get_fields()]
class OrderAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Order._meta.get_fields()]

# Register your models here.
admin.site.register(User, UserAdmin)
admin.site.register(Contact, ContactAdmin)
admin.site.register(Room, RoomAdmin)
admin.site.register(Amenity, AmenityAdmin)
admin.site.register(Booking, BookingAdmin)
admin.site.register(Order, OrderAdmin)