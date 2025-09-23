--DELETE FROM C_Autor WHERE Atr_AutorID = 5;
--insert into C_Autor(Atr_Nombre) values ('SKIBIDI');
SELECT * FROM C_Autor;
SELECT SCOPE_IDENTITY() AS UltimoPrestamoid;

-- Para decir que continue en el 11
--DBCC CHECKIDENT ('C_Autor', RESEED, 10);