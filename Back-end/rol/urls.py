from rest_framework  import routers
from .api import rolviewSet
router=routers.DefaultRouter()

router.register('api/rol',rolviewSet, 'rol')


urlpatterns = router.urls