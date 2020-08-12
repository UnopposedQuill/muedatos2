from django.contrib import admin

## sucursalB
from .models import SBCliente
admin.site.register(SBCliente)
 
from .models import SBEmpleado
admin.site.register(SBEmpleado)

from .models import SBLineaventa
admin.site.register(SBLineaventa)
 
from .models import SBMetodopago
admin.site.register(SBMetodopago)
 
from .models import SBPuesto
admin.site.register(SBPuesto)
 
from .models import SBVenta
admin.site.register(SBVenta)
