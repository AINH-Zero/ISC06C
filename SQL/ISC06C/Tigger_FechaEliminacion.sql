CREATE TRIGGER TRG_C_Grupo_BorradoLogico
ON C_Grupo -- Lo asignamos a tu tabla C_Grupo
INSTEAD OF DELETE -- Se disparará EN LUGAR DE un comando DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualizamos la tabla C_Grupo
    UPDATE C_Grupo
    -- Llenamos la columna de fecha de eliminación con la hora actual
    SET Gpo_FechaEliminacion = GETDATE()
    -- IMPORTANTE: Solo 'eliminamos' lógicamente las filas que se intentaron borrar.
    -- La tabla virtual 'deleted' contiene las filas que iban a ser eliminadas.
    WHERE Gpo_GrupoID IN (SELECT Gpo_GrupoID FROM deleted);
END;