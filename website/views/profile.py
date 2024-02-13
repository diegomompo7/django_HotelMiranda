from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from django.contrib.auth.models import User

@login_required
def profile(request):
    
    user = request.user
    return render(
            request,
            "../templates/website/profile.html",
            {"user": user}
    )