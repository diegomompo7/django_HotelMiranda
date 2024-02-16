from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.views.generic import *

from website.models import *
from website.forms import *
        
class ContactFormView(FormView):
    
    form_class = FormContact
    template_name = "website/contact.html"
    
    def form_valid(self, form):
            
        Contact.objects.create(
            fullName = form.cleaned_data.get("fullName"),
            email = form.cleaned_data.get("email"),
            phone = form.cleaned_data.get("phone"),
            date = date.today(),
            subject = form.cleaned_data.get("subject"),
            message = form.cleaned_data.get("message"),
        )
            
        message = (f"¡Thank you for your message \n We have received it correctly.\n The Miranda Hotel")
            
        return HttpResponseRedirect(f'/contacts?message={message}')
  
    def form_invalid(self, form):
        errors = form.errors.get_json_data()
            
        for error in errors:
            message = errors[error][0]['message']
                
        return render(self.request, self.template_name, {"form": form, "message": message})

    def get(self, request, *args, **kwargs):
        form = self.form_class(request.POST or None)  

        context = {
            "form": form,
        }

        return render(request, self.template_name, context)