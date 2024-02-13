from datetime import date
from django.db import models
from django.core.exceptions import ValidationError
from django.contrib.auth.models import User
from .Room import *

class TypeOrder(models.TextChoices):
    FOOD = "Food", "Food"
    OTHER = "Other", "Other"

class Order(models.Model):
    id = models.AutoField(primary_key=True)   
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    room = models.ForeignKey(Room, on_delete=models.CASCADE)
    type = models.CharField(max_length = 10, choices = TypeOrder.choices)
    description = models.TextField(max_length = 255)
    timestamps = models.DateTimeField(auto_now_add=True)
    