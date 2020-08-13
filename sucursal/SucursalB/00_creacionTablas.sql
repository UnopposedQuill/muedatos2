use master;
go

create database SucursalB;
go
use SucursalB;
go

-- tablas independientes
CREATE TABLE dbo.Puesto (
	idPuesto INT PRIMARY KEY IDENTITY(1,1),
	descripcion varchar(30) NOT NULL
);
go

CREATE TABLE dbo.Cliente (
	idCliente INT PRIMARY KEY IDENTITY(1,1),
	nombre varchar(30) NOT NULL,
	apellidos varchar(30) NOT NULL,
	ubicacionLat float NOT NULL,
	ubicacionLong float NOT NULL,
	direccion varchar(120) NOT NULL
);
go

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
go

CREATE TABLE dbo.MetodoPago (
	idMetodoPago INT PRIMARY KEY IDENTITY(1,1),
	idCliente INT NOT NULL,
	descripcion varchar(20),
	CONSTRAINT FK_Metodo_Cliente
		FOREIGN KEY (idCliente)
		REFERENCES dbo.Cliente (idCliente)
);
go

-- tablas de transicion
CREATE TABLE dbo.Venta (
	idVenta INT PRIMARY KEY IDENTITY(1,1),
	idEmpleado INT NOT NULL,
	idCliente INT NOT NULL,
	idMetodoPago INT NOT NULL,
	fechaVenta DATE NOT NULL,
	reciboConforme XML NULL,
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
go

CREATE TABLE dbo.LineaVenta (
	idLineaVenta INT PRIMARY KEY IDENTITY(1,1),
	idVenta INT NOT NULL,
	idProducto INT NOT NULL,
	cantidad INT NOT NULL,
	precio FLOAT NOT NULL,
	CONSTRAINT FK_LineaVenta_Venta
		FOREIGN KEY (idVenta)
		REFERENCES dbo.Venta (idVenta)
	-- en teoría deberia mantener un fk a producto, pero dicha tabla se encuentra en Taller
	-- -- para manejar fk entre bases se deberia usar triggers, pero por ahora no me voy a preocupar por consistencia inter-bd
);
go