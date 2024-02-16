from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.views.generic import *

@method_decorator(login_required, name='dispatch')
class ProfileView(TemplateView):
    template_name = "website/profile.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['user'] = self.request.user
        return context