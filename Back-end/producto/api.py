from cuenta.models import producto
from rest_framework import viewsets ,permissions
from producto.serializers import porductoSerializer
class productoviewSet(viewsets.ModelViewSet):
  queryset=producto.objects.all()
  permission_classes=[permissions.AllowAny]
  serializer_class=porductoSerializer
  
