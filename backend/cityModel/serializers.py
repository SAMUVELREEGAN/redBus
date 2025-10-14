from rest_framework import serializers
from .models import *


class citySerializer(serializers.ModelSerializer):
    class Meta:
        model = cityModel
        fields = '__all__'