param(
    [int]$DelaySeconds = 3
)

$appProcesses = Get-Process -ErrorAction SilentlyContinue | Where-Object {
    $_.Path -like 'C:\Program Files\WindowsApps\OpenAI.Codex*\app\ChatGPT.exe' -or
    $_.Path -like 'C:\Program Files\WindowsApps\OpenAI.Codex*\app\resources\codex.exe'
}

$chatGptProcess = $appProcesses | Where-Object {
    $_.Path -like 'C:\Program Files\WindowsApps\OpenAI.Codex*\app\ChatGPT.exe'
} | Select-Object -First 1

if (-not $chatGptProcess) {
    throw 'Could not find a running OpenAI.Codex ChatGPT.exe process to restart.'
}

$appPath = $chatGptProcess.Path

Start-Sleep -Seconds $DelaySeconds

$appProcesses | ForEach-Object {
    try {
        Stop-Process -Id $_.Id -Force -ErrorAction Stop
    } catch {
    }
}

Start-Sleep -Seconds 2

Start-Process -FilePath $appPath
