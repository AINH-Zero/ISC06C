-- ==================================================================
-- EJERCICIO 8: Trigger DDL - Auditoría de cambios estructurales
-- ==================================================================

-- 1. Tabla que guarda eventos de creación y eliminación de tablas
-- ==================================================================
--CREATE TABLE Auditoria_DDL (
--    Id INT IDENTITY(1,1) PRIMARY KEY,
--    Usuario NVARCHAR(100),
--    Fecha DATETIME DEFAULT GETDATE(),
--    Evento NVARCHAR(200)
--);
--GO

-- 2. Trigger a nivel de Base de Datos
--CREATE OR ALTER TRIGGER trg_Auditoria_DDL
--ON DATABASE
--FOR CREATE_TABLE, DROP_TABLE
--AS
--BEGIN
--    -- Registrar el tipo de evento (CREATE/DROP) y el usuario
--    INSERT INTO Auditoria_DDL (Usuario, Evento)
--    VALUES (
--        SYSTEM_USER, -- Usuario actual
--        -- Esta es la línea clave de tu segunda imagen:
--        EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'NVARCHAR(100)') 
--    );
--END;
--GO

-- ==================================================================
-- 3. Pruebas (Como aparecen al final de tu imagen)
-- ==================================================================

-- Crea una tabla temporal
--CREATE TABLE Temporal_Test (id INT); 

---- La elimina
--DROP TABLE Temporal_Test;

---- Verificar resultados
--SELECT * FROM Auditoria_DDL;

-- ==================================================================
-- EJERCICIO 9: Trigger AFTER UPDATE - Cambios de puesto
-- ==================================================================
-- Registra los cambios de puesto de un empleado
-- ==================================================================

--CREATE TRIGGER trg_CambioPuesto
--ON Empleados
--AFTER UPDATE
--AS
--BEGIN
--    -- Solo registrar si el puesto fue modificado
--    INSERT INTO Auditoria (Usuario, Accion)
--    SELECT SYSTEM_USER,
--           'Cambio de puesto: ' + d.Nombre + 
--           ' de "' + d.Puesto + '" a "' + i.Puesto + '"'
--    FROM INSERTED i
--    INNER JOIN DELETED d ON i.IdEmpleado = d.IdEmpleado
--    WHERE i.Puesto <> d.Puesto;
--END;
--GO

-- ==================================================================
-- Prueba
-- ==================================================================
--UPDATE Empleados
--SET Puesto = 'Supervisor'
--WHERE Nombre = 'Sofía Ruiz';

--INSERT INTO Empleados (Nombre, Puesto, Sueldo)  VALUES ('Sofía Ruiz','Ingeniera',26000);
--SELECT * FROM Empleados;
--SELECT * FROM Auditoria;