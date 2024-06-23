EXEC msdb.dbo.sp_add_alert 
      @name= 'DuplicateSalesOrder'
    , @message_id=50001
    , @enabled=1
    , @database_name= 'MagicChoc' ;

EXEC msdb.dbo.sp_add_notification 
      @alert_name= 'DuplicateSalesOrder'
    , @operator_name= 'Pete'
    , @notification_method = 1 ;
