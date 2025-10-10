from rest_framework import viewsets
from .models import *
from .serializers import *


class BusOwnerViewSet(viewsets.ModelViewSet):
    queryset = busOwner.objects.all()
    serializer_class = busOwnerSerializer