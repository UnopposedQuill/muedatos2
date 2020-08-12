from django.db import models

## ** Taller **
class TColaboradorproducto(models.Model):
    idproducto = models.ForeignKey('TProducto', models.DO_NOTHING, db_column='idProducto')  # Field name made lowercase.
    idempleado = models.ForeignKey('TEmpleado', models.DO_NOTHING, db_column='idEmpleado')  # Field name made lowercase.

    class Meta:
        managed = False
        app_label = 'Taller'
        db_table = 'ColaboradorProducto'

class TEmpleado(models.Model):
    nombre = models.CharField(max_length=30)
    apellido = models.CharField(max_length=30)
    fechacontratacion = models.DateField(db_column='fechaContratacion')  # Field name made lowercase.
    foto = models.TextField()
    salario = models.FloatField()
    idpuesto = models.ForeignKey('TPuesto', models.DO_NOTHING, db_column='idPuesto')  # Field name made lowercase.

    class Meta:
        managed = False
        app_label = 'Taller'
        db_table = 'Empleado'

class TEnvio(models.Model):
    idsucursal = models.ForeignKey('TSucursal', models.DO_NOTHING, db_column='idSucursal')  # Field name made lowercase.
    idproducto = models.ForeignKey('TProducto', models.DO_NOTHING, db_column='idProducto')  # Field name made lowercase.
    fechaenvio = models.DateField(db_column='fechaEnvio')  # Field name made lowercase.
    precioproducto = models.FloatField(db_column='precioProducto')  # Field name made lowercase.
    cantidad = models.IntegerField()

    class Meta:
        managed = False
        app_label = 'Taller'
        db_table = 'Envio'

class TProducto(models.Model):
    nombre = models.CharField(max_length=30)
    descripcion = models.TextField()
    foto = models.TextField()
    precio = models.FloatField()

    class Meta:
        managed = False
        app_label = 'Taller'
        db_table = 'Producto'

class TPuesto(models.Model):
    descripcion = models.CharField(max_length=30)

    class Meta:
        managed = False
        app_label = 'Taller'
        db_table = 'Puesto'

class TSucursal(models.Model):
    nombre = models.CharField(max_length=30)
    #ubicacion = models.GeometryField(geography=True)  # This field type is a guess.

    class Meta:
        managed = False
        app_label = 'Taller'
        db_table = 'Sucursal'
