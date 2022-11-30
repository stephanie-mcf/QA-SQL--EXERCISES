DECLARE @ProductID INT = 1
DECLARE @Amount INT = 20

IF (@ProductID IS NULL OR @Amount IS NULL)
BEGIN;
THROW 50000, 'Neither variable is allowed to be NULL', 1
RETURN
END

BEGIN TRY
BEGIN TRAN 
INSERT INTO BookTransfers VALUES 
(@ProductID, getdate(), 'Transfer Out', @Amount 
UPDATE dbo.BookStock
SET StockAmount = StockAmount - @Amount
WHERE ProductID = @ProductID 
COMMIT TRAN
END TRY
BEGIN CATCH
ROLLBACK TRAN; 
THROW 59999, 'An error occured in the transaction. Everything rolled back', 1
END CATCH 
GO