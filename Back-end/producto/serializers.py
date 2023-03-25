from rest_framework import serializers
from cuenta.models import producto


class porductoSerializer(serializers.ModelSerializer):
    class Meta:
        model=producto
        fields=('detalle1','detalle2','precio','imag','fecha')
        read_only_fields=('created_at',)