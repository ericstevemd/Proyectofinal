from rest_framework import serializers
from cuenta.models import usuario


class usuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model=usuario
        fields=('rol','nombre','apellido','cedula','user','clave','telefono','correo','direccion')
        read_only_fields=('created_at' ,)

