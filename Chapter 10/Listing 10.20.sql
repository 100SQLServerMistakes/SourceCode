EXEC sp_estimate_data_compression_savings 
    @schema_name = 'dbo', 
    @object_name = 'ImpressionsArchive', 
    @index_id = 1, 
    @partition_number = NULL, 
    @data_compression = 'none' ;
