INSERT INTO dbo.SalesPersons (SalesPersonFirstName, SalesPersonLastName, SalesPersonEmail)
VALUES 
    ('Robin', 'Wells', 'robin.wells@magicchoc.com'),
    ('Jack', 'Jones', 'jack.jones@magicchoc.com'),
    ('Jane', 'Smith', 'jane.smith@magicchoc.com') ;

INSERT INTO dbo.SalesAreas (SalesAreaName, SalesAreaManagerFirstName, SalesAreaManagerLastName)
VALUES
    ('US', 'Lucy', 'Sykes'),
    ('Euro', 'Ashwin', 'Kumar'),
    ('APAC', 'Emma', 'Roberts') ;

INSERT INTO dbo.Addresses (Street, Area, City, ZipCode)
VALUES 
    ('744 Saxon Rd', NULL, 'Crawfordsville', '47933'),
    ('267 Old York Ave.', NULL, 'Reno', '89523'),
    ('923 Taylor Ave.', NULL, 'Charlotte', '28205'),
    ('942 Cactus Street', NULL, 'Albany', '12203'),
    ('32 Selby Drive', NULL, 'Pittsfield', '01201'),
    ('65 New Street', 'Landford', 'Salisbury', 'SP5 2QP') ;

INSERT INTO dbo.CustomerContacts (CustomerContactFirstName, CustomerContactLastName, CustomerContactEmail)
VALUES
    ('Ralphie', 'Buchanan', 'Ralphie.Buchanan@Pitt.com'),
    ('Bettie', 'Peters', 'bpeters@cookingschmooking.co.uk'),
    ('Zackery', 'McEachern', 'Zackery.McEachern@wilsonindustries.com') ;


INSERT INTO dbo.Customers (CustomerCompanyName, CustomerContactID, InvoiceAddressID, DeliveryAddressID)
VALUES
    ('Pitt and Co', 1, 1, 2),
    ('Cooking Schmooking', 2, 3, 4),
    ('Wilson Industries', 3, 6, 6) ;


INSERT INTO dbo.SalesOrderHeaders (SalesOrderNumber, SalesOrderDate, SalesPersonID, SalesAreaID, CustomerID, SalesOrderDeliveryDueDate, SalesOrderDeliveryActualDate, CurrierUsedforDelivery)
VALUES 
    ('COO1634D-U06', '20230501', 1, 1, 1, '20230503', '20230503', 'LHD'),
    ('WIL1635D-E16', '20230616', 2, 2, 3, '20230630', NULL, 'GoodSpeed International'),
    ('PIT1636D-U04', '20230616', 3, 1, 1, '20230706', NULL, 'LHD') ;
GO

CREATE NONCLUSTERED INDEX NI_SalesOrderHeaders_OrderDate ON SalesOrderHeaders(SalesOrderDate) ;
CREATE NONCLUSTERED INDEX NI_SalesOrderHeaders_SalesAreaID ON SalesOrderHeaders(SalesAreaID) ;
CREATE NONCLUSTERED INDEX NI_SalesOrderHeaders_CustomerID ON SalesOrderHeaders(CustomerID) ;
