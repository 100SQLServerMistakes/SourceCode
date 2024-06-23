DECLARE @RawContractDetails XML ;
DECLARE @InternalEmployeeData TABLE (
      EmployeeStartDate        DATE    
    , ManagerID                SMALLINT
    , Salary                   MONEY
    , Department               NVARCHAR(64)
    , DepartmentCode           NCHAR(2)
    , Role                     NVARCHAR(64)
    , WeeklyContractedHours    INT
    , StaffOrContract          BIT
    , ContractEndDate          DATE
    , ManagerHierarchyID       HIERARCHYID
) ;

INSERT INTO @InternalEmployeeData
VALUES ('20230101', 14, 39000, 'Manufacturing', 'MA', 'Warehouse Operative', 40, 0, '20231231', '/1/2/2/1/') ;

SET @RawContractDetails = N'<EmployeeContracts>
    <Employee>
        <EmployeeID>25</EmployeeID>
        <FirstName>Robert</FirstName>
        <LastName>Blake</LastName>
        <DateOfBirth>19781212</DateOfBirth>
        <Contracts>
            <Contract>
                <StartDate>20200101</StartDate>
                <EndDate>20200603</EndDate>
                <Skills>
                    <Skill>Forklift driver</Skill>
                    <Skill>Picker</Skill>
                    <Skill>Packer</Skill>
                </Skills>
            </Contract>
            <Contract>
                <StartDate>20210101</StartDate>
                <EndDate>20211231</EndDate>
                <Skills>
                    <Skill>Picker</Skill>
                    <Skill>Stock Take</Skill>
                </Skills>
            </Contract>
        </Contracts>
    </Employee>
</EmployeeContracts>' ;

INSERT INTO dbo.Employees
SELECT
     @RawContractDetails.value('(/EmployeeContracts/Employee/EmployeeID)[1]', 'SMALLINT') AS EmployeeID
   ,@RawContractDetails.value('(/EmployeeContracts/Employee/FirstName)[1]', 'NVARCHAR(32)') AS FirstName
    ,@RawContractDetails.value('(/EmployeeContracts/Employee/LastName)[1]', 'NVARCHAR(32)') AS LastName
   ,@RawContractDetails.value('(/EmployeeContracts/Employee/DateOfBirth)[1]', 'DATE') AS DateOfBirth
    , EmployeeStartDate   
    , ManagerID   
    , Salary  
    , Department
    , DepartmentCode   
    , Role       
    , WeeklyContractedHours  
    , StaffOrContract  
    , ContractEndDate   
    , ManagerHierarchyID  
    , @RawContractDetails AS PreviousContracts
FROM @InternalEmployeeData ;
