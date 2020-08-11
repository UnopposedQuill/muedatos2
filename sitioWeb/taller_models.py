# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Colaboradorproducto(models.Model):
    idproducto = models.ForeignKey('Producto', models.DO_NOTHING, db_column='idProducto')  # Field name made lowercase.
    idempleado = models.ForeignKey('Empleado', models.DO_NOTHING, db_column='idEmpleado')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'ColaboradorProducto'


class Empleado(models.Model):
    nombre = models.CharField(max_length=30)
    apellido = models.CharField(max_length=30)
    fechacontratacion = models.DateField(db_column='fechaContratacion')  # Field name made lowercase.
    foto = models.TextField()
    salario = models.FloatField()
    idpuesto = models.ForeignKey('Puesto', models.DO_NOTHING, db_column='idPuesto')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Empleado'


class Envio(models.Model):
    idsucursal = models.ForeignKey('Sucursal', models.DO_NOTHING, db_column='idSucursal')  # Field name made lowercase.
    fechaenvio = models.DateField(db_column='fechaEnvio')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Envio'


class Lote(models.Model):
    cantidad = models.IntegerField(blank=True, null=True)
    precioproducto = models.FloatField(db_column='precioProducto')  # Field name made lowercase.
    idenvio = models.ForeignKey(Envio, models.DO_NOTHING, db_column='idEnvio')  # Field name made lowercase.
    idproducto = models.ForeignKey('Producto', models.DO_NOTHING, db_column='idProducto')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Lote'


class Producto(models.Model):
    nombre = models.CharField(max_length=30)
    descripcion = models.TextField()
    foto = models.TextField()
    precio = models.FloatField()

    class Meta:
        managed = False
        db_table = 'Producto'


class Puesto(models.Model):
    descripcion = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'Puesto'


class Sucursal(models.Model):
    nombre = models.CharField(max_length=30)
    ubicacion = models.TextField()  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'Sucursal'
