USE master ;
GO

CREATE SERVER AUDIT AdminActivityAudit
TO SECURITY_LOG WITH (
      ON_FAILURE = CONTINUE
) ;
