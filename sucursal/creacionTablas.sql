-- tablas independientes
CREATE TABLE dbo.Puesto (
	idPuesto INT PRIMARY KEY IDENTITY(1,1),
	descripcion varchar(30) NOT NULL
);

CREATE TABLE dbo.Producto (
	idProducto INT PRIMARY KEY IDENTITY(1,1),
	existencias INT NOT NULL,
	precioActual FLOAT NOT NULL
);
ALTER TABLE dbo.Producto ADD descripcion VARCHAR(MAX) NOT NULL, foto VARCHAR(MAX) NOT NULL, nombre VARCHAR(30) NOT NULL;

CREATE TABLE dbo.Cliente (
	idCliente INT PRIMARY KEY IDENTITY(1,1),
	nombre varchar(30) NOT NULL,
	apellidos varchar(30) NOT NULL,
	ubicacion geometry NOT NULL,
	direccion varchar(120) NOT NULL
);

-- tablas dependientes
CREATE TABLE dbo.Empleado (
	idEmpleado INT PRIMARY KEY IDENTITY(1,1),
	idPuesto INT NOT NULL,
	nombre varchar(30) NOT NULL,
	apellidos varchar(30) NOT NULL,
	fechaContratacion DATE NOT NULL,
	foto varchar(MAX) NOT NULL,
	salario float NOT NULL,
	CONSTRAINT FK_Empleado_Puesto
		FOREIGN KEY (idPuesto)
		REFERENCES dbo.Puesto (idPuesto)
);

CREATE TABLE dbo.MetodoPago (
	idMetodoPago INT PRIMARY KEY IDENTITY(1,1),
	idCliente INT NOT NULL,
	descripcion varchar(20),
	CONSTRAINT FK_Metodo_Cliente
		FOREIGN KEY (idCliente)
		REFERENCES dbo.Cliente (idCliente)
);

-- tablas de transicion
CREATE TABLE dbo.Venta (
	idVenta INT PRIMARY KEY IDENTITY(1,1),
	idEmpleado INT NOT NULL,
	idCliente INT NOT NULL,
	idMetodoPago INT NOT NULL,
	fechaVenta DATE NOT NULL,
	CONSTRAINT FK_Venta_Empleado
		FOREIGN KEY (idEmpleado)
		REFERENCES dbo.Empleado (idEmpleado),
	CONSTRAINT FK_Venta_Cliente
		FOREIGN KEY (idCliente)
		REFERENCES dbo.Cliente (idCliente),
	CONSTRAINT FK_Venta_Metodo
		FOREIGN KEY (idMetodoPago)
		REFERENCES dbo.MetodoPago (idMetodoPago)
);

CREATE TABLE dbo.LineaVenta (
	idLineaVenta INT PRIMARY KEY IDENTITY(1,1),
	idVenta INT NOT NULL,
	idProducto INT NOT NULL,
	cantidad INT NOT NULL,
	precio FLOAT NOT NULL,
	CONSTRAINT FK_LineaVenta_Venta
		FOREIGN KEY (idVenta)
		REFERENCES dbo.Venta (idVenta),
	CONSTRAINT FK_LineaVenta_Producto
		FOREIGN KEY (idProducto)
		REFERENCES dbo.Producto (idProducto)
);