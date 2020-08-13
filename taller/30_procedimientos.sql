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
	select @ubicacion=geography::STGeomFromText('POINT('+CAST(C.ubicacionLat as VARCHAR)+' '+CAST(C.ubicacionLong as VARCHAR)+')',4326)
	from (
		select idCliente,ubicacionLat,ubicacionLong from [SucursalA].[dbo].[Cliente] where idCliente = @uid
		UNION ALL
		select idCliente,ubicacionLat,ubicacionLong from [SucursalB].[dbo].[Cliente] where idCliente = @uid
		UNION ALL
		select idCliente,ubicacionLat,ubicacionLong from [SucursalB].[dbo].[Cliente] where idCliente = @uid
	) as C
	select id,nombre
	from [dbo].[Sucursal]
	order by @ubicacion.STDistance(geography::STGeomFromText('POINT('+CAST(ubicacionLat as VARCHAR)+' '+CAST(ubicacionLong as VARCHAR)+')',4326)) ASC;
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
	select distinct T.id, C.nombre, C.apellidos, T.telefono, T.tel_descripcion, T.correo, T.cor_descripcion, C.ubicacionLat as Lat, C.ubicacionLong as Long, C.idMetodoPago, C.descripcion as met_descripcion
	from @talbe T
	inner join (
		select C.idCliente,C.nombre,C.apellidos,C.ubicacionLat,C.ubicacionLong,M.idMetodoPago,M.descripcion from [SucursalA].[dbo].[Cliente] C left outer join [SucursalA].[dbo].[MetodoPago] M on M.idCliente=C.idCliente where C.idCliente = @uid
		UNION ALL
		select C.idCliente,C.nombre,C.apellidos,C.ubicacionLat,C.ubicacionLong,M.idMetodoPago,M.descripcion from [SucursalB].[dbo].[Cliente] C left outer join [SucursalB].[dbo].[MetodoPago] M on M.idCliente=C.idCliente where C.idCliente = @uid
		UNION ALL
		select C.idCliente,C.nombre,C.apellidos,C.ubicacionLat,C.ubicacionLong,M.idMetodoPago,M.descripcion from [SucursalC].[dbo].[Cliente] C left outer join [SucursalC].[dbo].[MetodoPago] M on M.idCliente=C.idCliente where C.idCliente = @uid
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

create or alter procedure [dbo].[spGetInformacionVenta](
	@uid int, @sid int, @vid int
)
as begin
	SET NOCOUNT ON
	declare @venta table(idVenta int, idEmpleado int, idCliente int, descripcion varchar(20), fechaVenta date, reciboConforme XML, idProducto int, nombre varchar(30), precio float);
	if @sid=1
		insert into @venta
		select V.idVenta, V.idEmpleado, V.idCliente, M.descripcion, V.fechaVenta, V.reciboConforme, L.idProducto,P.nombre, L.precio
		from [SucursalA].[dbo].[Venta] V
		inner join [SucursalA].[dbo].[LineaVenta] L on V.idVenta = L.idVenta
		inner join [Taller].[dbo].[Producto] P on L.idProducto=P.id
		inner join [SucursalA].[dbo].[MetodoPago] M on V.idMetodoPago=M.idMetodoPago
		where V.idVenta = @vid and V.idCliente = @uid
	else if @sid=2
		insert into @venta
		select V.idVenta, V.idEmpleado, V.idCliente, M.descripcion, V.fechaVenta, V.reciboConforme, L.idProducto, P.nombre, L.precio
		from [SucursalB].[dbo].[Venta] V
		inner join [SucursalB].[dbo].[LineaVenta] L on V.idVenta = L.idVenta
		inner join [Taller].[dbo].[Producto] P on L.idProducto=P.id
		inner join [SucursalB].[dbo].[MetodoPago] M on V.idMetodoPago=M.idMetodoPago
		where V.idVenta = @vid and V.idCliente = @uid
	else if @sid=3
		insert into @venta
		select V.idVenta, V.idEmpleado, V.idCliente, M.descripcion, V.fechaVenta, V.reciboConforme, L.idProducto,P.nombre, L.precio
		from [SucursalC].[dbo].[Venta] V
		inner join [SucursalC].[dbo].[LineaVenta] L on V.idVenta = L.idVenta
		inner join [Taller].[dbo].[Producto] P on L.idProducto=P.id
		inner join [SucursalC].[dbo].[MetodoPago] M on V.idMetodoPago=M.idMetodoPago
		where V.idVenta = @vid and V.idCliente = @uid
	SELECT idVenta as Venta, idEmpleado as Empleado, idCliente as Cliente, descripcion as Pago, fechaVenta as Fecha, reciboConforme as Recibo, idProducto, nombre as Producto, precio as Precio  FROM @venta
end
go

create or alter procedure spEvaluarVenta(
	@uid int, @sid int, @vid int, @xml xml
)
as begin
	if @sid=1
		update [SucursalA].[dbo].[Venta]
		set reciboConforme = @xml
		where idVenta=@vid and idCliente=@uid
	else if @sid=2
		update [SucursalB].[dbo].[Venta]
		set reciboConforme = @xml
		where idVenta=@vid and idCliente=@uid
	else if @sid=3
		update [SucursalC].[dbo].[Venta]
		set reciboConforme = @xml
		where idVenta=@vid and idCliente=@uid
end
go

create or alter procedure spConsultarVentas(
	@pid int = null, @eid int = null, @sid int = null, @finicio date = null, @ffin date = null
)
as begin
	declare @venta table(idSucursal int, idVenta int, idEmpleado int, idCliente int, descripcion varchar(20), fechaVenta date, reciboConforme XML, idProducto int, nombre varchar(30), precio float);
	insert into @venta
		select 1 as idSucursal, V.idVenta, V.idEmpleado, V.idCliente, M.descripcion, V.fechaVenta, V.reciboConforme, L.idProducto,P.nombre, L.precio
		from [SucursalA].[dbo].[Venta] V
		inner join [SucursalA].[dbo].[LineaVenta] L on V.idVenta = L.idVenta
		inner join [Taller].[dbo].[Producto] P on L.idProducto=P.id
		inner join [SucursalA].[dbo].[MetodoPago] M on V.idMetodoPago=M.idMetodoPago
		where V.idEmpleado = ISNULL(@eid,V.idEmpleado) 
			and L.idProducto = ISNULL(@pid,L.idProducto)
			and V.fechaVenta BETWEEN ISNULL(@finicio,V.fechaVenta) and ISNULL(@ffin,V.fechaVenta)
		UNION all
		select 2 as idSucursal, V.idVenta, V.idEmpleado, V.idCliente, M.descripcion, V.fechaVenta, V.reciboConforme, L.idProducto, P.nombre, L.precio
		from [SucursalB].[dbo].[Venta] V
		inner join [SucursalB].[dbo].[LineaVenta] L on V.idVenta = L.idVenta
		inner join [Taller].[dbo].[Producto] P on L.idProducto=P.id
		inner join [SucursalB].[dbo].[MetodoPago] M on V.idMetodoPago=M.idMetodoPago
		where V.idEmpleado = ISNULL(@eid,V.idEmpleado) 
			and L.idProducto = ISNULL(@pid,L.idProducto)
			and V.fechaVenta BETWEEN ISNULL(@finicio,V.fechaVenta) and ISNULL(@ffin,V.fechaVenta)
		union all
		select 3 as idSucursal, V.idVenta, V.idEmpleado, V.idCliente, M.descripcion, V.fechaVenta, V.reciboConforme, L.idProducto,P.nombre, L.precio
		from [SucursalC].[dbo].[Venta] V
		inner join [SucursalC].[dbo].[LineaVenta] L on V.idVenta = L.idVenta
		inner join [Taller].[dbo].[Producto] P on L.idProducto=P.id
		inner join [SucursalC].[dbo].[MetodoPago] M on V.idMetodoPago=M.idMetodoPago
		where V.idEmpleado = ISNULL(@eid,V.idEmpleado) 
			and L.idProducto = ISNULL(@pid,L.idProducto)
			and V.fechaVenta BETWEEN ISNULL(@finicio,V.fechaVenta) and ISNULL(@ffin,V.fechaVenta)
	SELECT idSucursal as Sucursal, idVenta as Venta, idEmpleado as Empleado, idCliente as Cliente, descripcion as Pago, fechaVenta as Fecha, reciboConforme as Recibo, idProducto, nombre as Producto, precio as Precio
	FROM @venta where idSucursal = ISNULL(@sid,idSucursal)

end
go

create or alter procedure spConsultarGanacias(
	@pid int = null, @sid int = null, @finicio date = null, @ffin date = null
)
as begin
	declare @venta table(idSucursal int, idVenta int, fechaVenta date, idProducto int, precio float,porcentajeComision float);
	insert into @venta
		select 1 as idSucursal, V.idVenta, V.fechaVenta, L.idProducto, L.precio,V.porcentajeComision
		from [SucursalA].[dbo].[Venta] V
		inner join [SucursalA].[dbo].[LineaVenta] L on V.idVenta = L.idVenta
		where L.idProducto = ISNULL(@pid,L.idProducto)
			and V.fechaVenta BETWEEN ISNULL(@finicio,V.fechaVenta) and ISNULL(@ffin,V.fechaVenta)
		UNION all
		select 2 as idSucursal, V.idVenta, V.fechaVenta, L.idProducto, L.precio,V.porcentajeComision
		from [SucursalB].[dbo].[Venta] V
		inner join [SucursalB].[dbo].[LineaVenta] L on V.idVenta = L.idVenta
		where L.idProducto = ISNULL(@pid,L.idProducto)
			and V.fechaVenta BETWEEN ISNULL(@finicio,V.fechaVenta) and ISNULL(@ffin,V.fechaVenta)
		union all
		select 3 as idSucursal, V.idVenta, V.fechaVenta, L.idProducto, L.precio,V.porcentajeComision
		from [SucursalC].[dbo].[Venta] V
		inner join [SucursalC].[dbo].[LineaVenta] L on V.idVenta = L.idVenta
		where L.idProducto = ISNULL(@pid,L.idProducto)
			and V.fechaVenta BETWEEN ISNULL(@finicio,V.fechaVenta) and ISNULL(@ffin,V.fechaVenta)
	SELECT idSucursal as Sucursal, idVenta as Venta, fechaVenta as Fecha, idProducto, SUM(precio) as Neto, SUM(precio*(100-porcentajeComision)/100) as Ganancia
	FROM @venta where idSucursal = ISNULL(@sid,idSucursal)
	GROUP BY ROLLUP(idSucursal, idVenta, fechaVenta, idProducto)
end
go
