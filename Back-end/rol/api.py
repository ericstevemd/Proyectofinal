from cuenta.models import rol
from rest_framework import viewsets ,permissions
from .serializers import rolSerializer
class rolviewSet(viewsets.ModelViewSet):
  queryset=rol.objects.all()
  permission_classes=[permissions.AllowAny]
  serializer_class=rolSerializer
  

