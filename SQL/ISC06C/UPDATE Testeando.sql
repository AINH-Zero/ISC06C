BEGIN TRANSACTION;
	select * from Alumnos;
	UPDATE Alumnos SET Edad = Edad + 1 WHERE ID = 2;
	select * from Alumnos;
COMMIT;