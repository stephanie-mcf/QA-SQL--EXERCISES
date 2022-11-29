CREATE FUNCTION udf_DelegateDayss()
RETURNS TABLE
AS
RETURN (
	SELECT d.DelegateID, Sum(cr.DurationDays) AS DelegateDays, Count(*) AS DelegateCourses 
		FROM Delegate as d
	INNER JOIN DelegateAttendance as da
	ON d.DelegateID = da.DelegateID
	INNER JOIN CourseRun as cr
	ON cr.CourseRunID = da.CourseRunID
	GROUP BY d.DelegateID
 )
 GO
 SELECT * FROM dbo.udf_DelegateDayss()

CREATE FUNCTION udf_IndividualDelegateDayss (@DelegateID INT)
RETURNS TABLE
AS
RETURN (
	SELECT d.DelegateID, Sum(cr.DurationDays) AS DelegateDays, Count(*) AS DelegateCourses 
		FROM Delegate as d
	INNER JOIN DelegateAttendance as da
	ON d.DelegateID = da.DelegateID
	INNER JOIN CourseRun as cr
	ON cr.CourseRunID = da.CourseRunID
	GROUP BY d.DelegateID
	)
GO
SELECT * FROM dbo.udf_IndividualDelegateDays(1)