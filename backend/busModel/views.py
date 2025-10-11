from django.shortcuts import render
from rest_framework import viewsets
from .models import *
from .serializers import *

class busModelView(viewsets.ModelViewSet):
    queryset = busModel.objects.all()
    serializer_class = busModelSerializers


