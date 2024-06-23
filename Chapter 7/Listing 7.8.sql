EXEC sp_addmessage 
      @msgnum = 50001
    , @severity = 16
    , @msgtext = 'A duplicate sales order has been entered.' ;
