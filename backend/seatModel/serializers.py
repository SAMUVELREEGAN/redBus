from rest_framework import serializers
from .models import seatModel

class seatSerilaizer(serializers.ModelSerializer):
    class Meta:
        model:seatModel
        fields = '__all__'