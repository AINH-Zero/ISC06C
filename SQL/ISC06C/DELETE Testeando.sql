BEGIN TRANSACTION;
	select * from Alumnos;
	DELETE FROM Alumnos WHERE  ID = 3;
	select * from Alumnos;
Commit;