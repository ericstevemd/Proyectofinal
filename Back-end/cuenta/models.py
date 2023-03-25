from django.db import models


class rol(models.Model):
    rol=models.CharField(max_length=20,blank=True, name='rol')
   

    class Meta:
        db_table = 'tb_rol'

class usuario (models.Model):
    rol=models.ForeignKey(rol,on_delete=models.CASCADE,null=False,blank=False,related_name='usurioarol')
    nombre=models.CharField(max_length=100,blank=True,name='nombre')
    apellido=models.CharField(max_length=100,blank=True,name='apellido')
    cedula=models.CharField(max_length=100,blank=True,name='cedula')
    user=models.CharField(max_length=100,blank=True,name='user')
    clave=models.CharField(max_length=100,blank=True,name='clave')
    telefono=models.CharField(max_length=100,blank=True,name='telefono')
    correo=models.CharField(max_length=100,blank=True,name='correo')
    direccion=models.CharField(max_length=100,blank=True,name='direccion')

    class Meta:
        db_table = 'tb_usuario'

class cuenta(models.Model):
   
    nombrebanco=models.CharField(max_length=30, blank=True,name='nombrebanco')
    numerocuenta=models.CharField(max_length=30, blank=True,name='numerocuenta')
    tipocuenta=models.CharField(max_length=30, blank=True,name='tipocuenta')

    class Meta:
        db_table = 'tb_cuenta'

class producto(models.Model):
    detalle1=models.CharField(max_length=100,blank=True,name='detalle1')
    detalle2=models.CharField(max_length=100,blank=True,name='detalle2')
    precio=models.DecimalField( max_digits=5, decimal_places=2,name='precio')
    imag=models.ImageField(blank='',default='',upload_to='fotos/',name='imag')
    fecha=models.DateTimeField(auto_now_add=True, name='fecha')
    
    
    class Meta:
        db_table = 'tb_producto'

class negocio(models.Model):
        ruc =models.CharField(max_length=13,blank=True,name='ruc')
        nombre =models.CharField(max_length=150,blank=True,name='nombre')
        direccion  =models.CharField(max_length=200,blank=True,name='direccion')
        telefono =models.CharField(max_length=10,blank=True,name='telefono')
        fotodenegocio =models.ImageField(blank='',default='',upload_to='fotos/',name='fotodenegocio')
        correo =models.CharField(max_length=50,blank=True,name='correo')
        paginaweb =models.CharField(max_length=100,blank=True,name='paginaweb')

        class Meta:
            db_table = 'negocio'





class transaccion(models.Model):
    
    idcuenta=models.ForeignKey(cuenta,on_delete=models.CASCADE,null=False,blank=False,related_name='idcuenta')  
    idproducto=models.ForeignKey(producto,on_delete=models.CASCADE,null=False,blank=False,related_name='idproducto') 
    idusuario=models.ForeignKey(usuario,on_delete=models.CASCADE,null=False,blank=False,related_name='idusuario') 
    idnegocio=models.ForeignKey(negocio,on_delete=models.CASCADE,null=False,blank=False,related_name='idnegocio')  
    valora=models.DecimalField(max_digits=5, decimal_places=2,name='valora')
    fecha=models.DateTimeField(auto_now_add=True, name='fecha',)
    foto=models.ImageField(upload_to='fotos/',name='foto')
    numerodecomporbantes=models.CharField(max_length=100,blank=True,name='numerodecomporbantes')
    tipo=models.CharField(max_length=100,blank=True,name='tipo_cuenta')
    descricion=models.CharField(max_length=300,blank=True,name='descricion')
    bancoorige=models.CharField(max_length=100,blank=True,name='bancoorige')
    estado=models.CharField(max_length=30,blank=True,name='estado')
    titularbanco=models.CharField(max_length=100,blank=True,name='titularbanco')

   
   
    class Meta:
        db_table = 'tb_transaccion'