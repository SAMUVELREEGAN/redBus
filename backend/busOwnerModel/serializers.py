from rest_framework import serializers
from .models import *


class busOwnerSerializer(serializers.ModelSerializer):
    class Meta:
        model = busOwner
        fields = '__all__'