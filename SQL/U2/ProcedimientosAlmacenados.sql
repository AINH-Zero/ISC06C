--IF OBJECT_ID('usp_ObtenerAutores', 'p') IS NOT NULL DROP PROCEDURE usp_ObtenerAutores;
--GO

--CREATE PROCEDURE usp_ObtenerAutores
--AS
--BEGIN
--	SELECT AutorID, Nombre, Apellido, Nacionalidad
--	FROM Autores
--	ORDER BY Apellido;
--END
--GO

---- Ejecucion
--EXEC usp_ObtenerAutores;

--IF OBJECT_ID('usp_ObtenerLibrosPorAutor', 'p') IS NOT NULL DROP PROCEDURE usp_ObtenerLibrosPorAutor;
--GO

--CREATE PROCEDURE usp_ObtenerLibrosPorAutor
--	@AutorID INT
--AS
--BEGIN
--	SELECT LibroID, Titulo, AnioPublicacion, Precio
--	FROM Libros
--	WHERE AutorID = @AutorID
--	ORDER BY AnioPublicacion DESC;
--END
--GO

-- Ejecucion
--EXEC usp_ObtenerLibrosPorAutor @AutorID = 3;

--IF OBJECT_ID('usp_InsertarLibro', 'P') IS NOT NULL DROP PROCEDURE usp_InsertarLibro;
--GO

--CREATE PROCEDURE usp_Insertarlibro
--	@Titulo VARCHAR(200),
--	@AutorID INT,
--	@AnioPublicacion INT,
--	@Precio DECIMAL(10, 2)
--AS
--BEGIN
--	IF @AnioPublicacion > YEAR(GETDATE())
--	BEGIN
--		THROW 50001, 'El año de publicación no puede ser futuro.', 1;
--		RETURN;
--	END

--	INSERT INTO Libros (Titulo, AutorID, AnioPublicacion, Precio) 
--	VALUES (@Titulo, @AutorID, @AnioPublicacion, @Precio);

--	SELECT 'Libro insertado correctamente.' AS Resultado;
--END
--GO

-- Ejecución
--EXEC usp_Insertarlibro @Titulo = 'Nueva Obra', @AutorID = 1, @AnioPublicacion = 2024, @Precio = 18.99;