SELECT VendorName, CourseName, StartDate, SUM(NumberDelegates)
FROM dbo.VendorCourseDateDelegateCount
GROUP BY VendorName, CourseName, StartDate WITH ROLLUP