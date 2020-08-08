
create or alter procedure probarMySQL
as begin
	select * from openquery(MYSQL, 'select * from cliente')
end
