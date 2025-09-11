-- Le damos un nombre descriptivo al Trigger
CREATE TRIGGER TRG_C_Grupo_FechaModificacion
ON C_Grupo  -- Lo asignamos a tu tabla C_Grupo
AFTER UPDATE -- Se disparar� DESPU�S de que se ejecute un UPDATE
AS
BEGIN
    -- Esta l�nea es para optimizar, no es estrictamente necesaria pero es buena pr�ctica
    SET NOCOUNT ON;

    -- Actualizamos la tabla C_Grupo
    UPDATE C_Grupo
    -- Ponemos la fecha y hora actual en la columna de modificaci�n
    SET Gpo_FechaModificacion = GETDATE()
    -- IMPORTANTE: Solo actualizamos las filas que realmente fueron modificadas
    -- La tabla virtual 'inserted' contiene los datos de las filas que se acaban de actualizar
    WHERE Gpo_GrupoID IN (SELECT Gpo_GrupoID FROM inserted);
END;