<#
.SYNOPSIS
Restart the services that commonly hold the Claude Desktop package lock.

.PARAMETER PackagePrefix
Package folder prefix to match under C:\Program Files\WindowsApps.

.PARAMETER RestartExplorer
Restart explorer.exe after restarting the package services.

.EXAMPLE
Get-Help .\scripts\unlock-claude-package.ps1 -Detailed
#>
[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [string]$PackagePrefix = 'Claude_',
    [switch]$RestartExplorer
)

function Test-IsAdministrator {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($identity)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Get-ClaudePackagePath {
    $pattern = Join-Path 'C:\Program Files\WindowsApps' "$PackagePrefix*"
    $package = Get-ChildItem -Path $pattern -Directory -ErrorAction SilentlyContinue |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 1

    return $package.FullName
}

function Test-PathLocked {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    try {
        $item = Get-Item -LiteralPath $Path -ErrorAction Stop
        $temporaryName = '{0}.codex-lockcheck-{1}' -f $item.Name, ([guid]::NewGuid().ToString('N'))
        Rename-Item -LiteralPath $item.FullName -NewName $temporaryName -ErrorAction Stop
        Rename-Item -LiteralPath (Join-Path $item.Parent.FullName $temporaryName) -NewName $item.Name -ErrorAction Stop
        return $false
    }
    catch {
        return $true
    }
}

if (-not (Test-IsAdministrator)) {
    $argumentList = @(
        '-NoProfile'
        '-ExecutionPolicy', 'Bypass'
        '-File', ('"{0}"' -f $PSCommandPath)
        '-PackagePrefix', ('"{0}"' -f $PackagePrefix)
    )

    if ($RestartExplorer) {
        $argumentList += '-RestartExplorer'
    }

    Start-Process powershell.exe -Verb RunAs -ArgumentList $argumentList
    Write-Host 'Re-launched in an elevated PowerShell window.'
    exit 0
}

$packagePath = Get-ClaudePackagePath
if (-not $packagePath) {
    Write-Host "No Claude package folder matching '$PackagePrefix' was found under WindowsApps."
    exit 1
}

Write-Host "Claude package path: $packagePath"

$services = @('ClipSVC', 'AppXSvc')
foreach ($serviceName in $services) {
    $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue
    if (-not $service) {
        continue
    }

    if ($PSCmdlet.ShouldProcess($serviceName, 'Restart-Service')) {
        Restart-Service -Name $serviceName -Force -ErrorAction Stop
        Write-Host "Restarted $serviceName."
    }
}

if ($RestartExplorer) {
    if ($PSCmdlet.ShouldProcess('explorer.exe', 'Restart Explorer')) {
        Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 2
        Start-Process explorer.exe
        Write-Host 'Restarted explorer.exe.'
    }
}

Start-Sleep -Seconds 2

if (Test-PathLocked -Path $packagePath) {
    Write-Host 'The Claude package folder still appears to be locked.'
    exit 2
}

Write-Host 'The Claude package folder is no longer locked.'
