from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.shortcuts import *
from django.utils.decorators import method_decorator
from django.views.generic import *

from website.models import *
from website.forms import *


@method_decorator(login_required, name='dispatch')
class OrderListView(ListView):
    
    model = Order
    template_name = "website/order.html"
    context_object_name = "allOrders"
    
    def get_queryset(self):
        user = self.request.user
        return Order.objects.filter(user_id = user.id)

    
    def get_context_data(self, **kwargs):
       context = super().get_context_data(**kwargs)
       del context["object_list"]
       return context


@method_decorator(login_required, name='dispatch')
class CreateOrderForm(FormView):
    form_class = FormCreateOrder
    template_name = "website/formOrder.html"
    
    def form_valid(self, form):
        
            user = self.request.user
            
            roomId = form.cleaned_data.get("room_id")
            typeOrder = form.cleaned_data.get("type")
            description= form.cleaned_data.get("description")
            checkRoomId = Room.objects.filter(id = roomId).values()
            
            if len(checkRoomId) == 0:
                message = (f"Room not found\nThe Miranda Hotel")
                print(message)
                return render(
                    self.request,
                    self.template_name,
                    {"formOrder": form, "message" : message, "method" : "create","submit" : "Create a Order"}
                )
            
            Order.objects.create(
                type = typeOrder,
                description = description,
                timestamps = date.today(),
                room_id = checkRoomId[0]["id"],
                user_id = user.id,
            )
            
            return HttpResponseRedirect("/orders/" )
        
    def get(self, request, *args, **kwargs):
        formOrder = self.form_class(request.POST or None)  

        context = {
            "formOrder": formOrder,
            "method" : "create",
            "submit" : "Create order"
        }

        return render(request, self.template_name, context)
    
@method_decorator(login_required, name='dispatch')
class UpdateOrderForm(FormView):
    form_class = FormUpdateOrder
    template_name = "website/formOrder.html"
    
    def get_object(self):
        id_order = self.kwargs.get('pk')
        return get_object_or_404(Order, id=id_order)

    def get_form_kwargs(self):
        kwargs = super().get_form_kwargs()
        kwargs['instance'] = self.get_object()
        return kwargs

    def form_valid(self, form):
        form.save()
        return super().form_valid(form)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["method"] = "update"
        context["submit"] = "Update Order"
        return context

    def get_success_url(self):
        return "/orders/"