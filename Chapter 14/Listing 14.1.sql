CREATE SERVER ROLE AvailabilityGroupsFailover ;
GO

ALTER SERVER ROLE AvailabilityGroupsFailover ADD MEMBER [NT AUTHORITY\SYSTEM] ;

GRANT ALTER ANY AVAILABILITY GROUP TO AvailabilityGroupsFailover ;

GRANT CONNECT SQL TO AvailabilityGroupsFailover ;

GRANT CREATE AVAILABILITY GROUP TO AvailabilityGroupsFailover ;

GRANT VIEW SERVER STATE TO AvailabilityGroupsFailover ;
