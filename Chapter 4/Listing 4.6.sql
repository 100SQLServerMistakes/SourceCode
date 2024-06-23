INSERT INTO dbo.ProductCategories (ProductCategoryName, ProductCategoryDescription)
VALUES
    ('Raw Ingridience', NULL),
    ('Machine Parts', 'Parts used by manufacturing for machine maintenance'),
    ('Misc', 'Office supplies and other miscelaneous stock items'),
    ('Services', 'Non-stock purchases, such as transport'),
    ('Confectionary Products', NULL),
    ('Non-confectionary Products', NULL) ;

INSERT INTO dbo.ProductSubcategories (ProductCategoryID, ProductSubcategoryName, ProductSubcategoryDescription)
VALUES
    (1, 'Chilled Ingredience', 'Ingredience that must be kept between 1C and 5C'),
    (1, 'Frozen Ingredience', 'Ingredience must be kept below -18C'),
    (1, 'Ambient Ingredience', 'Ingredience that should be kept in cool, dry storage'),
    (2, 'Line 1 Components', 'Components required for manufacturing line 1'),
    (2, 'Line 2 Components', 'Components required for manufacturing line 1'),
    (2, 'Line 3 Components', 'Components required for manufacturing line 1'),
    (2, 'Line 4 Components', 'Components required for manufacturing line 1'),
    (3, 'Office Supplies', 'Stationary, etc'),
    (3, 'Misc', NULL),
    (4, 'Curriers', NULL),
    (4, 'Building Maintenance', NULL),
    (5, 'Boxes of chocolates', NULL),
    (5, 'Sweets', NULL),
    (5, 'Chocolate Bars', NULL),
    (6, 'Packaging', 'Product Packaging'),
    (6, 'Merchandise', 'Non-core items which are procured and sold, such as mugs and branded gifts') ;

INSERT INTO dbo.ProductTypes (ProductTypeName, ProductTypeDescription)
VALUES
    ('Purchased Product', 'Products which are purchased'),
    ('Sold products', 'Products which are sold'),
    ('Traded Products', 'Products which are both bought and sold') ;

INSERT INTO dbo.SupplierContacts (SupplierContactFirstName, SupplierContactLastName, SupplierContactEmail)
VALUES
    ('John', 'Smith', 'john.smith@smithfields.com'),
    ('John', 'Doe', 'john.doe@unknownengineering.com'),
    ('Michael', 'Knight', 'mknight@knightridercurriers.com') ;

INSERT INTO dbo.Addresses (Street, City, ZipCode)   --x3 suppliers
VALUES
    ('8648 Columbia Street', 'Beachwood', '44122'),
    ('83 Addison Dr.', 'Westerville', '43081'),
    ('508 Mill Pond Street', 'Clinton Township', '48035') ;

INSERT INTO dbo.Suppliers (SupplierName, SupplierContactID, SupplierAddressID)
VALUES
    ('Smithfeilds', 1, 7),
    ('Unknown Engineering', 2, 8),
    ('Knight Rider Curriers', 3, 9) ;

INSERT INTO dbo.Products (ProductName, ProductStockLevel, ProductTypeID, ProductSubcategoryID)
VALUES
    ('Large head sprocket', 3, 1, 4),
    ('Long weight', 6, 1, 4),
    ('Staples', 8900, 1, 8),
    ('Magic Mug', 38, 3, 16),
    ('Massive Magic Box', 18, 2, 12),
    ('Delivery', -1, 3, 10) ;
