from django.http import HttpResponse
from django import forms
from website.models.Contact import Contact
from django.shortcuts import render
from ..Form import *
        
def contact(request):
    
    form = FormContact(request.POST)
    message = request.GET.get('message', None)
    
    print(form)
    
    
    return render(
        request,
        "../templates/website/contact.html",
        {"form" : form, "message" : message}
)
    
