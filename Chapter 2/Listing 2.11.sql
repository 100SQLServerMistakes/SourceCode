SELECT 
      name
    , SCHEMA_NAME(schema_id) AS SchemaName
    , type_desc
    , is_ms_shipped
FROM sys.all_objects
WHERE name = 'sp_adduser' ;
