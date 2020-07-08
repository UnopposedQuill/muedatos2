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

