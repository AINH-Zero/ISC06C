-- Le damos un nombre descriptivo al Trigger
CREATE TRIGGER TRG_C_Genero_FechaModificacion
ON C_Genero  -- Lo asignamos a tu tabla C_Grupo
AFTER UPDATE -- Se disparará DESPUÉS de que se ejecute un UPDATE
AS
BEGIN
    -- Esta línea es para optimizar, no es estrictamente necesaria pero es buena práctica
    SET NOCOUNT ON;

    -- Actualizamos la tabla C_Grupo
    UPDATE C_Genero
    -- Ponemos la fecha y hora actual en la columna de modificación
    SET Gro_FechaModificacion = GETDATE()
    -- IMPORTANTE: Solo actualizamos las filas que realmente fueron modificadas
    -- La tabla virtual 'inserted' contiene los datos de las filas que se acaban de actualizar
    WHERE Gro_GeneroID IN (SELECT Gro_GeneroID FROM inserted);
END;