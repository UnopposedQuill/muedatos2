use SucursalC;
go

--clientes
INSERT INTO [dbo].[Cliente] ([nombre],[apellidos],[ubicacionLat],[ubicacionLong],[direccion])
SELECT nombre as nombre, apellidos as apellidos, RAND()*120 as ubicacionLat, RAND()*90 as ubicacionLong, '' as direccion from openquery(MYSQL,'select * from Cliente')
GO

insert into dbo.Puesto (descripcion) values ('Sistema')
go

insert into dbo.Empleado (idPuesto,nombre,apellidos,fechaContratacion,foto,salario)
values (1,'SYS','','1997-12-12','no-foto',0.00)
go

insert into [dbo].[MetodoPago] (idCliente,descripcion)
select idCliente,'Efectivo' from [dbo].[Cliente];
go