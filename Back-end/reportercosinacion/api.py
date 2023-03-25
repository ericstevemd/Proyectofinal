from cuenta.models import transaccion
from rest_framework import viewsets ,permissions
from reportercosinacion.serializers import reporteSerializer
class reporteviewSet(viewsets.ModelViewSet):
  queryset=transaccion.objects.all()
  permission_classes=[permissions.AllowAny]
  serializer_class=reporteSerializer
  

