from cuenta.models import usuario
from rest_framework import viewsets ,permissions
from .serializers import usuarioSerializer
from django_filters.rest_framework import DjangoFilterBackend
class usuarioviewSet(viewsets.ModelViewSet):
  queryset=usuario.objects.all()
  permission_classes=[permissions.AllowAny]
  serializer_class=usuarioSerializer
  filter_backends = [DjangoFilterBackend]
  filterset_fields = ['nombre', 'apellido', 'cedula']

