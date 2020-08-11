USE [SucursalA]
GO


INSERT INTO [dbo].[Cliente]
           ([nombre]
           ,[apellidos]
           ,[ubicacion]
           ,[direccion])
SELECT nombre as nombre, apellidos as apellidos, geography::STGeomFromText('POINT(103.33 35.123)',4326) as ubicacion, '' as direccion from openquery(MYSQL,'select * from Cliente')
GO


