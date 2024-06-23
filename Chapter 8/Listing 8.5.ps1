$sqlAdminName = 'MagicChocAdmin'
$sqlAdminPassword = 'Passw0rd!'

$credentials = $(New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $sqlAdminName, $(ConvertTo-SecureString -String $sqlAdminPassword -AsPlainText -Force))

$serverParameters = @{
    ServerName = 'processautomationsql'
    Location = 'eastus2'
    SqlAdministratorCredentials = $credentials
    ResourceGroupName = 'MagicChocApps'
}


New-AzSqlServer @serverParameters


$databaseParameters = @{
    ResourceGroupName = 'MagicChocApps'
    ServerName = 'processautomationsql'
    DatabaseName = 'AutoPro'
    Edition = 'GeneralPurpose'
    ComputeModel = 'Serverless'
    ComputeGeneration = 'Gen5'
    MinimumCapacity = 2
    Vcore = 16
}

New-AzSqlDatabase @databaseParameters
