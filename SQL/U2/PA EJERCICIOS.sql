SELECT * FROM Clientes;
SELECT * FROM Productos;
SELECT * FROM Ventas;
--CREATE PROCEDURE ClientesRegistrados
--AS
--	BEGIN
--		SELECT NombreCliente, Ciudad 
--		FROM Clientes;
--	END
--GO

--EXEC ClientesRegistrados;

--CREATE PROCEDURE ProductosRegistrados
--AS
--	BEGIN
--		SELECT NombreProducto, Precio
--		FROM Productos;
--	END
--GO

--EXEC ProductosRegistrados;

--CREATE PROCEDURE Agregar_Cliente
--	@Nombre VARCHAR(50),
--	@Ciudad VARCHAR(50)
--AS
--	BEGIN
--		INSERT INTO Clientes (NombreCliente, Ciudad) VALUES (@Nombre, @Ciudad)
--	END
--GO

--EXEC Agregar_Cliente @Nombre = 'Sancudo', @Ciudad = 'Jesus Maria';

--CREATE PROCEDURE Ventas_Cliente
--	@ID INT
--AS
--	BEGIN
--		SELECT V.ClienteID, P.NombreProducto, V.Cantidad, V.FechaVenta
--		FROM Ventas AS V
--		INNER JOIN Productos AS P ON V.ProductoID = P.ProductoID
--		WHERE V.ClienteID = @ID
--	END
--GO

--EXEC Ventas_Cliente @ID = 1;

--CREATE PROCEDURE Gasto_Cliente
--	@ID INT
--AS
--	BEGIN
--		SELECT V.ClienteID, SUM((V.Cantidad*P.Precio))
--		FROM Ventas AS V
--		INNER JOIN Productos AS P ON V.ProductoID = P.ProductoID
--		WHERE V.ClienteID = @ID
--		GROUP BY V.ClienteID
--	END
--GO

--EXEC Gasto_Cliente @ID = 1;

--CREATE PROCEDURE Producto_Ingreso
--AS
--	BEGIN
--		SELECT P.NombreProducto, SUM((V.Cantidad*P.Precio)) AS Total
--		FROM Ventas AS V
--		INNER JOIN Productos AS P ON V.ProductoID = P.ProductoID
--		GROUP BY P.NombreProducto
--	END
--GO

--EXEC Producto_Ingreso;