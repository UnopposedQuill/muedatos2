USE TALLER
GO

create or alter procedure spLogin (
	@uid varchar(30),
	@pwd VARCHAR(20)
)
as begin
	declare @query varchar(8000);
	set @query = 'select COUNT(id) as SC, ISNULL(MIN(id),-1) as ID from openquery(MYSQL,''select id from cliente where usuario ='''''+@uid+''''' and  pass='''''+@pwd+''''''')';
	EXEC (@query);
end
go

--retorna las sucursales ordenadas por distancia al cliente
-- esta todo hardcodeado, abría que cambiarlo por algo mejor
create or alter procedure spGetSucursales (
	@uid int
)
as begin
	declare @ubicacion geography;
	select @ubicacion=C.ubicacion
	from ( select idCliente,ubicacion from [SucursalA].[dbo].[Cliente] where idCliente = @uid
	UNION ALL
	select idCliente,ubicacion from [SucursalB].[dbo].[Cliente] where idCliente = @uid
	UNION ALL
	select idCliente,ubicacion from [SucursalB].[dbo].[Cliente] where idCliente = @uid
	) as C
	select id,nombre
	from [dbo].[Sucursal]
	order by ubicacion.STDistance(@ubicacion) ASC;
end
go

--retorna los productos de la sucursal con el id sid
--de momento retorna todos los prods del taller solo para poder probar cosas
create or alter procedure spGetProductos (
	@sid int
)
as begin
	select *
	from [dbo].[Producto];
	-- la verdad hay que hacer algo con sql dinamico
	-- obtener el nombre de la bd, y el query algo como @query = 'select * from [Sucursal'+@nombre+'].[dbo].[Productos]'; exec (@query)
end
go
