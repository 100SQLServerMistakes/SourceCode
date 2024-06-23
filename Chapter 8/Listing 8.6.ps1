[CmdletBinding()]
param(
[string] $SQLServiceAccount,
[string] $SQLServiceAccountPassword,
[string] $AgentServiceAccount,
[string] $AgentServiceAccountPassword,
[string] $SaName,
[string] $SaPassword,
[string] $edition,
[string] $InstanceName = 'MSSQLSERVER'
)

if ($edition -eq 'Developer') {
    $sqlPid = '22222-00000-00000-00000-00000'
} elseif ($edition -eq 'Standard') {
    $sqlPid = '00000-00000-00000-00000-00000'
} elseif ($edition -eq 'Enterprise') {
    $sqlPid = '00000-00000-00000-00000-00000'
}


If(-not(Get-Module NuGet -ErrorAction silentlycontinue)){
    Install-Module NuGet -Confirm:$False -Force 
}    #A

If(-not(Get-Module SQLServer -ErrorAction silentlycontinue)){
    Install-Module SQLServer -Confirm:$False -Force -AllowClobber
}    #B


./setup.exe /ACTION=Install /FEATURES=SQLENGINE /INSTANCENAME=$InstanceName /SQLSVCACCOUNT=$SQLServiceAccount /SQLSVCPASSWORD=$SQLServiceAccountPassword /AGTSVCACCOUNT=$AgentServiceAccount /AGTSVCPASSWORD=$AgentServiceAccountPassword /PID=$sqlPid /IACCEPTSQLSERVERLICENSETERMS /Q /SECURITYMODE=SQL /SAPWD=$SaPassword /SQLSYSADMINACCOUNTS=Administrator    #C    

if ($InstanceName -ne 'MSSQLSERVER') {    #D
    $ServiceName = 'MSSQL$' + $InstanceName
    $ServerInstance = 'localhost\' + $InstanceName
} else {
    $ServiceName = $InstanceName
    $ServerInstance = 'localhost'
}    

$ServiceStatus = Get-Service -servicename $ServiceName    

if ($ServiceStatus.Status -eq 'Running') {
    $output = "The service for SQL Server instance: {0} is Running" -f $InstanceName
    Write-Output $output
} else {
    $output = "The service for SQL Server instance: {0} is NOT Running. Script terminating" -f $InstanceName
    Write-Output $output
    exit
}

$ServerName = Invoke-Sqlcmd -ServerInstance $ServerInstance -query 'SELECT @@SERVERNAME ;' -Username 'sa' -Password $SaPassword

if ($ServerName -ne $null) {
    $output = "The SQL Server instance: {0} is accessible" -f $InstanceName
    Write-Output $output
} else {
    $output = "The SQL Server instance: {0} is NOT accessible. Script terminating" -f $InstanceName
    Write-Output $output
    exit
}    #E

Invoke-Sqlcmd -ServerInstance $ServerInstance -Query "EXEC sp_configure 'show advanced options', 1 ; RECONFIGURE ; EXEC sp_configure 'remote access', 0 ; RECONFIGURE ; EXEC sp_configure 'show advanced options', 0 ; RECONFIGURE ;" -Username 'sa' -Password $SaPassword    #F

$Query = "ALTER LOGIN sa WITH NAME = {0}" -f $SaName

Invoke-Sqlcmd -ServerInstance $ServerInstance -Query $Query -Username 'sa' -Password $SaPassword    #G
