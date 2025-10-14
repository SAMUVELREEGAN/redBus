from django.shortcuts import render
from rest_framework import viewsets
from .serializers import *
from .models import *


class cityViewSet(viewsets.ModelViewSet):
    queryset = cityModel.objects.all()
    serializer_class = citySerializer
