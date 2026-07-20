# ============================================================
# build.ps1 — lra-lean Windows Build and Maintenance Script
# ============================================================
#
# Usage:
#   .\build.ps1                    # Show help
#   .\build.ps1 build              # Build VolumeII
#   .\build.ps1 build-all          # Build all volumes
#   .\build.ps1 check              # Build + proof-readiness + all checks
#   .\build.ps1 clean              # Remove build artifacts
#   .\build.ps1 shell              # Open shell in Docker container
#   .\build.ps1 docker-build       # Build the Docker image
#   .\build.ps1 docker-docs-build  # Build the Docker documentation image
#   .\build.ps1 blueprint-inputs   # Generate number-system Blueprint inputs
#   .\build.ps1 blueprint          # Compile Blueprint PDF and web output
#   .\build.ps1 docs               # Build site and attach Blueprint output
#   .\build.ps1 lint               # Check doc-comment coverage
#   .\build.ps1 stats              # Print proof counts per file
#   .\build.ps1 install-hooks      # Install git pre-commit hook
#   .\build.ps1 ci                 # Full CI pipeline
#
# Requirements:
#   Docker Desktop for Windows (recommended — reproducible builds)
#   OR elan + Lean 4 installed natively
#
# To use native Lean instead of Docker:
#   .\build.ps1 build -Native
# ============================================================

