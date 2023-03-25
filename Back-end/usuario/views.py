from django_filters.rest_framework import DjangoFilterBackend
from requests import request
from cuenta.models import usuario
from usuario.serializers import usuarioSerializer

from rest_framework import viewsets, filters

class userfilterSet(viewsets.ReadOnlyModelViewSet):
    queryset = usuario.objects.all()
    serializer_class = usuarioSerializer

    # Sistema de filtros
    filter_backends = [DjangoFilterBackend,  # edited
                       filters.SearchFilter, filters.OrderingFilter]

    search_fields = ['nombre', 'apellido', 'cedula']
    ordering_fields = ['nombre', 'apellido', 'cedula']






from rest_framework.authtoken.views import ObtainAuthToken


class lgin(selt, request ,*args, **kwargs):
    login_serializer=self.serialier_class(data=request.daata,Contexte={'request':request})
    if(login_serializer.is_valid)