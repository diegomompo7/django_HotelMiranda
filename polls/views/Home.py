from django.http import HttpResponse, Http404, JsonResponse
from django.shortcuts import render
from ..models.Form import *

def home(request):
    
    form = CheckAvailabilityForm(request.POST)
    
    return render(
        request,
        "../templates/index.html",
        {"form": form}
    )