use SucursalC;
go

--clientes
INSERT INTO [dbo].[Cliente] ([nombre],[apellidos],[ubicacionLat],[ubicacionLong],[direccion])
SELECT nombre as nombre, apellidos as apellidos, RAND()*120 as ubicacionLat, RAND()*90 as ubicacionLong, '' as direccion from openquery(MYSQL,'select * from Cliente')
GO

insert into dbo.Puesto (descripcion) values ('Sistema'),('Empleado'),('Supervisor'),('Tecnico'),('Conserje'),('Jefe');

insert into dbo.Empleado (nombre,apellidos,idPuesto,fechaContratacion,foto,salario,comision) values
('SYS',		'',			1,	'1997-12-12','',0.00,0.00),
('Tonnie',	'Forrestill',3,	'2002-10-10','http://dummyimage.com/137x216.bmp/dddddd/000000',56.3486,5),
('Lisbeth',	'McManus',	3,	'2003-02-06','http://dummyimage.com/130x180.jpg/dddddd/000000',57.5272,5),
('Benjamin','Walford',	4,	'2002-11-21','http://dummyimage.com/131x162.bmp/dddddd/000000',86.1615,4),
('Kimmie',	'Radish',	3,	'2005-04-26','http://dummyimage.com/146x102.bmp/dddddd/000000',79.6372,5),
('Tammie',	'McGarvey',	3,	'2000-09-19','http://dummyimage.com/178x109.png/5fa2dd/ffffff',71.3463,4),
('Munmro',	'Coopland',	4,	'2004-09-17','http://dummyimage.com/174x111.jpg/ff4444/ffffff',51.0014,5),
('Harley',	'Mellows',	3,	'2003-05-27','http://dummyimage.com/108x172.bmp/dddddd/000000',64.7786,5),
('Farrah',	'Boise',	3,	'2002-01-22','http://dummyimage.com/214x148.bmp/5fa2dd/ffffff',78.7242,7),
('Nanci',	'Jacklin',	2,	'2000-06-12','http://dummyimage.com/157x180.bmp/ff4444/ffffff',56.4892,5),
('Karlie',	'Ellison',	4,	'2002-03-10','http://dummyimage.com/230x233.png/ff4444/ffffff',76.2141,6),
('Kenyon',	'Drabble',	2,	'2005-12-20','http://dummyimage.com/143x202.png/cc0000/ffffff',62.9835,5),
('Erminie',	'Monksfield',3,	'2006-04-08','http://dummyimage.com/241x197.jpg/dddddd/000000',62.4678,10),
('Ferguson','Sutton',	4,	'2003-04-18','http://dummyimage.com/144x107.bmp/dddddd/000000',82.2084,5),
('Caria',	'Whiteoak',	2,	'2000-06-07','http://dummyimage.com/100x218.jpg/cc0000/ffffff',61.1750,5),
('Mar',		'Cumbridge',2,	'2006-03-18','http://dummyimage.com/230x188.bmp/ff4444/ffffff',67.0984,9),
('Brett',	'Gerry',	4,	'2004-11-01','http://dummyimage.com/105x132.png/dddddd/000000',94.8187,5),
('Kathlin',	'Fritz',	2,	'2006-05-30','http://dummyimage.com/121x126.jpg/ff4444/ffffff',63.9435,5),
('Aeriela',	'Emor',		3,	'2006-02-14','http://dummyimage.com/243x160.bmp/5fa2dd/ffffff',95.2051,5),
('Carmen',	'Baumert',	2,	'2000-09-13','http://dummyimage.com/188x230.bmp/5fa2dd/ffffff',79.5908,5),
('Agnesse',	'Cescon',	3,	'2004-08-18','http://dummyimage.com/108x170.png/cc0000/ffffff',94.3788,5);
go

insert into [dbo].[MetodoPago] (idCliente,descripcion)
select idCliente,'Efectivo' from [dbo].[Cliente];
go