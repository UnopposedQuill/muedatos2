from django.db import models

## ** AtencionCliente **
class ACCliente(models.Model):
    nombre = models.CharField(max_length=20, blank=True, null=True)
    apellidos = models.CharField(max_length=20, blank=True, null=True)
    fechanacimiento = models.DateField(db_column='fechaNacimiento', blank=True, null=True)  # Field name made lowercase.
    usuario = models.CharField(max_length=30, blank=True, null=True)
    pass_field = models.CharField(db_column='pass', max_length=20, blank=True, null=True)  # Field renamed because it was a Python reserved word.

    class Meta:
        managed = False
        app_label = 'Cliente'
        db_table = 'cliente'


class ACCorreo(models.Model):
    idcliente = models.ForeignKey(ACCliente, models.DO_NOTHING, db_column='idCliente', blank=True, null=True)  # Field name made lowercase.
    correo = models.CharField(max_length=50, blank=True, null=True)
    descripcion = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        app_label = 'Cliente'
        db_table = 'correo'


class ACCupon(models.Model):
    idcliente = models.ForeignKey(ACCliente, models.DO_NOTHING, db_column='idCliente', blank=True, null=True)  # Field name made lowercase.
    idsucursal = models.IntegerField(db_column='idSucursal', blank=True, null=True)  # Field name made lowercase.
    fechaentrega = models.DateField(db_column='fechaEntrega', blank=True, null=True)  # Field name made lowercase.
    dechavencimiento = models.DateField(db_column='dechaVencimiento', blank=True, null=True)  # Field name made lowercase.
    utilizado = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        app_label = 'Cliente'
        db_table = 'cupon'


class ACTelefono(models.Model):
    idcliente = models.ForeignKey(ACCliente, models.DO_NOTHING, db_column='idCliente', blank=True, null=True)  # Field name made lowercase.
    telefono = models.CharField(max_length=16, blank=True, null=True)
    descripcion = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        app_label = 'Cliente'
        db_table = 'telefono'
