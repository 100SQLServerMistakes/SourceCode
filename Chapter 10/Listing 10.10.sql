SELECT 
      name
    , CASE
          WHEN value = 1 THEN 'Enabled'
          ELSE 'Disabled'
      END as Enabled
FROM sys.database_scoped_configurations
WHERE name LIKE '%feedback%' ;

