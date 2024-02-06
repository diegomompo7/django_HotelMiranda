from django.http import HttpResponse
from django import forms
from polls.models.Contact import Contact

class FormContact(forms.ModelForm):
    class Meta:
        model = Contact
        fields =  ['fullName', 'phone', 'email', 'subject', 'message']
        


def createContact(request):
    if request.method == 'POST':
        form = FormContact(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponse('¡Form save succesuflly!')
    else:
        form = FormContact()