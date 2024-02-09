from django.http import HttpResponse
from django import forms
from website.models.Contact import Contact
from django.shortcuts import render

class FormContact(forms.ModelForm):
    class Meta:
        model = Contact
        fields =  ['name', 'surname', 'phone', 'email', 'subject', 'message']
        
def contact(request):
    return render(
        request,
        "../templates/website/contact.html",
)
    

def createContact(request):
    if request.method == 'POST':
        form = FormContact(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponse('¡Form save succesuflly!')
    else:
        form = FormContact()