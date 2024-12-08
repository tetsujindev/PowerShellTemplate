class ConfigurationBuilder {
    [PSCustomObject] Build() {
        $appsettingsFilePath = Convert-Path "$PSScriptRoot\..\appsettings.json"
        $environmentName = $env:POWERSHELL_ENVIRONMENT

        $appsettingsEnvironmentFilePath = $appsettingsFilePath -split '\.', - 2 -join ".$environmentName."

        $configuration = [PSCustomObject]@{}
        Get-Content -Path $appsettingsFilePath | ConvertFrom-Json | ForEach-Object { $_.psobject.properties } | ForEach-Object { Add-Member -MemberType NoteProperty -Name $_.Name -Value $_.Value -InputObject $configuration }
        Get-Content -Path $appsettingsEnvironmentFilePath | ConvertFrom-Json | ForEach-Object { $_.psobject.properties } | ForEach-Object { Add-Member -MemberType NoteProperty -Name $_.Name -Value $_.Value -InputObject $configuration }

        return $configuration
    }
}