param(
    [Parameter(Position = 0)]
    [ValidateSet(
        'build', 'build-all', 'check', 'clean', 'shell',
        'docker-build', 'docker-docs-build', 'docker-pull',
        'blueprint-inputs', 'blueprint', 'docs', 'lint', 'stats',
        'install-hooks', 'ci', 'help', ''
    )]
    [string]$Command = '',

    [switch]$Native
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Write-Ok   { param($msg) Write-Host "  $([char]0x2713) $msg" -ForegroundColor Green }
function Write-Fail { param($msg) Write-Host "  $([char]0x2717) $msg" -ForegroundColor Red }
function Write-Warn { param($msg) Write-Host "  ! $msg"               -ForegroundColor Yellow }
function Write-Step { param($msg) Write-Host "`n-- $msg" -ForegroundColor Cyan }

$IMAGE     = 'lra-lean'
$DOC_IMAGE = 'lra-lean-docs'
$SrcDir    = $PSScriptRoot
$Toolchain = ''

$ToolchainFile = Join-Path $SrcDir 'lean-toolchain'
if (Test-Path $ToolchainFile) {
    $Toolchain = (Get-Content $ToolchainFile -Raw).Trim()
}

function Get-RunPrefix {
    if ($Native) { return @() }
    return @('docker', 'run', '--rm', '-v', "${SrcDir}:/workspace", '-w', '/workspace', $IMAGE)
}

function Invoke-Run {
    param([string[]]$Cmd)
    $prefix = Get-RunPrefix
    $full   = $prefix + $Cmd
    & $full[0] $full[1..($full.Length - 1)]
    if ($LASTEXITCODE -ne 0) { throw "Command failed: $($full -join ' ')" }
}

function Invoke-DocsRun {
    param([string[]]$Cmd)
    if ($Native) {
        $full = $Cmd
    } else {
        $full = @('docker', 'run', '--rm', '-v', "${SrcDir}:/workspace", '-w', '/workspace', $DOC_IMAGE) + $Cmd
    }
    & $full[0] $full[1..($full.Length - 1)]
    if ($LASTEXITCODE -ne 0) { throw "Command failed: $($full -join ' ')" }
}

function Invoke-ProofReadiness {
    $script = Join-Path $SrcDir 'scripts\check-proof-readiness.py'
    $python = Get-Command python -ErrorAction SilentlyContinue
    if (-not $python) {
        $python = Get-Command py -ErrorAction SilentlyContinue
    }
    if (-not $python) {
        throw "Python is required to run scripts/check-proof-readiness.py"
    }
    & $python.Source $script
    if ($LASTEXITCODE -ne 0) { throw "Proof-readiness check failed" }
}

function Invoke-Build {
    Write-Step "Building LRAVolumeII (Lean $Toolchain)"
    Invoke-Run @('lake', 'build', 'LRAVolumeII')
    Write-Ok "VolumeII build successful"
}

function Invoke-BuildAll {
    Write-Step "Building all volumes (Lean $Toolchain)"
    Invoke-Run @('lake', 'build')
    Write-Ok "Full build successful"
}

function Invoke-Check {
    Invoke-Build
    Write-Step "Checking proof-readiness"
    $vol2 = Join-Path $SrcDir 'LRA\VolumeII'
    Invoke-ProofReadiness
    Write-Ok "Proof-readiness check passed"
    Write-Step "Checking for Mathlib imports in VolumeII"
    $matlibFiles = Get-ChildItem -Path $vol2 -Filter '*.lean' -Recurse |
        Select-String -Pattern '^import Mathlib' -List | Select-Object -ExpandProperty Path
    if ($matlibFiles) {
        Write-Fail "Mathlib import found in VolumeII:"
        $matlibFiles | ForEach-Object { Write-Host "    $_" -ForegroundColor Red }
        throw "VolumeII must be bare Lean 4. No Mathlib."
    }
    Write-Ok "No Mathlib imports in VolumeII"
    Write-Step "Checking doc-comment coverage"
    Invoke-Lint -WarnOnly
    Write-Ok "All checks passed"
}

function Invoke-Clean {
    Write-Step "Cleaning build artifacts"
    Invoke-Run @('lake', 'clean')
    Write-Ok "Build artifacts removed"
}

function Invoke-Shell {
    Write-Step "Opening shell in Docker container"
    docker run --rm -it -v "${SrcDir}:/workspace" -w /workspace $IMAGE bash
}

function Invoke-DockerBuild {
    Write-Step "Building Docker image '$IMAGE'"
    $dockerfile = Join-Path $SrcDir 'Dockerfile'
    if (-not (Test-Path $dockerfile)) { throw "Dockerfile not found at: $dockerfile" }
    docker build -t $IMAGE $SrcDir
    if ($LASTEXITCODE -ne 0) { throw "Docker build failed" }
    Write-Ok "Docker image '$IMAGE' built (Lean $Toolchain)"
}

function Invoke-DockerDocsBuild {
    Write-Step "Building Docker documentation image '$DOC_IMAGE'"
    $dockerfile = Join-Path $SrcDir 'Dockerfile'
    if (-not (Test-Path $dockerfile)) { throw "Dockerfile not found at: $dockerfile" }
    docker build --target documentation-build -t $DOC_IMAGE $SrcDir
    if ($LASTEXITCODE -ne 0) { throw "Docker documentation build failed" }
    Write-Ok "Docker image '$DOC_IMAGE' built"
}

function Invoke-BlueprintInputs {
    Write-Step "Generating number-system Blueprint inputs"
    Invoke-DocsRun @('python3', 'scripts/build-number-systems-declaration-manifest.py')
    Invoke-DocsRun @('python3', 'scripts/build-number-systems-blueprint.py')
    Write-Ok "Number-system Blueprint inputs generated"
}

function Invoke-Blueprint {
    Invoke-BlueprintInputs
    Write-Step "Compiling Blueprint PDF and web output"
    Invoke-DocsRun @('leanblueprint', 'pdf')
    Invoke-DocsRun @('leanblueprint', 'web')
    Invoke-DocsRun @('python3', 'scripts/check-blueprint-declarations.py')
    Write-Ok "Blueprint compiled"
}

function Invoke-Docs {
    Invoke-Blueprint
    Write-Step "Generating repository documentation site"
    $python = Get-Command python -ErrorAction SilentlyContinue
    if (-not $python) {
        $python = Get-Command py -ErrorAction SilentlyContinue
    }
    if (-not $python) {
        throw "Python is required to run scripts/build-repository-site.py"
    }
    & $python.Source (Join-Path $SrcDir 'scripts\build-repository-site.py')
    if ($LASTEXITCODE -ne 0) { throw "Repository site generation failed" }
    $siteBlueprint = Join-Path $SrcDir 'site\blueprint'
    New-Item -ItemType Directory -Force -Path $siteBlueprint | Out-Null
    Copy-Item -Recurse -Force -Path (Join-Path $SrcDir 'blueprint\web\*') -Destination $siteBlueprint
    Copy-Item -Force -Path (Join-Path $SrcDir 'blueprint\print\print.pdf') -Destination (Join-Path $SrcDir 'site\number-systems-blueprint.pdf')
    Write-Ok "Documentation site generated in site/"
}

function Invoke-Lint {
    param([switch]$WarnOnly)
    Write-Step "Checking doc-comment display name coverage"
    $vol2 = Join-Path $SrcDir 'LRA\VolumeII'
    $leanFiles = Get-ChildItem -Path $vol2 -Filter '*.lean' -Recurse
    $totalMissing = 0
    foreach ($file in $leanFiles) {
        $lines = Get-Content $file.FullName
        $missing = @()
        $n = $lines.Count
        for ($i = 0; $i -lt $n; $i++) {
            $raw  = $lines[$i]
            $line = $raw.Trim()
            if ($raw -match '^\s') { continue }
            if ($line -match '^(theorem|lemma|corollary|(?:noncomputable\s+)?def)\s+(\w+)') {
                $kind = $Matches[1] -replace 'noncomputable\s+', ''
                $name = $Matches[2]
                $prevBlock = $lines[[Math]::Max(0, $i-3)..$i] -join ' '
                if ($prevBlock -match '\bprivate\b') { continue }
                $found = $false
                $start = [Math]::Max(0, $i - 20)
                for ($k = $start; $k -lt $i; $k++) {
                    if ($lines[$k] -match '\*\*\[') { $found = $true; break }
                }
                if (-not $found) {
                    $missing += [PSCustomObject]@{ Line = $i + 1; Kind = $kind; Name = $name }
                }
            }
        }
        if ($missing.Count -gt 0) {
            $totalMissing += $missing.Count
            foreach ($m in $missing) {
                Write-Warn "$($file.FullName):$($m.Line) — $($m.Kind) '$($m.Name)' missing display name"
            }
        }
    }
    if ($totalMissing -eq 0) {
        Write-Ok "All items have display name doc-comments"
    } else {
        $msg = "$totalMissing item(s) missing display name doc-comments"
        if ($WarnOnly) {
            Write-Warn "$msg (warning — not blocking)"
            Write-Warn "See DESIGN.md §17 for the doc-comment template"
        } else {
            Write-Fail $msg; throw $msg
        }
    }
}

function Invoke-Stats {
    Write-Step "Proof statistics"
    $vol2 = Join-Path $SrcDir 'LRA\VolumeII'
    Get-ChildItem -Path $vol2 -Filter '*.lean' -Recurse | Sort-Object FullName |
    ForEach-Object {
        $content = Get-Content $_.FullName
        $thms  = ($content | Where-Object { $_ -match '^(theorem|lemma|corollary)\s' }).Count
        $defs  = ($content | Where-Object { $_ -match '^(noncomputable\s+)?def\s' }).Count
        $sorry = ($content | Where-Object { $_ -match '\bsorry\b' }).Count
        $rel   = $_.FullName.Replace($SrcDir, '').TrimStart('\')
        $sorryTxt = if ($sorry -gt 0) { " [$sorry sorry]" } else { '' }
        Write-Host ("  {0,-60} {1,3} thm  {2,3} def{3}" -f $rel, $thms, $defs, $sorryTxt)
    }
}

function Invoke-InstallHooks {
    Write-Step "Installing git hooks"
    $hooksDir  = Join-Path $SrcDir '.git\hooks'
    $scriptSrc = Join-Path $SrcDir 'scripts\pre-commit'
    if (-not (Test-Path $hooksDir)) { throw ".git\hooks not found. Run from the repo root." }
    if (-not (Test-Path $scriptSrc)) { throw "scripts\pre-commit not found." }
    $dest = Join-Path $hooksDir 'pre-commit'
    Copy-Item $scriptSrc $dest -Force
    Write-Ok "pre-commit hook installed at: $dest"
}

function Invoke-CI { Invoke-DockerBuild; Invoke-Check; Write-Ok "CI pipeline complete" }

function Show-Help {
    Write-Host ""
    Write-Host "lra-lean build script (Windows PowerShell)" -ForegroundColor Cyan
    Write-Host "Lean toolchain: $Toolchain" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Usage:" -ForegroundColor White
    Write-Host "  .\build.ps1 <command> [-Native]"
    Write-Host ""
    Write-Host "Commands:" -ForegroundColor White
    @(
        @{ Cmd = 'build';         Desc = 'Build VolumeII' },
        @{ Cmd = 'build-all';     Desc = 'Build all volumes' },
        @{ Cmd = 'check';         Desc = 'Build + proof-readiness, no Mathlib, lint' },
        @{ Cmd = 'clean';         Desc = 'Remove lake build artifacts' },
        @{ Cmd = 'shell';         Desc = 'Open interactive shell in Docker container' },
        @{ Cmd = 'docker-build';  Desc = 'Build the Docker image' },
        @{ Cmd = 'docker-docs-build'; Desc = 'Build the Docker documentation image' },
        @{ Cmd = 'blueprint-inputs'; Desc = 'Generate number-system Blueprint inputs' },
        @{ Cmd = 'blueprint';      Desc = 'Compile Blueprint PDF and web output' },
        @{ Cmd = 'docs';           Desc = 'Build site and attach Blueprint output' },
        @{ Cmd = 'lint';          Desc = 'Check doc-comment display name coverage' },
        @{ Cmd = 'stats';         Desc = 'Print theorem/def counts per file' },
        @{ Cmd = 'install-hooks'; Desc = 'Install git pre-commit hook' },
        @{ Cmd = 'ci';            Desc = 'Full CI: docker-build + check' }
    ) | ForEach-Object {
        Write-Host ("  {0,-20} {1}" -f $_.Cmd, $_.Desc)
    }
    Write-Host ""
    Write-Host "Flags: -Native  Use native Lean instead of Docker" -ForegroundColor White
}

try {
    switch ($Command) {
        'build'         { Invoke-Build }
        'build-all'     { Invoke-BuildAll }
        'check'         { Invoke-Check }
        'clean'         { Invoke-Clean }
        'shell'         { Invoke-Shell }
        'docker-build'  { Invoke-DockerBuild }
        'docker-docs-build' { Invoke-DockerDocsBuild }
        'blueprint-inputs' { Invoke-BlueprintInputs }
        'blueprint'     { Invoke-Blueprint }
        'docs'          { Invoke-Docs }
        'lint'          { Invoke-Lint }
        'stats'         { Invoke-Stats }
        'install-hooks' { Invoke-InstallHooks }
        'ci'            { Invoke-CI }
        default         { Show-Help }
    }
} catch {
    Write-Host ""
    Write-Fail "FAILED: $_"
    exit 1
}
