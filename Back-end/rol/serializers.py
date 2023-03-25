from rest_framework import serializers
from cuenta.models import rol


class rolSerializer(serializers.ModelSerializer):
    class Meta:
        model=rol
        fields=('id','rol')
        read_only_fields=('created_at' ,)