from rest_framework  import routers
from reportercosinacion.api import reporteviewSet
router=routers.DefaultRouter()

router.register('api/historial',reporteviewSet, 'historial')


urlpatterns = router.urls