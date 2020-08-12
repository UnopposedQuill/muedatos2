from django.contrib import admin

## SucursalA
from .models import SACliente
admin.site.register(SACliente)
 
from .models import SAEmpleado
admin.site.register(SAEmpleado)
 
from .models import SALineaventa
admin.site.register(SALineaventa)
 
from .models import SAMetodopago
admin.site.register(SAMetodopago)
 
from .models import SAPuesto
admin.site.register(SAPuesto)
 
from .models import SAVenta
admin.site.register(SAVenta)
