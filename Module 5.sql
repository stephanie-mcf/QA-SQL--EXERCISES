
CREATE FUNCTION dbo.TopOrderss(@sd DateTime, @ci varchar(10)) RETURNS TABLE
	AS
	RETURN
		SELECT TOP 50
	OrderDate, o.CustomerID, od.UnitPrice * Quantity AS TotalPrice 
FROM 
	Orders o JOIN [Order Details] od ON o.OrderID = od.OrderID JOIN Products p ON od.ProductID = p.ProductID
WHERE o.OrderDate >= @sd AND o.CustomerID = @ci 
ORDER BY TotalPrice DESC
GO 


	SELECT c.CustomerID, o.TotalPrice
	FROM Customers c
	CROSS APPLY 
	dbo.TopOrderss('1970', CustomerID) AS o