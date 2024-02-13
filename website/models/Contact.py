from django.db import models
from django.core.validators import RegexValidator, MinValueValidator, MaxValueValidator
from datetime import date

    
class Contact(models.Model):
    id = models.AutoField(primary_key=True)   
    fullName = models.CharField(max_length = 255)
    email = models.EmailField(("Email"), max_length=255)
    phone = models.CharField(max_length = 9, validators=[
        RegexValidator(
                regex=r'^(0|91)?[6-9][0-9]{8}',
                message="Enter a valid format phone number",
                code="invalid_registration",
        )
    ])
    date = models.DateField(default = date.today())
    subject = models.CharField(max_length = 100)
    message = models.TextField(max_length = 255)
    is_archived = models.BooleanField(default = False)


    class Meta:
        ordering = ['fullName', 'email']