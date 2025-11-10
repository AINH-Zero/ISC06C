--IF OBJECT_ID('usp_ActualizarPrecio_RETURN','P') IS NOT NULL DROP PROCEDURE usp_ActualizarPrecio_RETURN
--GO

--CREATE PROCEDURE usp_ActualizarPrecio_RETURN
--	@LibroID INT,
--	@NuevoPrecio DECIMAL(10,2)
--AS
--BEGIN
--	IF @NuevoPrecio < 0
--		RETURN -1; -- Codigo de error Precio invalido

--	UPDATE Libros
--	SET Precio = @NuevoPrecio
--	WHERE LibroID = @LibroID;

--	IF @@ROWCOUNT = 0
--		RETURN -2; --Codigo de error ID de libro no encontrado

--	RETURN 0;
--END
--GO

---- Ejecucion y recuperacion del codigo
--DECLARE @Codigo INT;

---- Caso 1 Actia;lizacion exitosa (LibroID - 2)
--EXEC @Codigo = usp_ActualizarPrecio_RETURN @LibroID = 1002, @NuevoPrecio = 15.50;
--SELECT 'Resultado (Exito):' AS Mensaje, @Codigo AS CodigoRetorno;

-- Ejemplo 8: Parámetro de Salida para Valor Derivado
-- Objetivo: Calcular el precio promedio de los libros de un autor y devolver ese valor.
--IF OBJECT_ID('usp_ObtenerPromedioPrecioAutor', 'P') IS NOT NULL DROP PROCEDURE usp_ObtenerPromedioPrecioAutor;
--GO

--CREATE PROCEDURE usp_ObtenerPromedioPrecioAutor
--    @AutorID INT,
--    @PrecioPromedio DECIMAL(10, 2) OUTPUT
--AS
--BEGIN
--    SELECT @PrecioPromedio = AVG(Precio)
--    FROM Libros
--    WHERE AutorID = @AutorID;
--END;
--GO

---- Ejecución y recuperación (Usamos AutorID = 2)
--DECLARE @Promedio DECIMAL(10, 2);

--EXEC usp_ObtenerPromedioPrecioAutor
--    @AutorID = 2,
--    @PrecioPromedio = @Promedio OUTPUT;

--SELECT 'Precio Promedio del Autor 2:' AS Mensaje, @Promedio AS PrecioPromedio;

-- =============================================
-- Ejemplo 9: Parámetros de Entrada Opcionales (Valores por defecto)
-- Objetivo: Permitir al usuario listar libros, habiendo el AutorID opcional. Si no se proporciona,
-- lista todos.
-- =============================================
--IF OBJECT_ID('usp_ListarLibrosOpcional', 'P') IS NOT NULL DROP PROCEDURE usp_ListarLibrosOpcional;
--GO

--CREATE PROCEDURE usp_ListarLibrosOpcional
--    -- Se asigna un valor por defecto (NULL) al parámetro, haciéndolo opcional
--    @AutorID INT = NULL
--AS
--BEGIN
--    SELECT Titulo, AnioPublicacion, Precio, AutorID
--    FROM Libros
--    WHERE AutorID = ISNULL(@AutorID, AutorID) -- Muestra todos si @AutorID es NULL
--    ORDER BY Titulo;
--END
--GO

---- Ejecución 1: Sin parámetro (Muestra todos los libros)
--EXEC usp_ListarLibrosOpcional;

---- Ejecución 2: Con parámetro (Filtra por AutorID = 3)
--EXEC usp_ListarLibrosOpcional @AutorID = 3;


-- =============================================
-- Ejemplo 10: Múltiples Parámetros de Salida
-- Objetivo: Contar cuántos libros tiene un autor y devolver el total y el libro más reciente.
-- =============================================
--IF OBJECT_ID('usp_InfoAutor_MultiOut', 'P') IS NOT NULL DROP PROCEDURE usp_InfoAutor_MultiOut;
--GO

--CREATE PROCEDURE usp_InfoAutor_MultiOut
--    @AutorID INT,
--    @TotalLibros INT OUTPUT,
--    @LibroMasReciente VARCHAR(200) OUTPUT
--AS
--BEGIN
--    SELECT @TotalLibros = COUNT(LibroID)
--    FROM Libros
--    WHERE AutorID = @AutorID;

--    SELECT TOP 1 @LibroMasReciente = Titulo
--    FROM Libros
--    WHERE AutorID = @AutorID
--    ORDER BY AnioPublicacion DESC;
--END
--GO

-- Ejecución y recuperación (Usamos AutorID = 1)
--DECLARE @Total INT;
--DECLARE @Reciente VARCHAR(200);

--EXEC usp_InfoAutor_MultiOut
--    @AutorID = 1,
--    @TotalLibros = @Total OUTPUT,
--    @LibroMasReciente = @Reciente OUTPUT;

---- Esto es lo que se ve en la nueva imagen:
--SELECT
--    'Autor ID 1' AS Autor,
--    @Total AS CantidadLibros,
--    @Reciente AS TituloReciente;

IF OBJECT_ID('usp_InsertarLibroSeguro', 'P') IS NOT NULL DROP PROCEDURE usp_InsertarLibroSeguro;
GO

CREATE PROCEDURE usp_InsertarLibroSeguro
    @Titulo VARCHAR(200),
    @AutorID INT,
    @Precio DECIMAL(10, 2)
AS
BEGIN
    BEGIN TRANSACTION; -- Iniciar la transacción

    BEGIN TRY
        INSERT INTO Libros (Titulo, AutorID, Precio, AnioPublicacion)
        VALUES (@Titulo, @AutorID, @Precio, YEAR(GETDATE()));

        COMMIT TRANSACTION; -- Confirmar si todo fue bien
        SELECT 'Transacción exitosa: Libro insertado.' AS Resultado;
    END TRY
    BEGIN CATCH
        -- Si ocurre un error (ej. AutorID no existe)
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION; -- Revertir la transacción

        SELECT
            'Transacción fallida: ' + ERROR_MESSAGE() AS ErrorDetalle,
            ERROR_NUMBER() AS CodigoError;
    END CATCH
END
GO

-- EJECUCION
EXEC usp_InsertarLibroSeguro @Titulo = 'Falla', @AutorID = 99, @Precio = 10.00;
