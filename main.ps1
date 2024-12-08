. C:\Root\PowerShellAppsettings\src\classes\ConfigurationBuilder.ps1
. C:\Root\PowerShellAppsettings\src\classes\Logger.ps1

$logger = [Logger]::new()
$logger.LogInfo("コメント", "", $PSCommandPath)
