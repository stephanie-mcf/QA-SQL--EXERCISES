SELECT VendorName, CourseName, StartDate, SUM(NumberDelegates) AS TotalDelegates 
FROM dbo.VendorCourseDateDelegateCount
GROUP BY GROUPING SETS (
(VendorName), 
(Vendorname, CourseName, StartDate)
)
GO 

SELECT VendorName, CourseName, StartDate, SUM(NumberDelegates) AS TotalDelegates,
GROUPING_ID(VendorName, CourseName, StartDate) AS GroupingType
FROM dbo.VendorCourseDateDelegateCount
GROUP BY GROUPING SETS (
(VendorName), 
(Vendorname, CourseName),
(VendorName, CourseName, StartDate)
)
