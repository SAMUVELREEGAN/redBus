from django.shortcuts import render
from rest_framework import viewsets
from .serializers import *
from .models import *

class busSeatViewset(viewsets.ModelViewSet):
    queryset = busSeat.objects.all()
    serializer_class = busSeatesSerializer