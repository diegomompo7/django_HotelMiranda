from django.http import HttpResponse, Http404, JsonResponse, HttpResponseRedirect
from django.shortcuts import render
from ..Form import *
from ..models.Room import *
from django.contrib.auth.forms import UserCreationForm 
from django.contrib.auth import logout
from django.views.generic import *
from django.views.generic import *
from django.urls import reverse_lazy
from ..Form import FormLogin
from django.contrib.auth import authenticate, login

class LoginFormView(FormView, RedirectView):
    form_class = FormLogin
    template_name = "../templates/website/login.html"
    
    def get_redirect_url(self, *args, **kwargs):
        if self.request.user.is_authenticated:
            return reverse_lazy('profile')
  
    def form_valid(self, form):
        usernameLogin = form.cleaned_data.get('username')
        passwordLogin = form.cleaned_data.get('password')
        checkLogin = authenticate(self, username=usernameLogin, password=passwordLogin)
                
        if checkLogin is not None:
            login(self.request, checkLogin)
            return HttpResponseRedirect(f'/profile/')
                
        if User.objects.filter(username=usernameLogin).exists():
            message = (f"account not exists on database\nThe Miranda Hotel")
            return HttpResponseRedirect(f'/login?message={message}')
                    
        message = (f"Invalid email or password\nThe Miranda Hotel")
        return HttpResponseRedirect(f'/login?message={message}')


    def form_invalid(self, form):
        context = self.get_context_data(form=form)
        return self.render_to_response(context)

    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            return HttpResponseRedirect('/profile/')
    
        active_tab = 'login'
        login = self.form_class(request.POST or None)  

        context = {
            "login": login,
            "active_tab": active_tab,
        }

        return render(request, self.template_name, context)
            
            
class SignupFormView(CreateView):
    
    form_class = FormSignup
    template_name = 'website/login.html'
        
    def form_valid(self, form):
            print("1")
            username= form.cleaned_data.get("username")
            email = form.cleaned_data.get("email")
            firstName = form.cleaned_data.get("first_name")
            lastName = form.cleaned_data.get("last_name")
            password1 = form.cleaned_data.get("password1")
            password2 = form.cleaned_data.get("password2")
            
            if User.objects.filter(username=username).exists():
                message = "username exits in database."
                return render(self.request, self.template_name, {'form': form, 'message': message})

            if User.objects.filter(email=email).exists():
                message = "email exits in database."
                return render(self.request, self.template_name, {'form': form, 'message': message})
            
            if password1 != password2:
                message = "password didn't match"
                return render(self.request, self.template_name, {'form': form, 'message': message})
            
            User.objects.create_user(
                password = password1,
                username = username,
                first_name = firstName,
                last_name = lastName,
                email = email,
            )
            
            return HttpResponseRedirect(f'/login')


    def form_invalid(self, form):
        errors = form.errors.get_json_data()
        for error in errors:
            message = errors[error][0]['message']
        active_tab = 'signup'
        context = {
            "signup": form,
            "message": message,
            "active_tab": active_tab,
        }
        return self.render_to_response(context)
        
        
    def get(self, request, *args, **kwargs):
        print("2")
        active_tab = 'signup'
        signup = self.form_class(request.POST or None)  

        context = {
            "signup": signup,
            "active_tab": active_tab,
        }

        return render(request, self.template_name, context)
               
    
class LogOutView(RedirectView):
     def get_redirect_url(self, *args, **kwargs):
        return reverse_lazy('login')