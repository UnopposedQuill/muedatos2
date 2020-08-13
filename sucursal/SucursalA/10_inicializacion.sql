use SucursalA;
go

--clientes
INSERT INTO [dbo].[Cliente] ([nombre],[apellidos],[ubicacionLat],[ubicacionLong],[direccion])
SELECT nombre as nombre, apellidos as apellidos, RAND()*120 as ubicacionLat, RAND()*90 as ubicacionLong, '' as direccion from openquery(MYSQL,'select * from Cliente')
GO

insert into dbo.Puesto (descripcion) values ('Sistema'),('Empleado'),('Supervisor'),('Tecnico'),('Conserje'),('Jefe');

insert into dbo.Empleado (nombre, apellidos, idPuesto, fechaContratacion, foto, salario) values
('SYS',		'',			1,	'1997-12-12',	'',													0.00),
('Thorpe',	'Thundercliffe',2,'2001-06-14',	'http://dummyimage.com/208x132.png/5fa2dd/ffffff',	90.106),
('Alfy',	'Avrahamy',	4,	'2004-03-15',	'http://dummyimage.com/120x157.jpg/ff4444/ffffff',	91.016),
('Eran',	'Walasik',	3,	'2002-06-04',	'http://dummyimage.com/163x185.jpg/dddddd/000000',	69.4833),
('Corilla',	'Tansley',	4,	'2001-02-01',	'http://dummyimage.com/202x225.png/dddddd/000000',	62.6877),
('Latisha',	'Kerswill',	4,	'2003-07-08',	'http://dummyimage.com/219x119.png/5fa2dd/ffffff',	51.1667),
('Sinclair','Yarr',		3,	'2006-02-03',	'http://dummyimage.com/212x250.jpg/cc0000/ffffff',	98.1105),
('Ansley',	'Gianulli',	3,	'2000-11-01',	'http://dummyimage.com/239x121.jpg/5fa2dd/ffffff',	99.7444),
('Silvan',	'McLenahan',4,	'2001-08-06',	'http://dummyimage.com/231x145.bmp/cc0000/ffffff',	72.0686),
('Abbe',	'Tite',		3,	'2004-10-16',	'http://dummyimage.com/205x222.png/dddddd/000000',	75.816),
('Alexei',	'Langeren',	2,	'2005-08-19',	'http://dummyimage.com/133x153.png/5fa2dd/ffffff',	63.3405),
('Tootsie',	'Mirrlees',	4,	'2004-10-19',	'http://dummyimage.com/215x172.bmp/ff4444/ffffff',	91.0091),
('Ellswerth','Frow',	3,	'2005-12-24',	'http://dummyimage.com/161x236.bmp/ff4444/ffffff',	53.2144),
('Forest',	'Dimbylow',	2,	'2006-07-02',	'http://dummyimage.com/176x241.jpg/dddddd/000000',	89.4081),
('Donia',	'Pele',		4,	'2003-01-30',	'http://dummyimage.com/236x229.bmp/5fa2dd/ffffff',	81.4264),
('Vinny',	'Gabitis',	4,	'2004-09-28',	'http://dummyimage.com/244x202.jpg/cc0000/ffffff',	91.4764),
('Terri',	'Freda',	2,	'2000-05-22',	'http://dummyimage.com/165x144.png/dddddd/000000',	72.613),
('Arabella','Bullant',	4,	'2004-10-03',	'http://dummyimage.com/165x147.bmp/ff4444/ffffff',	84.8236),
('Gabriel',	'Christaeas',4,	'2003-07-09',	'http://dummyimage.com/157x143.png/5fa2dd/ffffff',	82.6765),
('Sigismondo','Coyne',	4,	'2000-12-17',	'http://dummyimage.com/132x242.bmp/cc0000/ffffff',	53.6067),
('Wilbur',	'Edger',	2,	'2001-06-04',	'http://dummyimage.com/107x137.bmp/5fa2dd/ffffff',	54.8284);
go

insert into [dbo].[MetodoPago] (idCliente,descripcion) --todos los clientes tiene para pago en efectivo
select idCliente,'Efectivo' from [dbo].[Cliente];
go