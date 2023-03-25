from rest_framework import serializers
from cuenta.models import negocio


class negocioSerializer(serializers.ModelSerializer):
    class Meta:
        model=negocio
        fields=('ruc','nombre','direccion','telefono','fotodenegocio','correo','paginaweb')
        read_only_fields=('created_at',)