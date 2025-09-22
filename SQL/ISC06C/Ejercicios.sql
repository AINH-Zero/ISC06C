-- Guia
-- Nivel Server
--CREATE LOGIN AlumnoLogin
--WITH PASSWORD = 'ContraseñaSegura123!',
--	CHECK_POLICY = ON, -- Aplica politica de contraseñas
--	CHECK_EXPIRATION = OFF; -- La contraseña no expira

-- Nivel BD
--USE BIBLIO_PrestamosLibros_DEV_APP
--GO
--CREATE USER AlumnoUser FOR LOGIN AlumnoLogin;

-- Roles
--CREATE ROLE LectoresBiblioteca;

-- Asignar permisos al Rol
--GRANT SELECT ON SCHEMA::dbo TO LectoresBiblioteca;
--GRANT INSERT, UPDATE ON SCHEMA::dbo TO LectoresBiblioteca;

-- Procedimientos Almacenados Asignar usuario a rol
--EXEC sp_addrolemember 'LectoresBiblioteca', 'AlumnoUser';
--EXEC sp_helprolemember 'lectoresBiblioteca';

--SELECT dp.name AS RoleName, p.permission_name, p.state_desc
--FROM sys.database_permissions p
--JOIN sys.database_principals dp ON p.grantee_principal_id = dp.principal_id
--WHERE dp.name = 'LectoresBiblioteca';

-- Modificar y rebocar permisos 
-- Revocar Permisos 
--REVOKE INSERT ON SCHEMA::dbo FROM LectoresBiblioteca;
-- Quitar uario del rol
--EXEC sp_droprolemember 'LectoresBiblioteca', 'AlumnoUser';
-- Eliminar usuario y login
--DROP USER AlumnoUser;
--DROP LOGIN AlumnoLogin;
--DROP ROLE LectoresBiblioteca;

-- Ejercicios:
-- Ej1
	-- 1. Cree un rol para usuarios con derechos de Seleccion e Insert
	-- 2. Añada 2 usuarios a este rol
	-- 3. Verifique lo anterior

-- Ej2
	-- 1. Crea un rol para usuarios con derechos de Actualizacion e Inserccion
	-- 2. Agrega 1 usuario a este rol
	-- 3. Verifique lo anterior

-- Ej3
	-- 1. Quite se los roles a todos los usuarios que se crearon
	-- 2. Elimine todos los roles creados
	-- 3. Elimine a todos los usuarios

-- Ej4
	-- 1. Crea un rol llamado PrestamosLibros con permisos de seleccion, inserccion y actualizacion
	-- 2. El rol solo se aplicara a las tablas y no a los catalogos
	-- 3. Crea un usuario para este rol

--  Ej5
	-- 1. Crea un rol llamado SoloLectura con solo el permiso de seleccion
	-- 2. El rol solo se aplicara a los catalogos y no a las tablas
	-- 3. Crea un usuario para este rol
	-- 4. Verifique lo anterior

 --Ej1
--CREATE LOGIN FreeFire1
--WITH PASSWORD = 'ElPepe2012*',
--	CHECK_POLICY = ON, -- Aplica politica de contraseñas
--	CHECK_EXPIRATION = OFF;

--CREATE LOGIN FreeFire2
--WITH PASSWORD = 'ElPepe2013*',
--	CHECK_POLICY = ON, -- Aplica politica de contraseñas
--	CHECK_EXPIRATION = OFF;

--USE BIBLIO_PrestamosLibros_DEV_APP
--GO
--CREATE USER FreeUser1 FOR LOGIN FreeFire1;
--CREATE USER FreeUser2 FOR LOGIN FreeFire2;

--CREATE ROLE Selene;
--GRANT SELECT, INSERT ON SCHEMA::dbo TO Selene;

--EXEC sp_addrolemember 'Selene', 'FreeUser1';
--EXEC sp_addrolemember 'Selene', 'FreeUser2';

--EXEC sp_helprolemember 'Selene';

 -- Verificar los permisos exactos asignados al rol 'Selene'
--SELECT dp.name AS RoleName, p.permission_name, p.state_desc, o.name AS ObjectName
--FROM sys.database_permissions AS p
--JOIN sys.database_principals AS dp ON p.grantee_principal_id = dp.principal_id
--LEFT JOIN sys.objects AS o ON p.major_id = o.object_id
--WHERE dp.name = 'Selene';

-- Ej2
--CREATE LOGIN EditorUserLogin
--WITH PASSWORD = 'EditorPassword123!',
--    CHECK_POLICY = ON,
--    CHECK_EXPIRATION = OFF;

--USE BIBLIO_PrestamosLibros_DEV_APP
--GO

--CREATE USER EditorUser FOR LOGIN EditorUserLogin;

