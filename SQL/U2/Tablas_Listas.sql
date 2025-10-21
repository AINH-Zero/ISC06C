USE Testeando
GO
IF OBJECT_ID('Libros') IS NOT NULL DROP TABLE Libros;
IF OBJECT_ID('Autores') IS NOT NULL DROP TABLE Autores;

CREATE TABLE Autores (
	AutorID INT PRIMARY KEY IDENTITY(1,1),
	NombreAutor VARCHAR(100) NOT NULL,
	Nacionalidad VARCHAR(50)
);

CREATE TABLE Libros (
	LibroID INT PRIMARY KEY IDENTITY(1,1),
	Titulo VARCHAR(200) NOT NULL,
	AutorID INT FOREIGN KEY REFERENCES Autores(AutorID),
	AnioPublicacion INT,
	Disponible BIT NOT NULL,
	CostoAdquisicion MONEY
);

INSERT INTO Autores (NombreAutor, Nacionalidad) VALUES
('Gabriel Garcia Marquez', 'Colombiana'),
('Jane Austen', 'Britanica'),
('George Orwell', 'Britanica');

INSERT INTO Libros (Titulo, AutorID, AnioPublicacion, Disponible, CostoAdquisicion) VALUES
('Cien años de soledad', 1, 1967, 0, 150.00), -- Prestado
('Orgullo y prejuicio', 2, 1813, 1, 80.50), --Disponible
('1984', 3, 1949, 1, 95.00), --Disponible
('El amor en los tiempos del cólera', 1, 1985, 0, 120.00), --Prestado
('Rebelión en la Granja', 3, 1945, 1, 60.00); --Disponible