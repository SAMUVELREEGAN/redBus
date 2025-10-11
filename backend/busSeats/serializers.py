from rest_framework import serializers
from .models import *

class busSeatesSerializer(serializers.ModelSerializer):
    class Meta:
        model = busSeat
        fields = '__all__'