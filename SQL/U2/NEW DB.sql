-- --------------------------------------------------------------------
-- PARTE 1: SETUP DEL ENTORNO (Tablas y Datos)
-- --------------------------------------------------------------------

-- Crear la base de datos si no existe, para aislar el ejercicio.
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'DB_EjerciciosVistas')
BEGIN
    CREATE DATABASE DB_EjerciciosVistas;
END
GO

-- Usar la base de datos reci�n creada para todas las operaciones.
USE DB_EjerciciosVistas;
GO

-- Eliminaci�n de tablas preexistentes (para asegurar un ambiente limpio antes de crear).
IF OBJECT_ID('Asignaciones', 'U') IS NOT NULL DROP TABLE Asignaciones;
IF OBJECT_ID('Proyectos', 'U') IS NOT NULL DROP TABLE Proyectos;
IF OBJECT_ID('Empleados', 'U') IS NOT NULL DROP TABLE Empleados;
IF OBJECT_ID('Departamentos', 'U') IS NOT NULL DROP TABLE Departamentos;
GO

-- 1.1. Tabla de Departamentos
CREATE TABLE Departamentos (
    DepartamentoID INT PRIMARY KEY,
    NombreDepartamento VARCHAR(50) NOT NULL,
    Ubicacion VARCHAR(50)
);

-- 1.2. Tabla de Empleados
CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY,
    NombreCompleto VARCHAR(100) NOT NULL,
    DepartamentoID INT NOT NULL,
    Salario DECIMAL(10, 2) NOT NULL,
    FechaContratacion DATE NOT NULL,
    -- Definici�n de la clave for�nea que enlaza con la tabla Departamentos
    FOREIGN KEY (DepartamentoID) REFERENCES Departamentos(DepartamentoID)
);

-- 1.3. Tabla de Proyectos
CREATE TABLE Proyectos (
    ProyectoID INT PRIMARY KEY,
    NombreProyecto VARCHAR(100) NOT NULL,
    Presupuesto DECIMAL(12, 2) NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFinPrevista DATE
);

-- 1.4. Tabla de Asignaciones (Relaci�n Muchos a Muchos: Empleado-Proyecto)
CREATE TABLE Asignaciones (
    AsignacionID INT PRIMARY KEY IDENTITY(1,1),
    EmpleadoID INT NOT NULL,
    ProyectoID INT NOT NULL,
    HorasSemanales INT NOT NULL,
    -- Claves for�neas para Empleados y Proyectos
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID),
    FOREIGN KEY (ProyectoID) REFERENCES Proyectos(ProyectoID)
);
GO

-- 1.5. Inserci�n de Datos de Prueba para poblar las tablas

INSERT INTO Departamentos (DepartamentoID, NombreDepartamento, Ubicacion) VALUES
(101, 'Tecnolog�a', 'Piso 3'),
(102, 'Ventas', 'Piso 1'),
(103, 'Recursos Humanos', 'Piso 2');

INSERT INTO Empleados (EmpleadoID, NombreCompleto, DepartamentoID, Salario, FechaContratacion) VALUES
(1, 'Ana Torres', 101, 65000.00, '2023-01-15'), -- Tecnolog�a
(2, 'Luis Garc�a', 101, 78000.00, '2022-05-20'), -- Tecnolog�a
(3, 'Marta Ruiz', 102, 55000.00, '2024-03-01'), -- Ventas
(4, 'Pedro Soto', 102, 52000.00, '2023-11-10'), -- Ventas
(5, 'Elena Ramos', 103, 48000.00, '2024-07-25'); -- RRHH

INSERT INTO Proyectos (ProyectoID, NombreProyecto, Presupuesto, FechaInicio, FechaFinPrevista) VALUES
(50, 'Desarrollo App M�vil', 150000.00, '2024-08-01', '2025-02-28'), -- Presupuesto alto
(51, 'Campa�a Q4 Ventas', 80000.00, '2024-10-01', '2024-12-31'),    -- Presupuesto medio
(52, 'Actualizaci�n RRHH', 40000.00, '2024-09-15', '2025-01-31');    -- Presupuesto bajo

INSERT INTO Asignaciones (EmpleadoID, ProyectoID, HorasSemanales) VALUES
(1, 50, 40), -- Ana (Tec) -> App M�vil
(2, 50, 30), -- Luis (Tec) -> App M�vil
(2, 52, 10), -- Luis (Tec) -> Actualizaci�n RRHH (Proyecto de otro depto)
(3, 51, 40), -- Marta (Ventas) -> Campa�a Q4
(4, 51, 40), -- Pedro (Ventas) -> Campa�a Q4
(5, 52, 40); -- Elena (RRHH) -> Actualizaci�n RRHH
GO