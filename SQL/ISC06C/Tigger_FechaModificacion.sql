-- Le damos un nombre descriptivo al Trigger
CREATE TRIGGER TRG_T_Prestamo_FechaModificacion
ON T_Prestamo  -- Lo asignamos a tu tabla C_Grupo
AFTER UPDATE -- Se disparará DESPUÉS de que se ejecute un UPDATE
AS
BEGIN
    -- Esta línea es para optimizar, no es estrictamente necesaria pero es buena práctica
    SET NOCOUNT ON;

    -- Actualizamos la tabla C_Grupo
    UPDATE T_Prestamo
    -- Ponemos la fecha y hora actual en la columna de modificación
    SET Pro_FechaModificacion = GETDATE()
    -- IMPORTANTE: Solo actualizamos las filas que realmente fueron modificadas
    -- La tabla virtual 'inserted' contiene los datos de las filas que se acaban de actualizar
    WHERE Pro_PrestamoID IN (SELECT Pro_PrestamoID FROM inserted);
END;