CREATE DATABASE PROCESOSALMACENADOS_DB;
GO
/*
	Preparación del Entorno
*/

-- Eliminación previa para evitar conflictos si el script se reejecuta

IF OBJECT_ID('Ventas') IS NOT NULL DROP TABLE Ventas;
IF OBJECT_ID('Clientes') IS NOT NULL DROP TABLE Clientes;
IF OBJECT_ID('Productos') IS NOT NULL DROP TABLE Productos;

-- Tabla de Clientes: almacena información básica de clientes
CREATE TABLE Clientes (
	ClienteID INT PRIMARY KEY IDENTITY(1,1),		-- Clave primaria autoincremental
	NombreCliente VARCHAR(100) NOT NULL,			-- Nombre completo
	Ciudad VARCHAR(50)								-- (Ciudad de origen);
);

-- Tabla de Productos: contiene catálogo de productos
CREATE TABLE Productos (
	ProductoID INT PRIMARY KEY IDENTITY(1,1),		-- Clave primaria autoincremental
	NombreProducto VARCHAR(100) NOT NULL,			-- Nombre del producto
	Precio MONEY NOT NULL							-- Precio unitario;
);

-- Tabla de Ventas: registra cada transacción de venta
CREATE TABLE Ventas (
	VentaID INT PRIMARY KEY IDENTITY(1,1),			-- Clave primaria autoincremental
	ClienteID INT FOREIGN KEY REFERENCES Clientes(ClienteID), -- Cliente que realizó la compra
	ProductoID INT FOREIGN KEY REFERENCES Productos(ProductoID), -- Producto vendido
	FechaVenta DATE,								-- Fecha de la venta
	Cantidad INT
);

-- Inserción de datos de ejemplo
INSERT INTO Clientes (NombreCliente, Ciudad) VALUES
('Maria Lopez', 'Guadalajara'),
('Carlos Perez', 'Monterrey'),
('Lucia Torres', 'Aguascalientes');

INSERT INTO Productos (NombreProducto, Precio) VALUES
('Laptop', 15000),
('Celular', 8000),
('Tablet', 6000);

INSERT INTO Ventas (ClienteID, ProductoID, FechaVenta, Cantidad) VALUES
(1, 1, '2025-10-01', 1),
(2, 2, '2025-10-03', 2),
(3, 3, '2025-10-05', 1),
(1, 2, '2025-10-07', 1);