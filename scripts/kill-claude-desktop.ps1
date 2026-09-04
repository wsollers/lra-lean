<#
.SYNOPSIS
Stop Claude Desktop processes that may be holding Windows package locks.

.PARAMETER RestartExplorer
Restart explorer.exe after stopping Claude-related processes.

.EXAMPLE
Get-Help .\scripts\kill-claude-desktop.ps1 -Detailed
#>
[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [switch]$RestartExplorer
)

$namePatterns = @(
    'Claude',
    'claude',
    'Claude Helper',
    'claude Helper',
    'Anthropic',
    'anthropic',
    'Update'
)

$excludedPatterns = @('Codex', 'codex', 'OpenAI', 'openai')
$allowedWindowTitles = @(
    'Claude',
    'Claude Desktop'
)

$processes = Get-Process -ErrorAction SilentlyContinue |
    Where-Object {
        $process = $_
        $hasClaudePath = $process.Path -and $process.Path -like '*Claude*'
        $hasClaudeName = $process.ProcessName -in $namePatterns
        $hasAllowedWindowTitle = $allowedWindowTitles -contains $process.MainWindowTitle

        (
            $hasClaudeName -or
            $hasClaudePath -or
            $hasAllowedWindowTitle
        ) -and
        -not ($excludedPatterns | Where-Object {
            $pattern = $_
            $process.ProcessName -like "*$pattern*" -or
            $process.MainWindowTitle -like "*$pattern*" -or
            ($process.Path -and $process.Path -like "*$pattern*")
        })
    } |
    Sort-Object Id -Unique

$stoppedAny = $false

foreach ($process in $processes) {
    $target = "PID $($process.Id) ($($process.ProcessName))"

    if ($PSCmdlet.ShouldProcess($target, 'taskkill /F /T')) {
        $null = & taskkill.exe /F /T /PID $process.Id 2>$null
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Stopped $target."
            $stoppedAny = $true
            continue
        }
    }

    if ($PSCmdlet.ShouldProcess($target, 'Stop-Process')) {
        Stop-Process -Id $process.Id -Force -ErrorAction SilentlyContinue
        if (-not (Get-Process -Id $process.Id -ErrorAction SilentlyContinue)) {
            Write-Host "Stopped $target."
            $stoppedAny = $true
        }
    }
}

if (-not $stoppedAny) {
    Write-Host 'No Claude Desktop processes found, or Windows denied access to the locking process.'
}

if ($RestartExplorer) {
    $explorer = Get-Process -Name explorer -ErrorAction SilentlyContinue
    if ($explorer -and $PSCmdlet.ShouldProcess('explorer.exe', 'Restart Explorer to release package file locks')) {
        Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 2
        Start-Process explorer.exe
        Write-Host 'Restarted explorer.exe.'
    }
}
