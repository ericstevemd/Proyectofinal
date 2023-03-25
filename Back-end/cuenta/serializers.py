from rest_framework import serializers
from cuenta.models import cuenta


class cuentaSerializer(serializers.ModelSerializer):
    class Meta:
        model=cuenta
        fields=('tipocuenta','nombrebanco','numerocuenta')
    