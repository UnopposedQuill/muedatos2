from django.db import models

## SucursalB
class SBCliente(models.Model):
    idcliente = models.AutoField(db_column='idCliente', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(max_length=30)
    apellidos = models.CharField(max_length=30)
    ubicacion = models.TextField()  # This field type is a guess.
    direccion = models.CharField(max_length=120)

    class Meta:
        managed = False
        app_label = 'SucursalB'
        db_table = 'Cliente'


class SBEmpleado(models.Model):
    idempleado = models.AutoField(db_column='idEmpleado', primary_key=True)  # Field name made lowercase.
    idpuesto = models.ForeignKey('SBPuesto', models.DO_NOTHING, db_column='idPuesto')  # Field name made lowercase.
    nombre = models.CharField(max_length=30)
    apellidos = models.CharField(max_length=30)
    fechacontratacion = models.DateField(db_column='fechaContratacion')  # Field name made lowercase.
    foto = models.TextField()
    salario = models.FloatField()

    class Meta:
        managed = False
        app_label = 'SucursalB'
        db_table = 'Empleado'


class SBLineaventa(models.Model):
    idlineaventa = models.AutoField(db_column='idLineaVenta', primary_key=True)  # Field name made lowercase.
    idventa = models.ForeignKey('SBVenta', models.DO_NOTHING, db_column='idVenta')  # Field name made lowercase.
    idproducto = models.IntegerField(db_column='idProducto')  # Field name made lowercase.
    cantidad = models.IntegerField()
    precio = models.FloatField()

    class Meta:
        managed = False
        app_label = 'SucursalB'
        db_table = 'LineaVenta'


class SBMetodopago(models.Model):
    idmetodopago = models.AutoField(db_column='idMetodoPago', primary_key=True)  # Field name made lowercase.
    idcliente = models.ForeignKey(SBCliente, models.DO_NOTHING, db_column='idCliente')  # Field name made lowercase.
    descripcion = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        app_label = 'SucursalB'
        db_table = 'MetodoPago'


class SBPuesto(models.Model):
    idpuesto = models.AutoField(db_column='idPuesto', primary_key=True)  # Field name made lowercase.
    descripcion = models.CharField(max_length=30)

    class Meta:
        managed = False
        app_label = 'SucursalB'
        db_table = 'Puesto'


class SBVenta(models.Model):
    idventa = models.AutoField(db_column='idVenta', primary_key=True)  # Field name made lowercase.
    idempleado = models.ForeignKey(SBEmpleado, models.DO_NOTHING, db_column='idEmpleado')  # Field name made lowercase.
    idcliente = models.ForeignKey(SBCliente, models.DO_NOTHING, db_column='idCliente')  # Field name made lowercase.
    idmetodopago = models.ForeignKey(SBMetodopago, models.DO_NOTHING, db_column='idMetodoPago')  # Field name made lowercase.
    fechaventa = models.DateField(db_column='fechaVenta')  # Field name made lowercase.
    reciboconforme = models.TextField(db_column='reciboConforme', blank=True, null=True)  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        app_label = 'SucursalB'
        db_table = 'Venta'
