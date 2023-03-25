from rest_framework  import routers
from .api import usuarioviewSet

router=routers.DefaultRouter()

router.register('api/usuario',usuarioviewSet, 'usuario')


urlpatterns = router.urls


