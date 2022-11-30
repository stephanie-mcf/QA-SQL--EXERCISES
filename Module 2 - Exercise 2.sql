SELECT da.DelegateID
FROM DelegateAttendance AS da
INNER JOIN CourseRun AS cr 
ON da.CourseRunID = cr.CourseRunID
INNER JOIN Course AS c
ON c.CourseID = cr.CourseID 
WHERE CourseName = 'QATSQL'
INTERSECT
SELECT da.DelegateID
FROM DelegateAttendance AS da
INNER JOIN CourseRun AS cr 
ON da.CourseRunID = cr.CourseRunID
INNER JOIN Course AS c
ON c.CourseID = cr.CourseID 
WHERE CourseName = 'QATSQLPLUS'
GO
