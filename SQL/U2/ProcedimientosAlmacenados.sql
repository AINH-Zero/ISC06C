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

--IF OBJECT_ID('usp_ActualizarPrecioLibro', 'P') IS NOT NULL DROP PROCEDURE usp_ActualizarPrecioLibro;
--GO

--CREATE PROCEDURE usp_ActualizarPrecioLibro
--	@LibroID INT,
--	@NuevoPrecio DECIMAL(10, 2)
--AS
--BEGIN
--	UPDATE Libros
--	SET Precio = @NuevoPrecio
--	WHERE LibroID = @LibroID

--	-- MOSTRAR EL NUMERO DE FILAS AFECTADAS
--	SELECT 'Filas actualizadas' AS Mensaje, @@ROWCOUNT AS FilasAfectadas;
--END
--GO

-- Ejecución
--EXEC usp_ActualizarPrecioLibro @LibroID = 1001, @NuevoPrecio = 27.00;
--SELECT * FROM Libros WHERE LibroID = 1001;

--CREATE PROCEDURE usp_EliminarLibro
--	@LibroID INT
--AS
--BEGIN
--	-- Validar que el libro exista antes de intentar borrar
--	IF NOT EXISTS (SELECT 1 FROM Libros WHERE LibroID = @LibroID)
--	BEGIN
--		SELECT 'Advertencia: El LibroID especificado no existe.' AS Resultado;
--		RETURN;
--END

--DELETE FROM Libros
--WHERE LibroID = @LibroID;

--SELECT 'Libro eliminado con exito' AS Resultado;
--END
--GO

-- EJECUCION (PRIMERO INSERTAMOS UN LIBRO TEMPORAL PARA BORRARLO)
EXEC usp_Insertarlibro @Titulo = 'Temporal', @AutorID = 1, @AnioPublicacion = 2024, @Precio = 1.00;
-- OBTENER EL ID DEL ULTIMO LIBRO INSERTADO (TEMPORAL)
DECLARE @TempLibroID INT = (SELECT MAX(LibroID) FROM Libros WHERE Titulo = 'Temporal');
-- BORRAR EL LIBRO
EXEC usp_EliminarLibro @LibroID = @TempLibroID;