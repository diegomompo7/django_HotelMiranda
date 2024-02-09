from django.http import HttpResponseRedirect
from django.shortcuts import render

from ..Form import *

def checkAvailability(request):
    form = CheckAvailabilityForm(request.POST)
    
    if form.is_valid():
        check_in = form.cleaned_data["check_in"]
        check_out = form.cleaned_data["check_out"]
        print(check_in, check_out)
        return HttpResponseRedirect(f'/rooms/available?checkin={check_in}&checkout={check_out}&page=1')
        
    else:
        form = CheckAvailabilityForm()

    return render(request, "../templates/index.html", {"form": form})  