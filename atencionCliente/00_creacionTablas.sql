create database AtencionCliente;

use AtencionCliente;

Create table Cliente (
	id int AUTO_INCREMENT primary key,
    nombre varchar(20),
    apellidos varchar(20),
    fechaNacimiento date,
    usuario varchar(30) unique,
    pass varchar(20)
);

create table Cupon (
	id int auto_increment primary key,
    idCliente int ,
    idSucursal int,
    fechaEntrega date,
    fechaVencimiento date,
    utilizado bit(1),
    valor float,
    descripcion varchar(50),
    foreign key(idCliente) references Cliente(id)
);

create table Telefono (
	id int auto_increment primary key,
    idCliente int,
    telefono varchar(16),
    descripcion varchar(20),
    foreign key(idCliente) references Cliente(id)
);

create table Correo (
	id int auto_increment primary key,
    idCliente int,
    correo varchar(50),
    descripcion varchar(20),
    foreign key(idCliente) references Cliente(id)
);