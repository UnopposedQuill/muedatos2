USE [SucursalB]
GO

delete from [dbo].[Cliente]
go

INSERT INTO [dbo].[Cliente]
           ([nombre]
           ,[apellidos]
           ,[ubicacion]
           ,[direccion])
SELECT nombre as nombre, apellidos as apellidos, geography::STGeomFromText('POINT('+CAST(RAND()*120 as VARCHAR)+' '+CAST(RAND()*90 as VARCHAR)+')',4326) as ubicacion, '' as direccion from openquery(MYSQL,'select * from Cliente')
GO
