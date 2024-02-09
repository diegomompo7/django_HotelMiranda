from django.db import models
from .Room import Room

class Amenity(models.Model):
    id = models.AutoField(primary_key=True)
    amenity= models.CharField(max_length=50)
    room = models.ForeignKey(Room, on_delete=models.CASCADE)    