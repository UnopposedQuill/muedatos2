USE SucursalC
go

create or alter procedure [dbo].[spFacturar](
	@uid int, --user id
	@sid int, --sucursal id
	@mid int, -- metodo de pago del cliente
	@lista varchar(max), --lista de productos separada por coma
	@cip int = NULL, --cupon id (si se usa algun cupon)
	@eip int = 1 --id empleado, 1 es el sistema (venta en linea), valor por defecto
)
as begin
	SET NOCOUNT ON;
	BEGIN TRANSACTION;
	BEGIN TRY

		insert into [dbo].[Venta] (idEmpleado,idCliente,idMetodoPago,fechaVenta,reciboConforme,porcentajeComision)
		select @eip,@uid,@mid,GETDATE(),null,E.comision
		from dbo.Empleado E where @eip=E.idEmpleado;

		declare @venta int
		set @venta = SCOPE_IDENTITY()

		insert into [dbo].[LineaVenta] (idVenta,idProducto,cantidad,precio)
		select @venta,P.id,1,P.precio
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
		SELECT @venta,200,'Compra registrada';
end
go