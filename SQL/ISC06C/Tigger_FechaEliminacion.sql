CREATE TRIGGER TRG_C_Genero_BorradoLogico
ON C_Genero -- Lo asignamos a tu tabla C_Grupo
INSTEAD OF DELETE -- Se disparará EN LUGAR DE un comando DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualizamos la tabla C_Grupo
    UPDATE C_Genero
    -- Llenamos la columna de fecha de eliminación con la hora actual
    SET Gro_FechaEliminacion = GETDATE()
    -- IMPORTANTE: Solo 'eliminamos' lógicamente las filas que se intentaron borrar.
    -- La tabla virtual 'deleted' contiene las filas que iban a ser eliminadas.
    WHERE Gro_GeneroID IN (SELECT Gro_GeneroID FROM deleted);
END