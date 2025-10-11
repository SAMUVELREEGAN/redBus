from django.db import models
from busModel.models import *

# Create your models here.
class seatModel(models.Model):
    busId = models.ForeignKey(busModel, on_delete=models.CASCADE ,related_name='seats')
    # Lower deck left
    lower_deck_left_sleeper_sit = models.BooleanField(default=False)
    lower_deck_left_sleeper_sit_row = models.IntegerField(default=0)
    lower_deck_left_sleeper_sit_count = models.IntegerField(default=0)
    lower_deck_left_seater = models.BooleanField(default=False)
    lower_deck_left_seater_row = models.IntegerField(default=0)
    lower_deck_left_seater_count = models.IntegerField(default=0)

    # Lower deck right
    lower_deck_right_sleeper_sit = models.BooleanField(default=False)
    lower_deck_right_sleeper_sit_row = models.IntegerField(default=0)
    lower_deck_right_sleeper_sit_count = models.IntegerField(default=0)
    lower_deck_right_seater = models.BooleanField(default=False)
    lower_deck_right_seater_row = models.IntegerField(default=0)
    lower_deck_right_seater_count = models.IntegerField(default=0)

    # Upper deck left
    upper_deck_left_sleeper_sit = models.BooleanField(default=False)
    upper_deck_left_sleeper_sit_row = models.IntegerField(default=0)
    upper_deck_left_sleeper_sit_count = models.IntegerField(default=0)
    upper_deck_left_seater = models.BooleanField(default=False)
    upper_deck_left_seater_row = models.IntegerField(default=0)
    upper_deck_left_seater_count = models.IntegerField(default=0)

    # Upper deck right
    upper_deck_right_sleeper_sit = models.BooleanField(default=False)
    upper_deck_right_sleeper_sit_row = models.IntegerField(default=0)
    upper_deck_right_sleeper_sit_count = models.IntegerField(default=0)
    upper_deck_right_seater = models.BooleanField(default=False)
    upper_deck_right_seater_row = models.IntegerField(default=0)
    upper_deck_right_seater_count = models.IntegerField(default=0)

    # Center
    end_center_seater = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.busId.bus_name}"