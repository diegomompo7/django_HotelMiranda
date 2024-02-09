from datetime import date
from django.db import models
from django.core.exceptions import ValidationError
from django.core.validators import RegexValidator
from .Room import Room


def checkInHigherOrderDate(value):
    if value <= date.today():
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
    check_in = models.DateField(validators=[checkInHigherOrderDate])
    hour_in = models.TimeField()
    check_out = models.DateField()
    hour_out = models.TimeField()
    room = models.ForeignKey(Room, on_delete=models.CASCADE)
    specialRequest = models.TextField(max_length = 255, null=True)
    status = models.CharField(max_length = 50, choices = StatusBooking.choices,  default="Check In")
    
    class Meta:
        ordering = ['room_id', 'specialRequest']
    
    def clean(self):
        checkOutHigherCheckIn(self.check_out, self)