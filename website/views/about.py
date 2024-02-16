from django.http import HttpResponse, Http404, JsonResponse
from django.shortcuts import render
from django.views.generic import *

class AboutView(TemplateView):
    template_name = "website/about.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context