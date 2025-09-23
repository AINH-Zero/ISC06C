-- Modificación y Trigger para: T_Prestamo
-- 1. Se agrega la columna para la fecha de borrado
ALTER TABLE T_Prestamo
ADD Pro_FechaEliminacion DATE;
GO
-- 2. Se crea el Trigger
CREATE TRIGGER TRG_T_Prestamo_BorradoLogico
ON T_Prestamo
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE T_Prestamo
    SET Pro_FechaEliminacion = GETDATE()
    WHERE Pro_PrestamoID IN (SELECT Pro_PrestamoID FROM deleted);
END;
GO

-- Modificación y Trigger para: C_Autor
ALTER TABLE C_Autor
ADD Atr_FechaEliminacion DATE;
GO
CREATE TRIGGER TRG_C_Autor_BorradoLogico
ON C_Autor
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE C_Autor
    SET Atr_FechaEliminacion = GETDATE()
    WHERE Atr_AutorID IN (SELECT Atr_AutorID FROM deleted);
END;
GO

-- Modificación y Trigger para: C_Grupo
ALTER TABLE C_Grupo
ADD Gpo_FechaEliminacion DATE;
GO
CREATE TRIGGER TRG_C_Grupo_BorradoLogico
ON C_Grupo
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE C_Grupo
    SET Gpo_FechaEliminacion = GETDATE()
    WHERE Gpo_GrupoID IN (SELECT Gpo_GrupoID FROM deleted);
END;
GO

-- Modificación y Trigger para: C_Carrera
ALTER TABLE C_Carrera
ADD Car_FechaEliminacion DATE;
GO
CREATE TRIGGER TRG_C_Carrera_BorradoLogico
ON C_Carrera
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE C_Carrera
    SET Car_FechaEliminacion = GETDATE()
    WHERE Car_CarreraID IN (SELECT Car_CarreraID FROM deleted);
END;
GO

-- Modificación y Trigger para: C_Genero
ALTER TABLE C_Genero
ADD Gro_FechaEliminacion DATE;
GO
CREATE TRIGGER TRG_C_Genero_BorradoLogico
ON C_Genero
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE C_Genero
    SET Gro_FechaEliminacion = GETDATE()
    WHERE Gro_GeneroID IN (SELECT Gro_GeneroID FROM deleted);
END;
GO

-- Modificación y Trigger para: C_Editorial
ALTER TABLE C_Editorial
ADD Edit_FechaEliminacion DATE;
GO
CREATE TRIGGER TRG_C_Editorial_BorradoLogico
ON C_Editorial
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE C_Editorial
    SET Edt_FechaEliminacion = GETDATE()
    WHERE Edt_EditorialID IN (SELECT Edt_EditorialID FROM deleted);
END;
GO

-- Modificación y Trigger para: T_Libro
ALTER TABLE T_Libro
ADD Lbo_FechaEliminacion DATE;
GO
CREATE TRIGGER TRG_T_Libro_BorradoLogico
ON T_Libro
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE T_Libro
    SET Lbo_FechaEliminacion = GETDATE()
    WHERE Lbo_LibroID IN (SELECT Lbo_LibroID FROM deleted);
END;
GO

-- Modificación y Trigger para: T_Alumno
ALTER TABLE T_Alumno
ADD Alo_FechaEliminacion DATE;
GO
CREATE TRIGGER TRG_T_Alumno_BorradoLogico
ON T_Alumno
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE T_Alumno
    SET Alo_FechaEliminacion = GETDATE()
    WHERE Alo_AlumnoID IN (SELECT Alo_AlumnoID FROM deleted);
END;
GO