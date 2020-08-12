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
	from (
		select idCliente,ubicacion from [SucursalA].[dbo].[Cliente] where idCliente = @uid
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
create or alter procedure spGetProductos (
	@sid int
)
as begin
	select P.id,P.nombre,P.foto,P.descripcion,P.precio
	from [dbo].[Envio] E inner join  [dbo].[Producto] P on P.id = E.idProducto
	where E.idSucursal=@sid;
end
go

create or alter procedure [dbo].[spGetDetalleProductos](
	@lista VARCHAR(MAX) --una lista separada por comas de los productos
)
as begin
	select P.id, P.nombre, P.descripcion, P.precio
	from (select CAST(value as int) as id from string_split(@lista,',')) L
	inner join [dbo].[Producto] P on L.id=P.id
end
go

create or alter procedure [dbo].[spGetInfoCliente](
	@uid int
)
as begin
	SET NOCOUNT ON
	declare @query varchar(8000);
	set @query = 'select * from openquery(MYSQL,''select C.id as id, T.telefono as telefono, T.descripcion as tel_descripcion, O.correo as correo, O.descripcion as cor_descripcion
	from cliente C
    inner join telefono T on C.id=T.idCliente
    inner join correo O on C.id=O.idCliente
    where C.id='+CAST(@uid as varchar)+''')';
	declare @talbe table(id int,telefono varchar(16), tel_descripcion varchar(20), correo varchar(50), cor_descripcion varchar(20));
	insert into @talbe EXEC (@query);
	select distinct T.id, C.nombre, C.apellidos, T.telefono, T.tel_descripcion, T.correo, T.cor_descripcion, C.ubicacion.Lat as Lat, C.ubicacion.Long as Long
	from @talbe T
	inner join (
		select idCliente,nombre,apellidos,ubicacion from [SucursalA].[dbo].[Cliente] where idCliente = @uid
		UNION ALL
		select idCliente,nombre,apellidos,ubicacion from [SucursalB].[dbo].[Cliente] where idCliente = @uid
		UNION ALL
		select idCliente,nombre,apellidos,ubicacion from [SucursalB].[dbo].[Cliente] where idCliente = @uid
	) as C on T.id=C.idCliente;
end
go

exec [dbo].[spGetInfoCliente] 1