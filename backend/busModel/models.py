from django.db import models
from busOwnerModel.models import *

class busModel(models.Model):
    owner = models.ForeignKey(busOwner , on_delete=models.CASCADE , related_name='buses')
    bus_name = models.CharField(max_length=100)
    start_location = models.CharField(max_length=100 ,blank=True , null=True)
    end_location = models.CharField(max_length=100 , blank=True , null=True)
    start_time = models.CharField(max_length=100 , blank=True , null=True)
    end_time = models.CharField(max_length=100 , blank=True , null=True)
    bus_number = models.CharField(max_length=100)
    amenities = models.JSONField(default=list, blank=True)
    bus_features = models.JSONField(default=list, blank=True)

    def __str__(self):
        return f"{self.bus_name} - {self.bus_number}"
