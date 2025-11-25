--CREATE TRIGGER trg_Auditoria_Insert
--ON Empleados
--AFTER INSERT
--AS
--BEGIN
--	INSERT INTO Auditoria (Usuario, Accion)
--	SELECT SYSTEM_USER,
--		'Nuevo empleado: ' + Nombre
--	FROM INSERTED;
--END;
--GO

--INSERT INTO Empleados (Nombre, Puesto, Sueldo) VALUES ('Laura Torres', 'Analista', 18000);

--SELECT * FROM Empleados;
--SELECT * FROM Auditoria;

CREATE TRIGGER trg_Auditoria_Update
ON Empleados
AFTER UPDATE
AS
BEGIN
	INSERT INTO Auditoria(Usuario,Accion)
	SELECT SYSTEM_USER,
		'Cambio de sueldo: ' + i.Nombre + ' de $' + CAST(d.Sueldo AS NVARCHAR(20)) + ' de $' + CAST(i.Sueldo AS NVARCHAR(20))
	FROM INSERTED AS i
	INNER JOIN DELETED d ON i.IdEmpleado = d.IdEmpleado
	WHERE i.Sueldo <> d.Sueldo;
END;
GO

UPDATE Empleados SET Sueldo = 20000