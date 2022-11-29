CREATE VIEW dbo.CourseList AS
SELECT c.CourseName, c.CourseId, v.VendorName
FROM Vendor AS v 
JOIN Course AS c
ON v.VendorID = c.VendorID
GO
SELECT * FROM dbo.CourseList