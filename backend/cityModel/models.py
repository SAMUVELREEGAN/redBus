from django.db import models

# Create your models here.
class cityModel(models.Model):
    locationType = models.CharField(max_length=200 , choices=[('AREA', 'Area'), ('CITY', 'City')])
    cityName = models.CharField(max_length=200)

    def __str__(self):
        return f"{self.locationType} - {self.cityName}"