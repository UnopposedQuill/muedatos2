USE SucursalB
go

create or alter procedure [dbo].[spFacturar](
	@uid int, --user id
	@sid int, --sucursal id
	@mid int, -- metodo de pago del cliente
	@lista varchar(max), --lista de productos separada por coma
	@cid int = NULL, --cupon id (si se usa algun cupon)
	@eid int = 1 --id empleado, 1 es el sistema (venta en linea), valor por defecto
)
as begin
	SET NOCOUNT ON;
	BEGIN TRANSACTION;
	BEGIN TRY
		
		declare @descuento float;
		declare @query varchar(8000);
		if @cid is not null
			begin
				declare @table table(valor float);
				set @query = 'select valor from openquery(MYSQL,''select valor from cupon where id='+CAST(@cid as varchar)+''')';
				insert into @table EXEC (@query);
				select @descuento=valor from @table;
			end
		else
		begin
			set @descuento = 0;
		end
		
		insert into [dbo].[Venta] (idEmpleado,idCliente,idMetodoPago,fechaVenta,reciboConforme,porcentajeComision)
		select @eid,@uid,@mid,GETDATE(),null,E.comision
		from dbo.Empleado E where @eid=E.idEmpleado;

		declare @venta int
		set @venta = SCOPE_IDENTITY()

		insert into [dbo].[LineaVenta] (idVenta,idProducto,cantidad,precio)
		select @venta,P.id,1,P.precio*(100-@descuento)/100 -- voy a guardar el valor con descuento, otra opcion seria almacenar una columna mas con el valor de descuento
		from (select value as id from string_split(@lista,',')) as L
		inner join [Taller].[dbo].[Producto] as P on L.id=P.id
		

	END TRY
	BEGIN CATCH
		/*SELECT
			ERROR_NUMBER() AS ErrorNumber
			,ERROR_SEVERITY() AS ErrorSeverity
			,ERROR_STATE() AS ErrorState
			,ERROR_PROCEDURE() AS ErrorProcedure
			,ERROR_LINE() AS ErrorLine
			,ERROR_MESSAGE() AS ErrorMessage;*/
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
			SELECT -1,-1,'Ocurrio un error registrando la compra:\n'+ERROR_MESSAGE();
	END CATCH;
	IF @@TRANCOUNT > 0  
		COMMIT TRANSACTION;
		--tiene que ir fuera de la transaccion pues el driver odbc no permite transacciones distribuidas entre bases
		if @cid is not null
		begin
			set @query = 'update openquery(MYSQL,''select utilizado,id from cupon where id='+CAST(@cid as varchar)+''')
			set utilizado = CAST(1 as bit)'; --update de otra tabla en otro server, muy importante id tiene que ir en la lista del select
			--otra cosa, en los data source del odbc, en details>cursors|results, deben marcar "Return matched rows instead of affected rows"
			EXEC (@query);
		end
		SELECT @venta,200,'Compra registrada';
end
go