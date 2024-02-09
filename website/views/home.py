from django.http import HttpResponse, Http404, JsonResponse
from django.shortcuts import render
from ..Form import *
from ..models.Room import *

def home(request):
    
    form = CheckAvailabilityForm(request.POST)
    idRooms = []
    
    handRooms = Room.objects.prefetch_related("amenities").filter(status = 'Available').order_by('?')[:3]

    
    return render(
        request,
        "../templates/website/index.html",
        {"form": form, "handRooms":handRooms}
    )
    
