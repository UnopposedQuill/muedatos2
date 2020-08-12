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
	select distinct P.id,P.nombre,P.foto,P.descripcion,P.precio
	from [dbo].[Envio] E inner join  [dbo].[Producto] P on P.id = E.idProducto
	where E.idSucursal=@sid
	order by P.id;
end
go

create or alter procedure [dbo].[spGetDetalleProductos](
	@lista VARCHAR(MAX) --una lista separada por comas de los productos
)
as begin
	select  P.id, P.nombre, P.descripcion, P.precio
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
	select distinct T.id, C.nombre, C.apellidos, T.telefono, T.tel_descripcion, T.correo, T.cor_descripcion, C.ubicacion.Lat as Lat, C.ubicacion.Long as Long, C.idMetodoPago, C.descripcion as met_descripcion
	from @talbe T
	inner join (
		select C.idCliente,C.nombre,C.apellidos,C.ubicacion,M.idMetodoPago,M.descripcion from [SucursalA].[dbo].[Cliente] C left outer join [SucursalA].[dbo].[MetodoPago] M on M.idCliente=C.idCliente where C.idCliente = @uid
		UNION ALL
		select C.idCliente,C.nombre,C.apellidos,C.ubicacion,M.idMetodoPago,M.descripcion from [SucursalB].[dbo].[Cliente] C left outer join [SucursalB].[dbo].[MetodoPago] M on M.idCliente=C.idCliente where C.idCliente = @uid
		UNION ALL
		select C.idCliente,C.nombre,C.apellidos,C.ubicacion,M.idMetodoPago,M.descripcion from [SucursalC].[dbo].[Cliente] C left outer join [SucursalC].[dbo].[MetodoPago] M on M.idCliente=C.idCliente where C.idCliente = @uid
	) as C on T.id=C.idCliente;
end
go

create or alter procedure [dbo].[spFacturarWeb](
	@uid int, --user id
	@sid int, --sucursal id
	@mid int, -- metodo de pago del cliente
	@lista varchar(max), --lista de productos separada por coma
	@cip int = NULL --cupon id (si se usa algun cupon)
)
as begin
	-- este debe de insertar en venta una nueva con la informacion del cliente (vease spGetInfoCliente)
	-- y en lineaVenta una linea para cada elemento en la lista
	-- todo esto en la bd respectiva a sid (1, 2 o 3) (hardcodeado)
	if @sid=1
		EXEC [SucursalA].[dbo].[spFacturar] @uid,@sid,@mid,@lista,@cip
	else
		if @sid=2
			EXEC [SucursalB].[dbo].[spFacturar] @uid,@sid,@mid,@lista,@cip
		else
			if @sid=3
				EXEC [SucursalC].[dbo].[spFacturar] @uid,@sid,@mid,@lista,@cip
			else
				select -1 as id, 301 as code, 'Sucursal no encontrada' as detalle
end
go

exec spFacturarWeb 1,1,1,'1,2'