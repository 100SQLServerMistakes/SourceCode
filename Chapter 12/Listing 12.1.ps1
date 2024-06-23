$Path = 'D:\Backups\'
$Days = 3
$CutoffDate = (Get-Date).AddDays(-$Days)

Get-ChildItem -Path $Path -Recurse | Where-Object {$_.CreationTime -lt $CutoffDate} | Remove-Item –Force -Recurse -Verbose -Confirm:$false
