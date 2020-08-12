# Sitio web para compras

## Instalacion

La configuracion de las bases de datos se explica por aparte

Se asume que tiene python 3.8 o superior instalado, version 64 bits

#. Instalar Django: `pip install django`, en el proyecto se uso Django 3.1
#. Instalar los drivers para poder conectarse a las bd
	#. SQLServer: `pip install django-mssql-backend`
	#. MSSQL: `pip install mysqlclient`

## Ejecutar

Una vez los paquetes necesarios se han intalado se puede ejecutar el programa: `python manage.py runserver`

Si no hay errores la consola mostrará algo similar a
```
Django version 3.1, using settings 'sitioweb.settings'
Starting development server at http://127.0.0.1:8000/
Quit the server with CTRL-BREAK.
```

En cuyo caso solo resta ir a la direccion web `127.0.0.1:8000` o `localhost:8000` y la app ya se puede usar. 
