from django.contrib import admin

## sucursalC
 
from .models import SCCliente
admin.site.register(SCCliente)
 
from .models import SCEmpleado
admin.site.register(SCEmpleado)
 
from .models import SCLineaventa
admin.site.register(SCLineaventa)
 
from .models import SCMetodopago
admin.site.register(SCMetodopago)
 
from .models import SCPuesto
admin.site.register(SCPuesto)

from .models import SCVenta
admin.site.register(SCVenta)