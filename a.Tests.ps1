BeforeAll {
    . C:\Root\PowerShellAppsettings\src\classes\ConfigurationBuilder.ps1
}

Describe "a" {
    It "Returns expected output" {
        $result = [ConfigurationBuilder]::new().Build()
        $expected = [PSCustomObject]@{
            Title          = "hatahata"
            Revision       = 10
            LoggingEnabled = $true
        }
        $result.Count | Should -Be $expected.Count
        0..($result.Count - 1) | ForEach-Object { $result[$_].PSObject.Properties.Name | Should -Be $expected[$_].PSObject.Properties.Name }
        0..($result.Count - 1) | ForEach-Object { $result[$_].PSObject.Properties.Value | Should -Be $expected[$_].PSObject.Properties.Value }
    }
}
