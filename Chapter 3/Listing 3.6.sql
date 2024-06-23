INSERT INTO dbo.Employees (
    EmployeeID
  , FirstName
  , LastName
  , DateOfBirth
  , EmployeeStartDate
  , ManagerID
  , Salary
  , Department
  , DepartmentCode
  , Role
  , WeeklyContractedHours
  , StaffOrContract
  , ContractEndDate
)
VALUES 
    (1, 'Simon', 'Gomez', '19691001', '20180101', NULL, 980000, 'C-Suite', 'CS', 'CEO', 40, 1, NULL),
    (2, 'Sanjay', 'Gupta', '19761001', '20180101', 1, 640000, 'C-Suite', 'CS', 'COO', 40, 1, NULL),
    (3, 'Ed', 'Ling', '19690403', '20200801', 1, 320000, 'C-Suite', 'CS', 'CPO', 40, 1, NULL),
    (4, 'Amanda', 'Ballard', '19830401', '20200301', 1, 350000, 'C-Suite', 'CS', 'Sales Director', 40, 1, NULL),

    (5, 'Bob', 'Walford', '19780908', '20191201', 2, 96000, 'Technology', 'TE', 'Head Of Technology', 40, 1, NULL),
    (6, 'Brian', 'Tilly', '19710102', '20181001', 2, 89000, 'Manufacturing', 'MA', 'Head Of Manufacturing', 40, 1, NULL),
    (7, 'Sally', 'Nugent', '19790302', '20220601', 2, 80000, 'Procurement', 'PR', 'Head Of Procurement', 40, 1, NULL),
    (8, 'Jamie', 'Briggs', '19900102', '20190601', 3, 65000, 'Human Resources', 'HR', 'HR Manager', 40, 1, NULL),
    (9, 'Lance', 'Bernard', '19910707', '20210601', 4, 98000, 'Sales & Marketing', 'SA', 'Head Of Sales', 40, 1, NULL),
    (10, 'Jo', 'Carver', '19900810', '20191201', 4, 70000, 'Sales & Marketing', 'SA', 'Head Of Marketing', 40, 1, NULL),

    (11, 'John', 'O''Shea', '19700609', '20180601', 5, 70000, 'Technology', 'TE', 'Development Manager', 40, 1, NULL),
    (12, 'Eric', 'Bristow', '20000109', '20221001', 5, 72000, 'Technology', 'TE', 'Infrastructure Manager', 40, 1, NULL),
    (13, 'Ronald', 'Sanders', '19601209', '20190101', 6, 45000, 'Manufacturing', 'MA', 'Shift Manager', 45, 1, NULL),
    (14, 'Amy', 'Fry', '19921101', '20190101', 6, 45000, 'Manufacturing', 'MA', 'Shift Manager', 45, 1, NULL),
    (15, 'Greg', 'Andrews', '19871212', '20190101', 6, 45000, 'Manufacturing', 'MA', 'Shift Manager', 45, 1, NULL),
    (16, 'Dave', 'Turney', '19760609', '20190101', 6, 52000, 'Manufacturing', 'MA', 'Warehouse Manager', 48, 1, NULL),
    (17, 'Mark', 'Sokolowski', '19960209', '20190901', 16, 42000, 'Manufacturing', 'MA', 'Goods Inn Manager', 40, 1, NULL),

    (18, 'Robin', 'Round', '19940409', '20190601', 3, 60000, 'Human Resources', 'HR', 'Recruitment Manager', 40, 1, NULL),
    (19, 'Lucy', 'Sykes', '19890201', '20200201', 9, 65000, 'Sales', 'SA', 'US Sales Manager', 40, 1, NULL),
    (20, 'Bruce', 'Bryant', '19860304', '20200301', 9, 70000, 'Sales', 'SA', 'International Sales Manager', 40, 1, NULL),
    (21, 'Ashwin', 'Kumar', '20010212', '20210601', 20, 55000, 'Sales', 'SA', 'Euro Sales Manager', 40, 1, NULL),
    (22, 'Emma', 'Roberts', '20000208', '20210601', 20, 55000, 'Sales', 'SA', 'APAC Sales Manager', 40, 1, NULL) ;
