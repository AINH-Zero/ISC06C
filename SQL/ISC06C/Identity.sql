INSERT INTO T_Prestamo (Pro_AlumnoID, Pro_LibroID, Pro_FechaPrestamo)
VALUES (1,100,GETDATE());
SELECT SCOPE_IDENTITY() AS UltimoPrestamoid;