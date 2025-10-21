USE Testeando
GO
--BEGIN TRANSACTION;
--	BEGIN TRY
--		INSERT INTO Alumnos VALUES (5, 'Lucia Torres', 24);
--		COMMIT;
--	END TRY
--	BEGIN CATCH
--		ROLLBACK;
--		PRINT 'Error en la insercion.'
--	END CATCH;
--SELECT * FROM Alumnos;

--BEGIN TRANSACTION;
--	BEGIN TRY
--		UPDATE Alumnos SET Edad = Edad + 2 WHERE ID = 5;
--		COMMIT;
--	END TRY
--	BEGIN CATCH
--		ROLLBACK;
--		PRINT 'Error al actualizar.'
--	END CATCH;
--SELECT * FROM Alumnos;

--BEGIN TRANSACTION;
--	BEGIN TRY
--		DELETE FROM Alumnos WHERE ID = 99; -- No existe
--		COMMIT;
--	END TRY
--	BEGIN CATCH
--		ROLLBACK;
--		PRINT 'Error al eliminar.'
--	END CATCH;
--SELECT * FROM Alumnos;

--BEGIN TRANSACTION;
--	BEGIN TRY
--		INSERT INTO Alumnos VALUES (6, 'Error', 'Edad');
--		COMMIT;
--	END TRY
--	BEGIN CATCH
--		ROLLBACK;
--		PRINT 'Error tipon de insercion.'
--	END CATCH;

--BEGIN TRANSACTION;
--	BEGIN TRY
--		INSERT INTO Alumnos VALUES (1, 'Duplicado', 25);
--		COMMIT;
--	END TRY
--	BEGIN CATCH
--		ROLLBACK;
--		PRINT 'ID duplicado. Transaccion revertida.'
--	END CATCH;