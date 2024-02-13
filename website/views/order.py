from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from ..models.Order import Order

@login_required
def getOrder(request):
    user = request.user
    allOrders = Order.objects.filter(user_id = user.id)
    
    return render(
        request,
        "../templates/website/order.html",
        {"allOrders" : allOrders}
    )
    