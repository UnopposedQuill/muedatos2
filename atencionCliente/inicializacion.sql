
insert into Cliente (nombre, apellidos, fechaNacimiento,usuario,pass) values 
('Rutherford', 'Giacomozzo', '1996-02-27','usuario1','pass123'),
('Shae', 'Espine', '1993-05-15','usuario2','pass123'),
('Tiler', 'Lammin', '1983-03-05','usuario3','pass123'),
('Robb', 'Neal', '1996-10-27','usuario4','pass123'),
('Claudette', 'Mervyn', '2000-05-22','usuario5','pass123'),
('Corie', 'Carragher', '1989-11-26','usuario6','pass123'),
('Eugenie', 'Neasham', '1961-09-30','usuario7','pass123'),
('Philly', 'Kirley', '1968-12-18','usuario8','pass123'),
('Timotheus', 'Grix', '1990-07-13','usuario9','pass123'),
('Sonnnie', 'Troughton', '1978-11-18','usuario10','pass123'),
('Brett', 'Crummie', '1950-09-30','usuario11','pass123'),
('Hamnet', 'Shedd', '1983-09-11','usuario12','pass123'),
('Bryant', 'Bliven', '1975-01-23','usuario13','pass123'),
('Vivia', 'Steckings', '2000-04-11','usuario14','pass123'),
('Rivi', 'Rose', '1959-12-24','usuario15','pass123')
go

insert into Correo (idCliente, correo, descripcion) values
(1, 'bwhiley0@sphinn.com', 'Correo personal'),
(2, 'abeesey1@meetup.com', 'Correo personal'),
(3, 'ebygate2@163.com', 'Correo personal'),
(4, 'pkienl3@creativecommons.org', 'Correo personal'),
(5, 'lkeelinge4@sfgate.com', 'Correo personal'),
(6, 'mecclesall5@123-reg.co.uk', 'Correo personal'),
(7, 'ucornelius6@1688.com', 'Correo personal'),
(8, 'cvelareal7@about.me', 'Correo personal'),
(9, 'gsushams8@chicagotribune.com', 'Correo personal'),
(10, 'bshadwick9@slashdot.org', 'Correo personal'),
(11, 'estibbsa@mit.edu', 'Correo personal'),
(12, 'bweirb@theguardian.com', 'Correo personal'),
(13, 'btippellc@accuweather.com', 'Correo personal'),
(14, 'ntrewarthad@msu.edu', 'Correo personal'),
(15, 'smiroye@weibo.com', 'Correo personal'),
(16, 'dblondinf@slate.com', 'Correo personal')
go

insert into Cupon (idCliente, idSucursal, fechaEntrega, dechaVencimiento, utilizado) values
(15, 1, '2010-03-01', '2014-08-29', 0),
(9, 3, '2015-12-18', '2012-05-06', 0),
(6, 2, '2009-07-30', '2013-10-05', 0),
(16, 3, '2010-04-12', '2008-02-14', 0),
(12, 3, '2014-08-28', '2014-09-21', 0),
(8, 3, '2015-01-27', '2009-09-23', 1),
(12, 1, '2014-10-15', '2012-08-09', 1)
go

insert into Telefono (idCliente, telefono, descripcion) values
(1, '(313) 4432500', 'Telefono personal'),
(2, '(122) 7886678', 'Telefono personal'),
(3, '(428) 7125724', 'Telefono personal'),
(4, '(734) 2713448', 'Telefono personal'),
(5, '(402) 1340089', 'Telefono personal'),
(6, '(744) 7548053', 'Telefono personal'),
(7, '(642) 6196000', 'Telefono personal'),
(8, '(530) 4369778', 'Telefono personal'),
(9, '(593) 9206896', 'Telefono personal'),
(10, '(502) 5703909', 'Telefono personal'),
(11, '(929) 2618438', 'Telefono personal'),
(12, '(814) 9950592', 'Telefono personal'),
(13, '(695) 5533144', 'Telefono personal'),
(14, '(238) 7300461', 'Telefono personal'),
(15, '(155) 4679491', 'Telefono personal'),
(16, '(426) 3194993', 'Telefono personal')
go
