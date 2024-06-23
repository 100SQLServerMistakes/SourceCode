DECLARE @RawContractDetails XML ;
DECLARE @ParsedContractDetails INT ;
DECLARE @ShreddedData TABLE (
      EmployeeID           INT
    , FirstName            NVARCHAR(32)
    , LastName             NVARCHAR(32)
    , DateOfBirth          DATE
    , ContractStartDate    DATE
    , ContractEndDate      DATE
    , Skill                NVARCHAR(30)
) ;
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
        <EmployeeID>23</EmployeeID>
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

EXEC sp_xml_preparedocument @ParsedContractDetails OUTPUT, @RawContractDetails ;

INSERT INTO @ShreddedData    #D
SELECT *   
FROM OPENXML(@ParsedContractDetails, '/EmployeeContracts/Employee/Contracts/Contract/Skills/Skill', 2)
WITH (
    EmployeeID           SMALLINT        '../../../../EmployeeID',
    FirstName            NVARCHAR(32)    '../../../../FirstName',
    LastName             NVARCHAR(32)    '../../../../LastName',
    DateOfBirth          DATE            '../../../../DateOfBirth',
    ContractStartDate    DATE            '../../StartDate',
    ContractEndDate      DATE            '../../EndDate',
    Skill                NVARCHAR(30)    'text()'
) ;

SET XACT_ABORT ON ;

BEGIN TRANSACTION
    INSERT INTO dbo.Employees
    SELECT 
          s.EmployeeID
        , s.FirstName
        , s.LastName
        , s.DateOfBirth
        , i.EmployeeStartDate
        , i.ManagerID
        , i.Salary
        , i.Department
        , i.DepartmentCode
        , i.Role
        , i.WeeklyContractedHours
        , i.StaffOrContract
        , i.ContractEndDate
        , i.ManagerHierarchyID
    FROM @ShreddedData s
    INNER JOIN @InternalEmployeeData i
        ON 1=1
    GROUP BY 
          s.EmployeeID
        , s.FirstName
        , s.LastName
        , s.DateOfBirth
        , i.EmployeeStartDate
        , i.ManagerID
        , i.Salary
        , i.Department
        , i.DepartmentCode
        , i.Role
        , i.WeeklyContractedHours
        , i.StaffOrContract
        , i.ContractEndDate
        , i.ManagerHierarchyID ;

    INSERT INTO dbo.ContractHistory(EmployeeID, ContractStartDate, ContractEndDate)
    SELECT
          EmployeeID
        , ContractStartDate
        , ContractEndDate
    FROM @ShreddedData
    GROUP BY 
          EmployeeID
        , ContractStartDate
        , ContractEndDate ;

    INSERT INTO dbo.ContractSkills(ContractHistoryID, SkillID)
    SELECT
          ch.ContractHistoryID  
        , s.SkillsID 
    FROM @ShreddedData sd
    INNER JOIN dbo.Skills s
        ON TRIM(s.Skill) = TRIM(sd.Skill)
    INNER JOIN dbo.ContractHistory ch
        ON sd.EmployeeID = ch.EmployeeID
            AND sd.ContractStartDate = ch.ContractStartDate
            AND sd.ContractEndDate = ch.ContractEndDate ;

COMMIT

EXEC sp_xml_removedocument @ParsedContractDetails ;
