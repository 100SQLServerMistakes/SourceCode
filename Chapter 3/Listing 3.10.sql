SELECT
    EmployeeID
  , ManagerID
  , ROW_NUMBER() OVER (PARTITION BY ManagerID ORDER BY ManagerID) AS Incremental
INTO #Hierachy
FROM dbo.Employees 

;WITH HierarchyPathCTE AS (  
    SELECT 
         hierarchyid::GetRoot() AS ManagerHierarchyID
       , EmployeeID   
    FROM #Hierachy AS C   
    WHERE ManagerID IS NULL   
    UNION ALL   
    SELECT   
        CAST(hpc.ManagerHierarchyID.ToString() + CAST(h.Incremental AS VARCHAR(30)) + '/' AS HIERARCHYID)   
       ,h.EmployeeID  
FROM #Hierachy AS h 
JOIN HierarchyPathCTE AS hpc   
   ON h.ManagerID = hpc.EmployeeID   
)  

UPDATE e
    SET ManagerHierarchyID = hp.ManagerHierarchyID
FROM dbo.Employees e
INNER JOIN HierarchyPathCTE hp
    ON e.EmployeeID = hp.EmployeeID ;
