from cuenta.models import negocio
from rest_framework import viewsets ,permissions
from negocio.serializers import negocioSerializer
class negocioviewset(viewsets.ModelViewSet):
  queryset=negocio.objects.all()
  permission_classes=[permissions.AllowAny]
  serializer_class=negocioSerializer
  
