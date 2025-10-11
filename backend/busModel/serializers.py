from rest_framework import serializers
from .models import *

class busModelSerializers(serializers.ModelSerializer):
    class Meta:
        model=busModel
        fields = '__all__'