USE BIBLIO_PrestamosLibros_DEV_APP
GO
-- DELETE C_Autor -- Es para borrar los campos
-- DROP TABLE C_Autor -- Elimina toda la tabla
-- TRUNCATE TABLE C_Autor -- Borra los campos, los identity, transacciones, etc.

-- SET IDENTITY_INSERT C_Autor ON;

-- INSERT INTO C_Autor (Atr_AutorID, Atr_Nombre) VALUES (80, 'TRIPI TROPI TROPA TRIPA');

-- SET IDENTITY_INSERT C_Autor OFF;

-- SELECT * FROM C_Autor;

BEGIN TRAN; --CODIGO A EVALUAR PARA VER SI FUNCIONA EN OTRO QUERY SE HACE EL SELECT

INSERT INTO C_Autor (Atr_Nombre) VALUES ('BRR BRR PATAPIN');

--UPDATE C_Autor SET Disponible = Disponible -1
--WHERE Atr_AutorID = 102;

--COMMIT TRAN; --SUBIR

--ROLLBACK TRAN; --CANCELAR