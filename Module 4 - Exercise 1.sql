SELECT * FROM dbo.VendorCourseDateDelegateCount

SELECT * FROM (
SELECT VendorName, StartDate, NumberDelegates 
FROM dbo.VendorCourseDateDelegateCount) AS BaseData--Derived table
PIVOT 
(SUM(NumberDelegates) FOR VendorName IN (QA, Microsoft, Oracle))
AS Pivotted