--CREATE ROLE Editores;
--GRANT UPDATE, INSERT ON SCHEMA::dbo TO Editores;

--EXEC sp_addrolemember 'Editores', 'EditorUser';

--EXEC sp_helprolemember 'Editores';
--SELECT dp.name AS RoleName, p.permission_name, p.state_desc
--FROM sys.database_permissions AS p
--JOIN sys.database_principals AS dp ON p.grantee_principal_id = dp.principal_id
--WHERE dp.name = 'Editores';

-- Ej3
--USE BIBLIO_PrestamosLibros_DEV_APP
--GO

-- 1. Quitar usuarios de sus roles
--EXEC sp_droprolemember 'Selene', 'FreeUser1';
--EXEC sp_droprolemember 'Selene', 'FreeUser2';
--EXEC sp_droprolemember 'Editores', 'EditorUser';

-- 2. Eliminar los roles
--DROP ROLE Selene;
--DROP ROLE Editores;

-- 3. Eliminar los usuarios de la base de datos
--DROP USER FreeUser1;
--DROP USER FreeUser2;
--DROP USER EditorUser;
--GO

-- Cambiar al contexto de la base de datos master para eliminar los logins
--USE master
--GO

-- Eliminar los logins del servidor
--DROP LOGIN FreeFire1;
--DROP LOGIN FreeFire2;
--DROP LOGIN EditorUserLogin;

-- Ej4
-- Crear el Login a nivel de servidor
--CREATE LOGIN GestorPrestamosLogin
--WITH PASSWORD = 'GestorPassword123!',
--    CHECK_POLICY = ON,
--    CHECK_EXPIRATION = OFF;

-- Cambiar al contexto de la base de datos
--USE BIBLIO_PrestamosLibros_DEV_APP
--GO

-- Crear el usuario en la base de datos
--CREATE USER GestorPrestamosUser FOR LOGIN GestorPrestamosLogin;

-- 1. Crear el rol
--CREATE ROLE PrestamosLibros;

-- 2. Asignar permisos solo a tablas específicas
--GRANT SELECT, INSERT, UPDATE ON dbo.T_Alumno TO PrestamosLibros;
--GRANT SELECT, INSERT, UPDATE ON dbo.T_Libro TO PrestamosLibros;
--GRANT SELECT, INSERT, UPDATE ON dbo.T_Prestamo TO PrestamosLibros;
-- NOTA: Si las tablas tuvieran otros nombres, aquí se ajustarían.

-- 3. Asignar el usuario al rol
--EXEC sp_addrolemember 'PrestamosLibros', 'GestorPrestamosUser';

-- Verificar los permisos específicos del rol sobre los objetos
--SELECT dp.name AS RoleName, p.permission_name, p.state_desc, o.name AS ObjectName
--FROM sys.database_permissions AS p
--JOIN sys.database_principals AS dp ON p.grantee_principal_id = dp.principal_id
--JOIN sys.objects AS o ON p.major_id = o.object_id
--WHERE dp.name = 'PrestamosLibros';

-- Ej5
-- Crear el Login a nivel de servidor
--CREATE LOGIN LectorLogin
--WITH PASSWORD = 'LectorPassword456!',
--    CHECK_POLICY = ON,
--    CHECK_EXPIRATION = OFF;

-- Cambiar al contexto de la base de datos
--USE BIBLIO_PrestamosLibros_DEV_APP
--GO

-- 3. Crear el usuario en la base de datos
--CREATE USER LectorUser FOR LOGIN LectorLogin;

-- 1. Crear el rol
--CREATE ROLE SoloLectura;

-- 2. Asignar permisos de SELECCIÓN solo a las tablas de catálogo
--GRANT SELECT ON dbo.C_Autor TO SoloLectura;
--GRANT SELECT ON dbo.C_Carrera TO SoloLectura;
--GRANT SELECT ON dbo.C_Editorial TO SoloLectura;
--GRANT SELECT ON dbo.C_Genero TO SoloLectura;
--GRANT SELECT ON dbo.C_Grupo TO SoloLectura;

-- Asignar el usuario al rol
--EXEC sp_addrolemember 'SoloLectura', 'LectorUser';

-- 4. Verificar lo anterior
-- Verificar que el usuario 'LectorUser' es miembro del rol 'SoloLectura'
--EXEC sp_helprolemember 'SoloLectura';

-- Verificar los permisos específicos y los objetos a los que se aplican para el rol
--SELECT dp.name AS RoleName, p.permission_name, p.state_desc, o.name AS ObjectName
--FROM sys.database_permissions AS p
--JOIN sys.database_principals AS dp ON p.grantee_principal_id = dp.principal_id
--JOIN sys.objects AS o ON p.major_id = o.object_id
--WHERE dp.name = 'SoloLectura';