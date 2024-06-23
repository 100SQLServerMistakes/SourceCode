EXEC sp_configure 
     'user options'
   , '16384' ;
GO

RECONFIGURE WITH OVERRIDE ;
GO
