from rest_framework  import routers
from producto.api import productoviewSet
router=routers.DefaultRouter()

router.register('api/producto',productoviewSet, 'producto')


urlpatterns = router.urls