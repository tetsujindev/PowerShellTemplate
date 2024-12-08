class Logger {
    [string] LogInfo([string]$comment, [string]$systemMessage, [string]$filePath) {
        return $this.LogToFile("INFO", $comment, $systemMessage, $filePath)
    }

    [string] LogWarning([string]$comment, [string]$systemMessage, [string]$filePath) {
        return $this.LogToFile("WARNING", $comment, $systemMessage, $filePath)
    }

    [string] LogError([string]$comment, [string]$systemMessage, [string]$filePath) {
        return $this.LogToFile("ERROR", $comment, $systemMessage, $filePath)
    }

    hidden [string] LogToFile([string]$level, [string]$comment, [string]$systemMessage, [string]$filePath) {
        $yyyyMMdd = Get-Date -Format "yyyyMMdd"
        $logFilePath = "$PSScriptRoot\..\..\data\log_$yyyyMMdd.log"

        if ((Test-Path -Path $logFilePath) -eq $false) {
            New-Item -ItemType File -Path $logFilePath -Force
            Write-Output '"DateTime", "Level", "Comment", "SystemMessage", "File"' | Out-File -Encoding utf8 -FilePath $logFilePath
        }

        $now = Get-Date -Format "yyyy/MM/dd HH:mm:ss"
        $log = "`"$now`", `"$level`", `"$comment`", `"$systemMessage`", `"$filePath`""

        Write-Output $log | Out-File -Encoding utf8 -FilePath $logFilePath -Append
        return $log
    }
}
