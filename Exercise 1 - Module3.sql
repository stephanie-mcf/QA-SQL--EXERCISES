SELECT ProductID, TransferDate, TransferAmount
FROM BookTransfers

SELECT ProductID, SUM(TransferAmount) AS Stock
FROM BookTransfers
Group BY ProductID

SELECT ProductID, TransferDate, TransferAmount,
SUM(TransferAmount) OVER
(PARTITION BY ProductID ORDER BY TransferDate)
AS RunningStock
FROM BookTransfers

SELECT * RANK() OVER (ORDER BY NumberDelegates DESC)
as LeaguePos_Rank,
DENSE_RANK() OVER(ORDER BY NumberDelegates DESC)
AS LeaguePos_DenseRank,
ROW_NUMBER() OVER (ORDER BY NumberDelegates DESC)
AS LeaguePos_Row,
NTILE(3) OVER (ORDER BY NumberDelegates DESC)
AS LeaguePos_Ntile
FROM VendorCourseDelegateCount
GO