USE [Taller]
GO

CREATE PARTITION FUNCTION sucursal (int)  
AS RANGE LEFT FOR VALUES (1, 2);

CREATE PARTITION SCHEME [sucursal] AS PARTITION [sucursal] TO ([SucursalA], [SucursalB], [SucursalC])

-- por motivos que escapan a mi entendimiento hay que crear el filegroup y files usando el _gui_
-- "click derecho y propiedades en la BD, files; luego filegroups"
-- "hay que crear 3 filegrous, y 3 files, cada uno con el nombre SucursalX; cada archivo perteneciendo al filegroup especificado"
-- "click derecho y storage en la tabla, partition"
