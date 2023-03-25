from rest_framework  import routers
from .api import cuentaviewSet
router=routers.DefaultRouter()

router.register('api/cuenta',cuentaviewSet, 'cuentas')


urlpatterns = router.urls
