from django.db import models
from busModel.models import *

# Create your models here.
class busSeat(models.Model):
    busId = models.ForeignKey(busModel , on_delete=models.CASCADE , related_name='bus_seat')
    seat_number = models.CharField(max_length=10)
    price = models.CharField(max_length=10 , null=True)
    deck = models.CharField(max_length=20, choices=[('lower', 'Lower'), ('upper', 'Upper'), ('end_center', 'End Center')])
    side = models.CharField(max_length=20, choices=[('left', 'Left'), ('right', 'Right'), ('center', 'Center')])
    type = models.CharField(max_length=20, choices=[('sleeper_sit', 'Sleeper Sit'), ('seater', 'Seater')])
    is_booked = models.BooleanField(default=False)

    def __str__(self):
        return F'{self.seat_number} - {self.deck}_deck - {self.side}_{self.type} - {self.busId.bus_name}'