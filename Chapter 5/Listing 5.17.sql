CREATE TABLE dbo.VeryLargeTable (
    ID         BIGINT            IDENTITY    PRIMARY KEY,
    TextCol    NVARCHAR(4000) 
) ;

DECLARE @LoopCounter INT = 0 ;

WHILE @LoopCounter < 2000
BEGIN
    INSERT INTO dbo.VeryLargeTable (TextCol)
    SELECT 'Yet another row in a very, very, very large table. In fact, this table is going to take a very long time to craete, and you will not be able to delete all rows in one go!'
    FROM sys.columns c1
    CROSS APPLY sys.columns c2 ;

    SET @LoopCounter = @LoopCounter + 1 ;
END
