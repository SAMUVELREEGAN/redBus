from django.shortcuts import render
from rest_framework import viewsets
from .serializers import *
from .models import *

class SeatModelViewset(viewsets.ModelViewSet):
    queryset = seatModel.objects.all()
    serializer_class = seatSerilaizer