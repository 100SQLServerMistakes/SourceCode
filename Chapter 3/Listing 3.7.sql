DECLARE @ManagerID INT ;

SET @ManagerID = 2

;WITH EmployeeCTE AS (
    SELECT 
          EmployeeId
        , FirstName
        , LastName
        , ManagerId
    FROM dbo.Employees 
    WHERE EmployeeId = @ManagerID
    UNION ALL
    SELECT 
          Emp.EmployeeId
        , Emp.FirstName
        , Emp.LastName
        , Emp.ManagerId 
    FROM dbo.Employees AS Emp
    INNER JOIN EmployeeCTE AS CTE 
        ON CTE.EmployeeId=Emp.ManagerId
)
SELECT 
      Emp.EmployeeID
    , Emp.FirstName
    , Emp.LastName
    , Emp.ManagerID
    , Mgr.FirstName AS ManagerFirstName
    , Mgr.LastName AS ManagerLastName
FROM EmployeeCTE Emp
INNER JOIN dbo.Employees Mgr 
    ON Emp.ManagerID = Mgr.EmployeeID ; 
