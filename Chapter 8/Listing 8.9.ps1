Configuration InstallSql {
    param (
        $SqlInstanceName = 'MSSQLSERVER',
        $Edition
    )

    Import-DscResource -ModuleName SqlServerDsc

    if ($Edition -eq 'Developer') {
        $ProductKey = '22222-00000-00000-00000-00000'
    } elseif ($edition -eq 'Standard') {
        $ProductKey = '00000-00000-00000-00000-00000'
    } elseif ($edition -eq 'Enterprise') {
        $ProductKey = '00000-00000-00000-00000-00000'
    }
    
    node localhost {
          SqlSetup 'InstallInstance' {
               InstanceName        = $SqlInstanceName
               Features            = 'SQLENGINE'
               SourcePath          = 'C:\SQL Media'
               SQLSysAdminAccounts = @('Administrator')
               ProductKey          = $ProductKey
          }

          SqlConfiguration 'RemoteAccess' {
              InstanceName = $SqlInstanceName
              OptionName   = 'remote access'
              OptionValue  = 1

              DependsOn    = '[SqlSetup]InstallInstance'
          }

          SqlLogin 'AddSqlAdmin' {
              Ensure       = 'Present'
              Name         = 'Pete'
              InstanceName = $SqlInstanceName
              LoginType    = 'WindowsUser'

              DependsOn    = '[SqlSetup]InstallInstance'
          }   
     }
}
