from django.http import HttpResponse, Http404, JsonResponse, HttpResponseRedirect
from django.shortcuts import render
from ..Form import *
from ..models.Room import *
from django.contrib.auth.forms import UserCreationForm 
from django.contrib.auth import logout


def getLogin(request):
    
        if request.user.is_authenticated:
            return HttpResponseRedirect(f'/profile/')
        else:
    
            message = request.GET.get('message', None)
            active_tab = 'login'
            login = FormLogin(request.POST)  

            return render(
                request,
                "../templates/website/login.html",
                {"login": login, "message":message, 'active_tab': active_tab}
            )
            
            
def getSignup(request):           
        message = request.GET.get('message', None)
        active_tab = 'signup'
        signup = FormSignup(request.POST)
        return render(
        request,
        "../templates/website/login.html",
        {"signup":signup,"message":message, 'active_tab': active_tab}
    )
    
def getLogOut(request):
    logout(request)
    return HttpResponseRedirect(f'/login/')