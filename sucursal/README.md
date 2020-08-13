# Sucursales

En cada una de estas carpetas se encuentran los archivos de creacion e inicalizacion de las tres bases de datos de sucursales.

## Instalacion

Para instalar nada mas abra los archivos de cada una de las sucursales y los ejecuta en el orden indicado por el prefijo: `00_creacionTablas.sql`, `10_inicializacion.sql`, `20_procedimientos.sql`.

Antes de ejecutar cualquier procedimiento almacena es necesario que el conector ODBC con la base de datos para AtencionCliente este correctamente configurado, por lo que debe ejecutar el _script_ `../taller/10_linked server_MYSQL_atencioncliente.sql`