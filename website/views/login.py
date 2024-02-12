from django.http import HttpResponse, Http404, JsonResponse
from django.shortcuts import render
from ..Form import *
from ..models.Room import *

def login(request):

    
    return render(
        request,
        "../templates/website/login.html",
    )
    
