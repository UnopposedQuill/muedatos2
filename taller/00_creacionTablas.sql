use master
go

-- crear la base de datos
create database Taller;
go

-- usar la base de datos
use Taller;
go

-- tablas independientes
create table [dbo].[Sucursal](
	id int identity(1,1) primary key,
	nombre varchar(30) not null,
	ubicacionLat float NOT NULL,
	ubicacionLong float NOT NULL
);
go

create table dbo.Producto(
	id int identity (1,1) primary key,
	nombre varchar(30) not null,
	descripcion varchar(max) not null,
	foto varchar(max) not null,
	precio float not null
);
go
-- nota: IDENTITY (1,1) es el equivalente a auto_increment en SQL Server

create table dbo.Puesto(
	id int identity (1,1) primary key,
	descripcion varchar(30) not null
);
go

-- tablas dependientes

create table dbo.Envio(
	id int identity (1,1) primary key,
	idSucursal int not null constraint FK_Envio_X_Sucursal foreign key (idSucursal) references dbo.Sucursal (id),
	idProducto int not null constraint FK_Envio_X_Producto foreign key (idProducto) references dbo.Producto (id),
	fechaEnvio date not null,
	precioProducto float not null,
	cantidad int not null
);
go

create table dbo.Empleado(
	id int identity (1,1) primary key,
	nombre varchar(30) not null,
	apellido varchar(30) not null,
	fechaContratacion date not null,
	foto varchar(MAX) not null,
	salario float not null,
	idPuesto int not null constraint FK_Empleado_X_Puesto foreign key (idPuesto) references dbo.Puesto (id)
);
go

-- tablas de transicion

create table dbo.ColaboradorProducto(
	id int identity(1,1) primary key,
	idProducto int not null constraint FK_Colaboradores_X_Producto foreign key (idProducto) references dbo.Producto (id),
	idEmpleado int not null constraint FK_Colaboradores_X_Empleado foreign key (idEmpleado) references dbo.Empleado (id)
);
go