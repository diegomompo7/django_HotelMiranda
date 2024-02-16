from django.forms.forms import BaseForm
from django.http import HttpResponse, Http404, JsonResponse, HttpResponseRedirect
from django.shortcuts import render
from ..Form import *
from ..models.Room import *
from django.urls import reverse_lazy

from django.views.generic import *

class HomeView(ListView, FormView):
    
    form_class = CheckAvailabilityForm
    model = Room
    template_name = "../templates/website/index.html"
    context_object_name = "handRooms"
    
    
    def get_queryset(self):
        return Room.objects.prefetch_related("amenities").filter(status = 'Available').order_by('?')[:3]
    
    def form_valid(self, form):
        check_in = form.cleaned_data.get("check_in")
        check_out = form.cleaned_data.get("check_out")
        print(check_in, check_out)
        return HttpResponseRedirect(f'/rooms/available?checkin={check_in}&checkout={check_out}&page=1')


    def form_invalid(self, form):
        errors = form.errors.get_json_data()
        for error in errors:
            message = errors[error][0]['message']
            
        context = {
            "handRooms": self.get_queryset(),
            "message" : message,
            "form" : form
        }
        return render(self.request, self.template_name, context)


    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["form"] = kwargs.get('form', self.get_form())
        context["message"] = kwargs.get('message' or None)
        return context
        
    def get_form(self, form_class=None):
        return super().get_form(form_class)