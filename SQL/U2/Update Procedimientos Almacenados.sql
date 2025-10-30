USE DB_EjerciciosVistas;
GO
IF OBJECT_ID('Libros', 'U') IS NOT NULL DROP TABLE Libros;
IF OBJECT_ID('Autore', 'U') IS NOT NULL DROP TABLE AUtores;
GO

CREATE TABLE Autores (
	AutorID INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(100) NOT NULL,
	Apellido VARCHAR(100) NOT NULL,
	Nacionalidad VARCHAR(50)
);
GO

CREATE TABLE Libros (
	LibroID INT PRIMARY KEY IDENTITY(1001,1),
	Titulo VARCHAR(200) NOT NULL,
	AutorID INT,
	AnioPublicacion INT,
	Precio DECIMAL(10,2)
	FOREIGN KEY (AutorID) REFERENCES Autores(AutorID)
);
GO

INSERT INTO Autores (Nombre, Apellido, Nacionalidad) VALUES
('Gabriel', 'Garcia Marquez', 'Colombiana'),
('Jane', 'Austen', 'Britanica'),
('George', 'Orwell', 'Britanica');

INSERT INTO Libros (Titulo, AutorID, AnioPublicacion, Precio) VALUES
('Cien años de soledad', 1, 1967, 25.50),
('Orgullo y prejuicio', 2, 1813, 15.00),
('1984', 3, 1949, 12.75),
('Rebelion en la granja', 3, 1945, 10.50),
('Emma', 2, 1815, 14.00),
('El amor en los tiempos del colera', 1, 1985, 20.99);

SELECT * FROM Autores;
SELECT * FROM Libros;