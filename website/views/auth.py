from django.http import HttpResponse, Http404, JsonResponse
from django.shortcuts import render
from ..Form import *
from ..models.Room import *

def getLogin(request):
    
            message = request.GET.get('message', None)
            active_tab = 'login'
            login = FormLogin(request.POST)

            print(login)
    
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
    
