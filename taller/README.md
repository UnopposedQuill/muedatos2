# Taller

Aca se encuentran los archivos para la creacion de la base de datos del Taller

## Instalacion

Para instalar la base debe ejecutar los archivos en el orden indicado por el prefijo: primero el 00_xxx, luego los dos con 10_xx y así.

Si el origen de datos ODBC para la base de datos AtencionCliente no es `mysql` debera de poner el nombre correcto en `10_linked server_MYSQL_atencioncliente.sql` antes de ejecutarlo.

## Importante

Cada uno de los archivos tiene algun comentario con instrucciones o detalles especificos, por favor revisarlo antes de ejecutar cualquier script

Tambien, es necesario que todas las bases esten correctamente instaladas antes de poder ejecutar cualquier procedimiento almacenado.