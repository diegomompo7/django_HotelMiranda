from django.http import HttpResponse
from django import forms
from polls.models.Booking import Booking

class FormBooking(forms.ModelForm):
    class Meta:
        model = Booking
        fields =  ['Check_in', 'Check_Out', 'Name', 'Email', 'Phone']
        


def createBooking(request):
    if request.method == 'POST':
        form = FormBooking(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponse('¡Form save succesuflly!')
    else:
        form = FormBooking()