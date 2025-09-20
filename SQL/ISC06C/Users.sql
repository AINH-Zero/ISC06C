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