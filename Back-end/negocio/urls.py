from rest_framework  import routers
from negocio.api import negocioviewset
router=routers.DefaultRouter()

router.register('api/negocio',negocioviewset,'negocio')


urlpatterns = router.urls