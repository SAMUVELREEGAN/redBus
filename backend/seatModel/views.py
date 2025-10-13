from rest_framework import viewsets
from .models import *
from .serializers import *

class SeatModelViewSet(viewsets.ModelViewSet):
    serializer_class = seatSerilaizer
    queryset = seatModel.objects.all()

    # ✅ Filter by busId to isolate each bus's seats
    def get_queryset(self):
        queryset = super().get_queryset()
        bus_id = self.request.query_params.get('busId')
        if bus_id:
            queryset = queryset.filter(busId__id=bus_id)
        return queryset
