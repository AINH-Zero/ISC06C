-- Ejercicio 1
USE Testeando
GO
--CREATE VIEW vw_LibrosAutores_Colombianos
--AS
--SELECT A.NombreAutor AS Autor, A.Nacionalidad, L.Titulo
--FROM Libros L
--JOIN Autores A ON L.AutorID = A.AutorID
--WHERE A.Nacionalidad = 'Colombiana';
--SELECT * FROM vw_LibrosAutores_Colombianos;

-- Ejercicio 2
--CREATE VIEW vw_Libros_Disponiblie
--AS
--SELECT Titulo, CASE WHEN Disponible = 0 THEN 'Prestado :o' ELSE 'Disponible :)'
--  END AS estado_del_campo
--FROM Libros;
SELECT * FROM vw_Libros_Disponiblie;