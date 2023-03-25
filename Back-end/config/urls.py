from django.urls import path, include
from django.conf.urls.static import static
from django.conf  import settings



urlpatterns = [
      path('', include('cuenta.urls')),
      path('', include('producto.urls')),
      path('', include('reportercosinacion.urls')),
      path('', include('rol.urls')), 
      path('', include('negocio.urls')),
      path('', include('usuario.urls')), 



]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
