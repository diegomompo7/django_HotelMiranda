from django import forms
from django.http import HttpResponse
from django import forms
from django.core.exceptions import ValidationError
from django.core.validators import RegexValidator
from website.models.Booking import Booking
from django.contrib.auth.models import User
from .models.Contact import Contact
from datetime import date
from django.contrib.auth.forms import UserCreationForm  

def checkInHigherOrderDate(value):
    if value <= date.today():
        raise ValidationError("Insert a date in greather than order date")
    

class CheckAvailabilityForm(forms.Form):
    check_in = forms.DateField(label="Arrival Date", widget=forms.DateInput(attrs={'type': 'date'}))
    check_out = forms.DateField(label="Departure Date", widget=forms.DateInput(attrs={'type': 'date'}))
    
    def clean(self):
        cleaned_data = super().clean()
        check_in = cleaned_data.get('check_in')
        check_out = cleaned_data.get('check_out')

        if check_in and check_out:
            if check_out <= check_in:
                raise forms.ValidationError("Insert a date out greater than date in") 
    

class FormBooking(forms.Form):
    check_in = forms.DateField(label="Check In", widget=forms.DateInput(attrs={'type': 'date'}), validators=[checkInHigherOrderDate] )
    check_out = forms.DateField(label="Check Out", widget=forms.DateInput(attrs={'type': 'date'}))
    name = forms.CharField(label="Full Name", widget=forms.TextInput(attrs={'type': 'text'}), max_length = 255)
    email = forms.EmailField(label="Email", widget=forms.TextInput(attrs={'type': 'email'}), max_length=255)
    phone = forms.CharField(label="Phone", widget=forms.TextInput(attrs={'type': 'text'}), max_length = 9, validators=[
        RegexValidator(
                regex=r'^(0|91)?[6-9][0-9]{8}',
                message="Enter a valid format phone number",
                code="invalid_registration",
        ),
    ])
    specialRequest = forms.CharField(label="Message", max_length = 255, widget=forms.Textarea(attrs={'type': 'text', "rows" : 8, "null":True}))

    def clean(self):
        cleaned_data = super().clean()
        check_in = cleaned_data.get('check_in')
        check_out = cleaned_data.get('check_out')

        if check_in and check_out:
            if check_out <= check_in:
                raise forms.ValidationError("Insert a date out greater than date in") 


class FormContact(forms.ModelForm):
    class Meta:
        model = Contact
        fields = ["fullName", "phone", "email", "subject", "message"]
        widgets = {
            "fullName": forms.TextInput(attrs={'max_length' : 255, "placeholder" : "Enter your full name"}),
            "phone": forms.TextInput(attrs={'type': 'text', 'max_length' : 9, "placeholder" : "Enter your phone"}),
            "email": forms.TextInput(attrs={'type': 'text', 'max_length' : 255, "placeholder" : "Enter your email"}),
            "subject": forms.TextInput(attrs={'type': 'text', 'max_length' : 100, "placeholder" : "Enter a subject"}),
            "message": forms.Textarea(attrs={'rows' : 8, 'type': 'text', "placeholder" : "Enter a message"})
        }

class FormLogin(forms.Form):
    username = forms.CharField(label="Username", widget=forms.TextInput(attrs={'type': 'text'}), max_length=150)
    password = forms.CharField(label="Password", max_length = 20, widget=forms.PasswordInput(attrs={'type': 'password'}))

class FormSignup(UserCreationForm):
    first_name = forms.CharField(label="First Name", widget = forms.TextInput(attrs={'type': 'text'}), max_length=50)
    last_name = forms.CharField(label="Last Name", widget = forms.TextInput(attrs={'type': 'text'}), max_length=50)
    email = forms.EmailField(label="Email Address", widget=forms.TextInput(attrs={'type': 'email'}), max_length=255)