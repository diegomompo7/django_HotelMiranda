from django.http import HttpResponse, Http404, JsonResponse
from django.shortcuts import render

def home(request):
    return render(
        request,
        "../templates/index.html",
    )