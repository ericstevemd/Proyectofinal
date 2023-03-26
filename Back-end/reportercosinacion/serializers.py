from rest_framework import serializers
from cuenta.models import transaccion


class reporteSerializer(serializers.ModelSerializer):
    class Meta:
        model=transaccion
        fields=('id','idusuario','idcuenta','idproducto','idnegocio','valora','foto','numerodecomporbantes','bancoorige','estado','titularbanco','tipo_cuenta','descricion')
        read_only_fields=('created_at' ,)