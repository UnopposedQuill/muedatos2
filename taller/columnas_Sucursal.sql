USE [Taller]
GO

INSERT INTO [dbo].[Sucursal]
           ([nombre]
           ,[ubicacion])
     VALUES
           ('A',geography::STGeomFromText('POINT(123.33 45.123)',4326)),
           ('B',geography::STGeomFromText('POINT(98.254 12.001)',4326)),
           ('C',geography::STGeomFromText('POINT(43.43 43.43)',4326))
GO


