--El "10.235.242.150" viene siendo la ip del otro servidor al que se esta vinculando
EXEC sp_addlinkedserver
@server = '10.0.0.11',
@srvproduct = 'SQL SERVER';
GO

--El "sa" es el usuario que se esta utilizando para poder tener acceso a las bases de datos
exec sp_addlinkedsrvlogin
@rmtsrvname = N'10.0.0.11',
@useself = 'false',
@rmtuser = N'Usuario1',
@rmtpassword = N'1234';
GO