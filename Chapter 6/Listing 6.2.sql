CREATE TABLE staging.ImpressionLoadFailures (
    FlatFileSourceErrorOutputColumn    VARCHAR(MAX)    NOT NULL,
    ErrorCode                          VARCHAR(MAX)    NOT NULL,
    ErrorColumn                        VARCHAR(MAX)    NOT NULL
) ;
