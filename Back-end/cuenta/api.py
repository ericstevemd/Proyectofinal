from .models import cuenta
from rest_framework import viewsets ,permissions
from .serializers import cuentaSerializer
class cuentaviewSet(viewsets.ModelViewSet):
  queryset=cuenta.objects.all()
  permission_classes=[permissions.AllowAny]
  serializer_class=cuentaSerializer
  
