CREATE TRIGGER TRG_T_Prestamo_BorradoLogico
ON T_Prestamo -- Lo asignamos a tu tabla C_Grupo
INSTEAD OF DELETE -- Se disparar� EN LUGAR DE un comando DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualizamos la tabla C_Grupo
    UPDATE T_Prestamo
    -- Llenamos la columna de fecha de eliminaci�n con la hora actual
    SET Pro_FechaEliminacion = GETDATE()
    -- IMPORTANTE: Solo 'eliminamos' l�gicamente las filas que se intentaron borrar.
    -- La tabla virtual 'deleted' contiene las filas que iban a ser eliminadas.
    WHERE Pro_PrestamoID IN (SELECT Pro_PrestamoID FROM deleted);
END