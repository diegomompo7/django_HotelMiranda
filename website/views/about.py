from django.http import HttpResponse, Http404, JsonResponse
from django.shortcuts import render

def about(request):
    return render(
        request,
        "../templates/about.html",
    )