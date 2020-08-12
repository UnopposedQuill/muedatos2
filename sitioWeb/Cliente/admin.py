from django.contrib import admin

## ** AtencionCliente **
from .models import ACCliente
admin.site.register(ACCliente)
 
from .models import ACCorreo
admin.site.register(ACCorreo)
 
from .models import ACCupon
admin.site.register(ACCupon)
 
from .models import ACTelefono
admin.site.register(ACTelefono)

