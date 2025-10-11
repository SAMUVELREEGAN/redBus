from rest_framework.routers import DefaultRouter
from .views import *
from django.urls import path , include


router = DefaultRouter()
router.register(r'busseat' , busSeatViewset)

urlpatterns = [
    path('' , include(router.urls))
]