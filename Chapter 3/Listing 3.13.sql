DECLARE @EmployeeID INT ;

SET @EmployeeID = 14 ;

SELECT 
    FirstName
  , LastName
  , Salary
FROM dbo.Employees
WHERE ManagerHierarchyID.GetLevel() = (
    SELECT 
        ManagerHierarchyID.GetLevel()
    FROM dbo.Employees
    WHERE EmployeeID = @EmployeeID
) ;
