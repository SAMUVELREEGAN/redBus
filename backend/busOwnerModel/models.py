from django.db import models

# Create your models here.
class busOwner(models.Model):
    ownerUserName = models.CharField(max_length=100)
    ownerPassword = models.CharField(max_length=100)
    ownerEmail = models.EmailField(unique=True)
    ownerPhoneNumber = models.CharField(max_length=15)

    def __str__(self):
        return self.ownerUserName