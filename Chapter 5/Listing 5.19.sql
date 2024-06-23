DECLARE @RowCounter BIGINT ;

SET @RowCounter = 1 ;

WHILE @RowCounter > 0
BEGIN
    DELETE TOP(250000)
    FROM dbo.VeryLargeTable ;
  
    SET @RowCounter = (SELECT COUNT(*) FROM dbo.VeryLargeTable) ;
    PRINT @RowCounter ;
END
