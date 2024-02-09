from django.http import HttpResponse, Http404, JsonResponse
from django.shortcuts import render
from ..Form import *
from ..models.Room import *
from ..models.Amenity import *

def home(request):
    
    form = CheckAvailabilityForm(request.POST)
    idRooms = []
    
    handRooms = Room.objects.filter(status = 'Available').order_by('?')[:3].values()
    
    for room in handRooms:
        idRooms.append(room['id'])
        
    amenities = Amenity.objects.filter(room__id__in = idRooms).select_related('room_id').values()
    
    return render(
        request,
        "../templates/index.html",
        {"form": form, "handRooms":handRooms, "amenities": amenities}
    )
    
