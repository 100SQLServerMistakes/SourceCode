ALTER DATABASE MarketingArchive 
    MODIFY FILEGROUP [PRIMARY] AUTOGROW_ALL_FILES ;

ALTER DATABASE MarketingArchive
    SET MIXED_PAGE_ALLOCATION ON ;
