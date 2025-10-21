USE Testeando
GO
--CREATE VIEW vw_TodosLosLibros
--AS
--SELECT * FROM Libros;

--CREATE VIEW vw_LibrosDisponibles
--AS
--SELECT LibroID, Titulo, AnioPublicacion
--FROM Libros
--WHERE Disponible = 1;
--SELECT * FROM vw_LibrosDisponibles;

--CREATE VIEW vw_LibrosYAutores
--AS
--SELECT L.Titulo, A.NombreAutor, A.Nacionalidad
--FROM Libros L
--JOIN Autores A ON L.AutorID = A.AutorID;
--SELECT * FROM vw_LibrosYAutores;
--SELECT * FROM vw_LibrosYAutores
--WHERE Nacionalidad = 'Britanica';

--CREATE VIEW vw_CatalogoLibros
--AS
--SELECT Titulo AS NombreDelLibro, AnioPublicacion AS Anio
--FROM Libros;
--SELECT * FROM vw_CatalogoLibros;

--CREATE VIEW vw_Novedades
--AS
--SELECT Titulo, AnioPublicacion
--FROM Libros
--WHERE AnioPublicacion > 1950;
--SELECT * FROM vw_Novedades;

--CREATE VIEW vw_InventarioPublico
--AS 
--SELECT LibroID, Titulo, AutorID, AnioPublicacion, Disponible
--FROM Libros;
--SELECT * FROM vw_InventarioPublico;

--CREATE VIEW vw_LibrosEncrypted 
--WITH ENCRYPTION --YA NO SE PUEDE EDITAR
--AS
--SELECT Titulo, AnioPublicacion
--FROM Libros
--WHERE Disponible = 1;
--SELECT * FROM vw_LibrosEncrypted;

--CREATE VIEW vw_ModificarTitulo
--AS
--SELECT * FROM Libros;
--UPDATE vw_ModificarTitulo
--SET Titulo = 'Mil Nueve Cientos Ochenta y Cuatro'
--WHERE LibroID = 3;
--SELECT * FROM Libros;

--INSERT INTO vw_ModificarTitulo (Titulo, AutorID, Disponible)
--VALUES ('Nueva Novela', 2, 1);
--SELECT * FROM Libros;