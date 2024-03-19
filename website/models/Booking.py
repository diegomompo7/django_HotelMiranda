from django.core.exceptions import ValidationError
from django.core.validators import RegexValidator
from django.db import models

from .Room import Room
from datetime import date


def checkInHigherOrderDate(value, booking_instance):
    if value <= booking_instance.orderDate:
        raise ValidationError("Insert a date in greather than order date")
    
def checkOutHigherCheckIn(value, booking_instance):
    print(booking_instance.check_in)
    if value <= booking_instance.check_in:
        raise ValidationError("Insert a date out greather than date in")
    

#class RoomId(models.TextChoices):
class StatusBooking(models.TextChoices):
    CHECK_IN = "Check In", "Check In"
    CHECK_OUT = "Check Out", "Check Out"
    IN_PROGRESS = "In Progress", "In Progress"
    
class Booking(models.Model):
    id = models.AutoField(primary_key=True) 
    name = models.CharField(max_length = 255)
    email = models.EmailField(("Email"), max_length=255)
    phone = models.CharField(max_length = 9, validators=[
        RegexValidator(
                regex=r'^(0|91)?[6-9][0-9]{8}',
                message="Enter a valid format phone number",
                code="invalid_registration",
        ),
    ])
    orderDate = models.DateField(auto_now_add = True)
    check_in = models.DateField()
    hour_in = models.TimeField()
    check_out = models.DateField()
    hour_out = models.TimeField()
    room = models.ForeignKey(Room, on_delete=models.CASCADE)
    specialRequest = models.TextField(max_length = 255, null=True,  blank=True)
    status = models.CharField(max_length = 50, choices = StatusBooking.choices,  default="Check In")
    
    class Meta:
       db_table = 'website_booking'
    
    def clean(self):
        checkInHigherOrderDate(self.check_in, self)
        checkOutHigherCheckIn(self.check_out, self)