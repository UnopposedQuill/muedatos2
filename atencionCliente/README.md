# AtencionCliente

Esta es la bd de manejo de atencion al cliente, donde se encuentra la informacion de contacto y cupones de descuento.

## Instalacion

En una instancia de MYSQL 8.x se ejecutan los archivos `00_creacionTablas.sql` y `10_inicializacion.sql` en ese orden.

Una vez completado es necesario crear un origen de datos ODBC para esta base en la máquina donde se aloje el servidor MS SQL Server con el nombre `mysql`, otro nombre es válido pero hace falta actualizar el nombre en `@datasrc=` en el archivo `../taller/10_linked server_MYSQL_atencioncliente.sql`.