EXEC sp_addmessage 50003, 16, 'Vendor %s cannot be found'
GO 

RAISERROR(50003, 16, 1, 'Red Hat')
GO

DECLARE @Vendor VARCHAR(100)
set @Vendor = 'QA' 

IF @Vendor IS NULL 
BEGIN 
PRINT 'Vendor must not be NULL' 
RETURN 
END 

IF NOT EXISTS (SELCT * FROM Vendor WHERE VendorName = @Vendor)
BEGIN 
PRINT 'Vendor' + @Vendor + 'does not exist'
RETURN
END

SELECT * 
FROM Course AS c
INNER JOIN Vendor AS V
ON C.VendorID = V.VendorID
WHERE VendorName = @Vendor
GO


DECLARE @Vendor VARCHAR(100)
SET @Vendor = 'QA'

IF @Vendor IS NULL
BEGIN;
THROW 54000, 'Vendor must not be NULL', 1
RETURN
END


IF NOT EXISTS (SELECT * FROM Vendor WHERE VendorName = @Vendor)
BEGIN;
THROW 54000, 'Vendor cannot be found', 1
RETURN 
END


SELECT *
FROM Course AS c 
INNER JOIN Vendor AS V
ON c.VendorID = V.VendorID
WHERE VendorName = @Vendor
GO

DECLARE @Vendor VARCHAR(100)
SET @Vendor = 'AQ'

IF @Vendor IS NULL
BEGIN;
THROW 54000, 'Vendor must not be NULL', 1
RETURN 
END 

IF NOT EXISTS (SELECT * FROM Vendor WHERE VendorName = @Vendor)
BEGIN
DECLARE @msg VARCHAR(100)

