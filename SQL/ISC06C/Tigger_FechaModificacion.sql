-- Trigger para: Catálogo C_Autor
CREATE TRIGGER TRG_C_Autor_FechaModificacion
ON C_Autor
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE C_Autor
    SET Atr_FechaModificacion = GETDATE()
    WHERE Atr_AutorID IN (SELECT Atr_AutorID FROM inserted);
END;
GO

-- Trigger para: Catálogo C_Grupo
CREATE TRIGGER TRG_C_Grupo_FechaModificacion
ON C_Grupo
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE C_Grupo
    SET Gpo_FechaModificacion = GETDATE()
    WHERE Gpo_GrupoID IN (SELECT Gpo_GrupoID FROM inserted);
END;
GO

-- Trigger para: Catálogo C_Carrera
CREATE TRIGGER TRG_C_Carrera_FechaModificacion
ON C_Carrera
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE C_Carrera
    SET Car_FechaModificacion = GETDATE()
    WHERE Car_CarreraID IN (SELECT Car_CarreraID FROM inserted);
END;
GO

-- Trigger para: Catálogo C_Genero
CREATE TRIGGER TRG_C_Genero_FechaModificacion
ON C_Genero
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE C_Genero
    SET Gro_FechaModificacion = GETDATE()
    WHERE Gro_GeneroID IN (SELECT Gro_GeneroID FROM inserted);
END;
GO

-- Trigger para: Catálogo C_Editorial
CREATE TRIGGER TRG_C_Editorial_FechaModificacion
ON C_Editorial
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE C_Editorial
    SET Edt_FechaModificacion = GETDATE()
    WHERE Edt_EditorialID IN (SELECT Edt_EditorialID FROM inserted);
END;
GO

-- Trigger para: Tabla T_Libro
CREATE TRIGGER TRG_T_Libro_FechaModificacion
ON T_Libro
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE T_Libro
    SET Lbo_FechaModificacion = GETDATE()
    WHERE Lbo_LibroID IN (SELECT Lbo_LibroID FROM inserted);
END;
GO

-- Modificación y Trigger para: Tabla T_Alumno
-- 1. Se agrega la columna porque no existía
ALTER TABLE T_Alumno
ADD Alo_FechaModificacion DATE;
GO

-- 2. Se crea el Trigger
CREATE TRIGGER TRG_T_Alumno_FechaModificacion
ON T_Alumno
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE T_Alumno
    SET Alo_FechaModificacion = GETDATE()
    WHERE Alo_AlumnoID IN (SELECT Alo_AlumnoID FROM inserted);
END;
GO

-- Modificación y Trigger para: Tabla T_Prestamo
-- 1. Se agrega la columna porque no existía
ALTER TABLE T_Prestamo
ADD Pro_FechaModificacion DATE;
GO

-- 2. Se crea el Trigger
CREATE TRIGGER TRG_T_Prestamo_FechaModificacion
ON T_Prestamo
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE T_Prestamo
    SET Pro_FechaModificacion = GETDATE()
    WHERE Pro_PrestamoID IN (SELECT Pro_PrestamoID FROM inserted);
END;
GO