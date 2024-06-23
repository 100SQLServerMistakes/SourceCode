CREATE DATABASE EnterpriseDatabase ;
GO

USE EnterpriseDatabase ;
GO

CREATE PARTITION FUNCTION PartFunc (INT)
    AS RANGE LEFT FOR VALUES (100, 200, 300) ;

CREATE PARTITION SCHEME PartScheme
    AS PARTITION PartFunc
    ALL TO ('PRIMARY') ;


CREATE TABLE VeryLargeTable (
    KeyColumn      INT    PRIMARY KEY    IDENTITY,
    OtherColumn    VARCHAR(50)
) ON PartScheme(KeyColumn) ;
