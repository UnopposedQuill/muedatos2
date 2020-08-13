/***********************************
RECORDAD LA CONTRASEÑA
************************************/

USE [master]
GO

/****** Object:  LinkedServer [MYSQL]    Script Date: 11/8/2020 20:24:17 ******/
EXEC master.dbo.sp_addlinkedserver @server = N'MYSQL', @srvproduct=N'mysql', @provider=N'MSDASQL', @datasrc=N'mysql'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'MYSQL',@useself=N'False',@locallogin=NULL,@rmtuser=N'root',@rmtpassword='########'
GO

EXEC master.dbo.sp_serveroption @server=N'MYSQL', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'MYSQL', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'MYSQL', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'MYSQL', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'MYSQL', @optname=N'rpc', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'MYSQL', @optname=N'rpc out', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'MYSQL', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'MYSQL', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'MYSQL', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'MYSQL', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'MYSQL', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'MYSQL', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'MYSQL', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO


