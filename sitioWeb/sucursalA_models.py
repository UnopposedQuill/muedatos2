# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Cliente(models.Model):
    idcliente = models.AutoField(db_column='idCliente', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(max_length=30)
    apellidos = models.CharField(max_length=30)
    ubicacion = models.TextField()  # This field type is a guess.
    direccion = models.CharField(max_length=120)

    class Meta:
        managed = False
        db_table = 'Cliente'


class Empleado(models.Model):
    idempleado = models.AutoField(db_column='idEmpleado', primary_key=True)  # Field name made lowercase.
    idpuesto = models.ForeignKey('Puesto', models.DO_NOTHING, db_column='idPuesto')  # Field name made lowercase.
    nombre = models.CharField(max_length=30)
    apellidos = models.CharField(max_length=30)
    fechacontratacion = models.DateField(db_column='fechaContratacion')  # Field name made lowercase.
    foto = models.TextField()
    salario = models.FloatField()

    class Meta:
        managed = False
        db_table = 'Empleado'


class Lineaventa(models.Model):
    idlineaventa = models.AutoField(db_column='idLineaVenta', primary_key=True)  # Field name made lowercase.
    idventa = models.ForeignKey('Venta', models.DO_NOTHING, db_column='idVenta')  # Field name made lowercase.
    idproducto = models.ForeignKey('Producto', models.DO_NOTHING, db_column='idProducto')  # Field name made lowercase.
    cantidad = models.IntegerField()
    precio = models.FloatField()

    class Meta:
        managed = False
        db_table = 'LineaVenta'


class Metodopago(models.Model):
    idmetodopago = models.AutoField(db_column='idMetodoPago', primary_key=True)  # Field name made lowercase.
    idcliente = models.ForeignKey(Cliente, models.DO_NOTHING, db_column='idCliente')  # Field name made lowercase.
    descripcion = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'MetodoPago'


class Producto(models.Model):
    idproducto = models.AutoField(db_column='idProducto', primary_key=True)  # Field name made lowercase.
    existencias = models.IntegerField()
    precioactual = models.FloatField(db_column='precioActual')  # Field name made lowercase.
    descripcion = models.TextField()
    foto = models.TextField()
    nombre = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'Producto'


class Puesto(models.Model):
    idpuesto = models.AutoField(db_column='idPuesto', primary_key=True)  # Field name made lowercase.
    descripcion = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'Puesto'


class Venta(models.Model):
    idventa = models.AutoField(db_column='idVenta', primary_key=True)  # Field name made lowercase.
    idempleado = models.ForeignKey(Empleado, models.DO_NOTHING, db_column='idEmpleado')  # Field name made lowercase.
    idcliente = models.ForeignKey(Cliente, models.DO_NOTHING, db_column='idCliente')  # Field name made lowercase.
    idmetodopago = models.ForeignKey(Metodopago, models.DO_NOTHING, db_column='idMetodoPago')  # Field name made lowercase.
    fechaventa = models.DateField(db_column='fechaVenta')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Venta'
