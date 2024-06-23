CREATE DATABASE MagicChoc ;
GO

USE MagicChoc ;
GO

CREATE TABLE dbo.BackOrders (
    BackOrderManufacturingID          INT    NOT NULL    IDENTITY    PRIMARY KEY,
    ProductNextManufactureDate        DATE   NOT NULL,
    ProductNextManufactureQuantity    INT    NOT NULL
) ;

CREATE TABLE dbo.ProductCategories (
    ProductCategoryID             SMALLINT         NOT NULL    IDENTITY    PRIMARY KEY,
    ProductCategoryName           NVARCHAR(64)     NOT NULL,
    ProductCategoryDescription    NVARCHAR(256)    NULL
) ;

CREATE TABLE dbo.ProductSubcategories (
    ProductSubcategoryID             SMALLINT         NOT NULL    IDENTITY    PRIMARY KEY,
    ProductCategoryID                SMALLINT         NOT NULL    REFERENCES dbo.ProductCategories(ProductCategoryID),
    ProductSubcategoryName           NVARCHAR(64)     NOT NULL,
    ProductSubcategoryDescription    NVARCHAR(256)    NULL
) ;

CREATE TABLE dbo.ProductTypes (
    ProductTypeID             SMALLINT        NOT NULL    IDENTITY    PRIMARY KEY,
    ProductTypeName           NVARCHAR(64)    NOT NULL,
    ProductTypeDescription    NVARCHAR(256)   NOT NULL
) ;

CREATE TABLE dbo.Products (
    ProductID                   INT             NOT NULL    IDENTITY    PRIMARY KEY,
    ProductName                 NVARCHAR(64)    NOT NULL,
    ProductStockLevel           INT             NOT NULL,
    BackOrderManufacturingID    INT             NULL    REFERENCES dbo.BackOrders(BackOrderManufacturingID),
    ProductTypeID               SMALLINT        NOT NULL    REFERENCES dbo.ProductTypes(ProductTypeID),
    ProductSubcategoryID        SMALLINT        NOT NULL    REFERENCES dbo.ProductSubcategories(ProductSubcategoryID)
) ;

CREATE TABLE dbo.Addresses (
    AddressID    INT              NOT NULL    IDENTITY    PRIMARY KEY,
    Street       NVARCHAR(128)    NOT NULL,
    Area         NVARCHAR(64)     NULL,
    City         NVARCHAR(64)     NOT NULL,
    ZipCode      NVARCHAR(10)     NOT NULL
) ;

CREATE TABLE dbo.SupplierContacts (
    SupplierContactID           INT              NOT NULL    IDENTITY    PRIMARY KEY,
    SupplierContactFirstName    NVARCHAR(32)     NOT NULL,
    SupplierContactLastName     NVARCHAR(32)     NOT NULL,
    SupplierContactEmail        NVARCHAR(256)    NOT NULL
) ;

CREATE TABLE dbo.Suppliers (
    SupplierID           INT             NOT NULL    IDENTITY    PRIMARY KEY,
    SupplierName         NVARCHAR(32)    NOT NULL,
    SupplierContactID    INT             NOT NULL    REFERENCES dbo.SupplierContacts(SupplierContactID),
    SupplierAddressID    INT             NOT NULL    REFERENCES dbo.Addresses(AddressID)
) ;

CREATE TABLE dbo.PurchaseOrderHeaders (
    PurchaseOrderNumber    INT     NOT NULL    PRIMARY KEY,
    SupplierID             INT     NOT NULL    REFERENCES dbo.Suppliers(SupplierID),
    PurchaseOrderDate      DATE    NOT NULL
) ;

CREATE TABLE dbo.PurchaseOrderDetails (
    PurchaseOrderDetailsID    INT    NOT NULL    IDENTITY    PRIMARY KEY,
    ProductID                 INT    NOT NULL    REFERENCES dbo.Products(ProductID),
    Quantity                  INT    NOT NULL,
    PurchaseOrderNumber       INT    NOT NULL
) ;

CREATE TABLE dbo.CustomerContacts (
    CustomerContactID           INT              NOT NULL    IDENTITY    PRIMARY KEY,
    CustomerContactFirstName    NVARCHAR(32)     NOT NULL,
    CustomerContactLastName     NVARCHAR(32)     NOT NULL,
    CustomerContactEmail        NVARCHAR(256)    NOT NULL
) ;

CREATE TABLE dbo.Customers (
    CustomerID             INT             NOT NULL    IDENTITY    PRIMARY KEY,
    CustomerCompanyName    NVARCHAR(32)    NOT NULL,
    CustomerContactID      INT             NOT NULL    REFERENCES dbo.CustomerContacts(CustomerContactID),
    InvoiceAddressID       INT             NOT NULL    REFERENCES dbo.Addresses(AddressID),
    DeliveryAddressID      INT             NOT NULL    REFERENCES dbo.Addresses(AddressID)
) ;

CREATE TABLE dbo.SalesAreas (
    SalesAreaID                  SMALLINT        NOT NULL    IDENTITY    PRIMARY KEY,
    SalesAreaName                NVARCHAR(32)    NOT NULL,
    SalesAreaManagerFirstName    NVARCHAR(32)    NOT NULL,
    SalesAreaManagerLastName     NVARCHAR(32)    NOT NULL
) ;

CREATE TABLE dbo.SalesPersons (
    SalesPersonID           SMALLINT         NOT NULL    IDENTITY    PRIMARY KEY,
    SalesPersonFirstName    NVARCHAR(32)     NOT NULL,
    SalesPersonLastName     NVARCHAR(32)     NOT NULL,
    SalesPersonEmail        NVARCHAR(256)    NOT NULL
) ;

CREATE TABLE dbo.SalesOrderHeaders (
    SalesOrderNumber               NCHAR(12)       NOT NULL    PRIMARY KEY,
    SalesOrderDate                 DATE            NOT NULL,
    SalesPersonID                  SMALLINT        NOT NULL    REFERENCES dbo.SalesPersons(SalesPersonID),
    SalesAreaID                    SMALLINT        NOT NULL    REFERENCES dbo.SalesAreas(SalesAreaID),
    CustomerID                     INT             NOT NULL    REFERENCES dbo.Customers(CustomerID),
    SalesOrderDeliveryDueDate      DATE            NOT NULL,
    SalesOrderDeliveryActualDate   DATE            NULL,
    CurrierUsedforDelivery         NVARCHAR(32)    NOT NULL
) ;

CREATE TABLE dbo.SalesOrderDetails (
    SalesOrderDetailsID    INT          NOT NULL    IDENTITY    PRIMARY KEY,
    ProductID              INT          NOT NULL    REFERENCES dbo.Products(ProductID),
    Quantity               INT          NOT NULL,
    SalesOrderNumber       NCHAR(12)    NOT NULL    REFERENCES dbo.SalesOrderHeaders(SalesOrderNumber)
) ;
GO
