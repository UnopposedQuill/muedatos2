-- tablas independientes

CREATE TABLE dbo.Producto(
	idProducto INT IDENTITY (1,1) Primary Key,
	nombreProducto varchar(30) NOT NULL,
	descripcionProducto varchar(MAX) NOT NULL,
	fotoProducto varchar(MAX) NOT NULL,
	precioProducto float NOT NULL
);
-- nota: IDENTITY (1,1) es el equivalente a auto_increment en SQL Server

CREATE TABLE dbo.Puesto(
	idPuesto INT IDENTITY (1,1) Primary key,
	descripcionPuesto varchar(30) NOT NULL
);

-- tablas dependientes

CREATE TABLE dbo.EnvioSucursal(
	idEnvio INT IDENTITY (1,1) Primary Key,
	idProducto INT NOT NULL,
	fechaEnvio DATE NOT NULL,
	precioProducto float NOT NULL,
	idSucursal int NOT NULL,
	CONSTRAINT FK_Envio_X_Producto
		FOREIGN KEY (idProducto)
		REFERENCES dbo.Producto (idProducto)
);

-- nota: falta particionar el registro idSucursal

CREATE TABLE dbo.Empleado(
	idEmpleado INT IDENTITY (1,1) Primary Key,
	idPuesto INT NOT NULL,
	nombreEmpleado varchar(30) NOT NULL,
	apellidoEmpleado varchar(30) NOT NULL,
	fechaContratacion DATE NOT NULL,
	foto varchar(MAX) NOT NULL,
	salarioEmpleado float NOT NULL,
	CONSTRAINT FK_Empleado_X_Puesto
		FOREIGN KEY (idPuesto)
		REFERENCES dbo.Puesto (idPuesto)
);

-- tablas de transicion

CREATE TABLE dbo.ColaboradorProducto(
	idColab_Prod INT IDENTITY(1,1) Primary Key,
	idEmpleado INT NOT NULL,
	idEnvio INT NOT NULL,
	CONSTRAINT FK_Colaboradores_X_Empleado
		FOREIGN KEY (idEmpleado)
		REFERENCES dbo.Empleado (idEmpleado),
	CONSTRAINT FK_Colaboradores_X_Envio
		FOREIGN KEY (idEnvio)
		REFERENCES dbo.EnvioSucursal (idEnvio)
);