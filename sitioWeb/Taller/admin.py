from django.contrib import admin

## ** Taller **
from .models import TColaboradorproducto
admin.site.register(TColaboradorproducto)
 
from .models import TEmpleado
admin.site.register(TEmpleado)
 
from .models import TEnvio
admin.site.register(TEnvio)
 
from .models import TProducto
admin.site.register(TProducto)
 
from .models import TPuesto
admin.site.register(TPuesto)
 
from .models import TSucursal
admin.site.register(TSucursal)
