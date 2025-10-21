-- Ejercicio 1
USE Testeando
GO
--CREATE VIEW vw_LibrosAutores_Colombianos
--AS
--SELECT A.NombreAutor AS Autor, A.Nacionalidad, L.Titulo
--FROM Libros L
--JOIN Autores A ON L.AutorID = A.AutorID
--WHERE A.Nacionalidad = 'Colombiana';
SELECT * FROM vw_LibrosAutores_Colombianos;