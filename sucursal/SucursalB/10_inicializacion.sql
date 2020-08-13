use SucursalB;
go

--clientes
INSERT INTO [dbo].[Cliente] ([nombre],[apellidos],[ubicacionLat],[ubicacionLong],[direccion])
SELECT nombre as nombre, apellidos as apellidos, RAND()*120 as ubicacionLat, RAND()*90 as ubicacionLong, '' as direccion from openquery(MYSQL,'select * from Cliente')
GO

insert into dbo.Puesto (descripcion) values ('Sistema'),('Empleado'),('Supervisor'),('Tecnico'),('Conserje'),('Jefe');

insert into dbo.Empleado (nombre,apellidos,idPuesto,fechaContratacion,foto,salario) values
('SYS',		'',			1,'1997-12-12','',0.00),
('Willi',	'Darey',	4,'2002-12-23','http://dummyimage.com/120x149.jpg/5fa2dd/ffffff',54.3777),
('Jasmin',	'Willimont',4,'2001-05-22','http://dummyimage.com/204x102.bmp/cc0000/ffffff',66.4988),
('Justinn',	'Wiltshire',3,'2000-12-12','http://dummyimage.com/185x119.png/ff4444/ffffff',64.611),
('Arvin',	'Sinclar',	2,'2005-05-07','http://dummyimage.com/132x211.png/cc0000/ffffff',64.0116),
('Cly',		'Tesh',		3,'2004-09-26','http://dummyimage.com/132x170.png/ff4444/ffffff',69.8584),
('Wilfred',	'Munn',		3,'2004-08-08','http://dummyimage.com/168x112.jpg/cc0000/ffffff',92.7315),
('Abby',	'Busfield',	4,'2002-04-18','http://dummyimage.com/235x246.png/ff4444/ffffff',61.9374),
('Julian',	'Trigg',	3,'2002-07-07','http://dummyimage.com/100x125.png/cc0000/ffffff',82.1172),
('Sibyl',	'Oughton',	4,'2006-01-25','http://dummyimage.com/212x198.png/cc0000/ffffff',97.7969),
('Laurene',	'Emney',	3,'2005-08-09','http://dummyimage.com/101x126.jpg/ff4444/ffffff',58.2263),
('Frazer',	'Aronov',	4,'2003-01-25','http://dummyimage.com/129x243.png/cc0000/ffffff',70.5755),
('Ulrika',	'Defond',	4,'2004-06-09','http://dummyimage.com/133x176.jpg/dddddd/000000',94.2088),
('Carolee',	'Lougheed',	2,'2001-08-04','http://dummyimage.com/210x191.png/ff4444/ffffff',89.3078),
('Doe',		'Rignall',	3,'2002-07-08','http://dummyimage.com/221x109.png/dddddd/000000',60.8509),
('Bathsheba','Pulford',	3,'2004-10-02','http://dummyimage.com/119x179.png/cc0000/ffffff',51.2918),
('Chloe',	'Dunton',	2,'2004-11-07','http://dummyimage.com/113x198.png/dddddd/000000',60.1757),
('Flinn',	'Wabersich',4,'2000-02-07','http://dummyimage.com/204x177.jpg/dddddd/000000',63.0805),
('Gonzales','Garstang',	3,'2006-06-27','http://dummyimage.com/109x165.png/ff4444/ffffff',95.3548),
('Gustavus','McCook',	2,'2002-10-03','http://dummyimage.com/211x189.png/cc0000/ffffff',87.2756),
('Kally',	'Gray',		2,'2000-05-06','http://dummyimage.com/194x201.bmp/ff4444/ffffff',86.9924);
go

insert into [dbo].[MetodoPago] (idCliente,descripcion)
select idCliente,'Efectivo' from [dbo].[Cliente];
go