[CmdletBinding()]
param(
    [string]$PackagePrefix = 'Claude_'
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

function Get-HandleExePath {
    $command = Get-Command handle.exe -ErrorAction SilentlyContinue
    if ($command) {
        return $command.Source
    }

    $candidate = Get-ChildItem 'C:\Users\wsoll\AppData\Local\Microsoft\WinGet\Packages' -Filter handle.exe -Recurse -ErrorAction SilentlyContinue |
        Select-Object -First 1
    return $candidate.FullName
}

if (-not (Test-IsAdministrator)) {
    $argumentList = @(
        '-NoProfile'
        '-ExecutionPolicy', 'Bypass'
        '-File', ('"{0}"' -f $PSCommandPath)
        '-PackagePrefix', ('"{0}"' -f $PackagePrefix)
    )

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

$handleExe = Get-HandleExePath
if (-not $handleExe) {
    Write-Host 'handle.exe was not found on this machine.'
    exit 2
}

Write-Host "Using handle.exe: $handleExe"
Write-Host ''
Write-Host 'Matches for the exact package path:'
& $handleExe -accepteula -nobanner $packagePath

Write-Host ''
Write-Host 'Matches for the package name fragment:'
& $handleExe -accepteula -nobanner (Split-Path -Leaf $packagePath)
