# ============================================================
# build.ps1 — lra-lean Windows Build and Maintenance Script
# ============================================================
#
# Usage:
#   .\build.ps1                    # Show help
#   .\build.ps1 build              # Build VolumeII
#   .\build.ps1 build-all          # Build all volumes
#   .\build.ps1 check              # Build + all checks
#   .\build.ps1 clean              # Remove build artifacts
#   .\build.ps1 shell              # Open shell in Docker container
#   .\build.ps1 docker-build       # Build the Docker image
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
        'docker-build', 'docker-pull', 'lint', 'stats',
        'install-hooks', 'ci', 'help', ''
    )]
    [string]$Command = '',

    [switch]$Native   # Use native Lean instead of Docker
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# ── Colour helpers ────────────────────────────────────────────

function Write-Ok   { param($msg) Write-Host "  $([char]0x2713) $msg" -ForegroundColor Green }
function Write-Fail { param($msg) Write-Host "  $([char]0x2717) $msg" -ForegroundColor Red }
function Write-Warn { param($msg) Write-Host "  ! $msg"               -ForegroundColor Yellow }
function Write-Step { param($msg) Write-Host "`n-- $msg" -ForegroundColor Cyan }

# ── Configuration ─────────────────────────────────────────────

$IMAGE     = 'lra-lean'
$SrcDir    = $PSScriptRoot   # directory containing this script
$Toolchain = ''

$ToolchainFile = Join-Path $SrcDir 'lean-toolchain'
if (Test-Path $ToolchainFile) {
    $Toolchain = (Get-Content $ToolchainFile -Raw).Trim()
}

# ── Docker / native switch ────────────────────────────────────

function Get-RunPrefix {
    if ($Native) {
        return @()   # empty — run commands directly
    }
    # Check Docker is available and image exists
    $dockerOk = $false
    try {
        $null = docker image inspect $IMAGE 2>$null
        $dockerOk = $LASTEXITCODE -eq 0
    } catch { }

    if (-not $dockerOk) {
        Write-Warn "Docker image '$IMAGE' not found."
        Write-Warn "Run '.\build.ps1 docker-build' first, or use -Native flag."
        exit 1
    }
    return @('docker', 'run', '--rm',
             '-v', "${SrcDir}:/workspace",
             '-w', '/workspace',
             $IMAGE)
}

function Invoke-Run {
    param([string[]]$Cmd)
    $prefix = Get-RunPrefix
    $full   = $prefix + $Cmd
    & $full[0] $full[1..($full.Length - 1)]
    if ($LASTEXITCODE -ne 0) {
        throw "Command failed: $($full -join ' ')"
    }
}

# ── Targets ───────────────────────────────────────────────────

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

    Write-Step "Checking for 'sorry' in VolumeII"
    $vol2 = Join-Path $SrcDir 'LRA\VolumeII'
    $sorryFiles = Get-ChildItem -Path $vol2 -Filter '*.lean' -Recurse |
        Select-String -Pattern '\bsorry\b' -List |
        Select-Object -ExpandProperty Path

    if ($sorryFiles) {
        Write-Fail "sorry found in:"
        $sorryFiles | ForEach-Object { Write-Host "    $_" -ForegroundColor Red }
        throw "Remove 'sorry' from VolumeII before committing."
    }
    Write-Ok "No sorry in VolumeII"

    Write-Step "Checking for Mathlib imports in VolumeII"
    $matlibFiles = Get-ChildItem -Path $vol2 -Filter '*.lean' -Recurse |
        Select-String -Pattern '^import Mathlib' -List |
        Select-Object -ExpandProperty Path

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
    $srcMount = "${SrcDir}:/workspace"
    docker run --rm -it -v $srcMount -w /workspace $IMAGE bash
}

function Invoke-DockerBuild {
    Write-Step "Building Docker image '$IMAGE'"
    $dockerfile = Join-Path $SrcDir 'Dockerfile'
    if (-not (Test-Path $dockerfile)) {
        throw "Dockerfile not found at: $dockerfile"
    }
    docker build -t $IMAGE $SrcDir
    if ($LASTEXITCODE -ne 0) { throw "Docker build failed" }
    Write-Ok "Docker image '$IMAGE' built (Lean $Toolchain)"
}

function Invoke-Lint {
    param([switch]$WarnOnly)

    Write-Step "Checking doc-comment display name coverage"

    $vol2    = Join-Path $SrcDir 'LRA\VolumeII'
    $leanFiles = Get-ChildItem -Path $vol2 -Filter '*.lean' -Recurse
    $totalMissing = 0

    foreach ($file in $leanFiles) {
        $lines   = Get-Content $file.FullName
        $missing = @()
        $n       = $lines.Count

        for ($i = 0; $i -lt $n; $i++) {
            $raw  = $lines[$i]
            $line = $raw.Trim()

            # Skip indented lines
            if ($raw -match '^\s') { continue }

            # Match top-level declarations
            if ($line -match '^(theorem|lemma|corollary|(?:noncomputable\s+)?def)\s+(\w+)') {
                $kind = $Matches[1] -replace 'noncomputable\s+', ''
                $name = $Matches[2]

                # Skip private items
                $prevBlock = $lines[[Math]::Max(0, $i-3)..$i] -join ' '
                if ($prevBlock -match '\bprivate\b') { continue }

                # Look back up to 20 lines for **[
                $found = $false
                $start = [Math]::Max(0, $i - 20)
                for ($k = $start; $k -lt $i; $k++) {
                    if ($lines[$k] -match '\*\*\[') {
                        $found = $true
                        break
                    }
                }

                if (-not $found) {
                    $missing += [PSCustomObject]@{
                        Line = $i + 1
                        Kind = $kind
                        Name = $name
                    }
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
            Write-Fail $msg
            throw $msg
        }
    }
}

function Invoke-Stats {
    Write-Step "Proof statistics"
    $vol2 = Join-Path $SrcDir 'LRA\VolumeII'
    Get-ChildItem -Path $vol2 -Filter '*.lean' -Recurse | Sort-Object FullName |
    ForEach-Object {
        $content = Get-Content $_.FullName
        $thms    = ($content | Where-Object { $_ -match '^(theorem|lemma|corollary)\s' }).Count
        $defs    = ($content | Where-Object { $_ -match '^(noncomputable\s+)?def\s' }).Count
        $sorry   = ($content | Where-Object { $_ -match '\bsorry\b' }).Count
        $rel     = $_.FullName.Replace($SrcDir, '').TrimStart('\')
        $sorryTxt = if ($sorry -gt 0) { " [$sorry sorry]" } else { '' }
        Write-Host ("  {0,-60} {1,3} thm  {2,3} def{3}" -f $rel, $thms, $defs, $sorryTxt)
    }
}

function Invoke-InstallHooks {
    Write-Step "Installing git hooks"
    $hooksDir  = Join-Path $SrcDir '.git\hooks'
    $scriptSrc = Join-Path $SrcDir 'scripts\pre-commit'

    if (-not (Test-Path $hooksDir)) {
        throw ".git\hooks not found. Run from the repo root."
    }

    if (-not (Test-Path $scriptSrc)) {
        throw "scripts\pre-commit not found."
    }

    # On Windows, git hooks are shell scripts run by Git's bundled bash.
    # Copy the script as-is — Git for Windows provides bash.
    $dest = Join-Path $hooksDir 'pre-commit'
    Copy-Item $scriptSrc $dest -Force
    Write-Ok "pre-commit hook installed at: $dest"
    Write-Host ""
    Write-Host "  The hook runs on every 'git commit'." -ForegroundColor Gray
    Write-Host "  To skip: git commit --no-verify" -ForegroundColor Gray
    Write-Host "  To test: bash .git/hooks/pre-commit" -ForegroundColor Gray
}

function Invoke-CI {
    Invoke-DockerBuild
    Invoke-Check
    Write-Ok "CI pipeline complete"
}

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
        @{ Cmd = 'build';         Desc = 'Build VolumeII (the bare Lean 4 proofs)' },
        @{ Cmd = 'build-all';     Desc = 'Build all volumes' },
        @{ Cmd = 'check';         Desc = 'Build + check: no sorry, no Mathlib, lint' },
        @{ Cmd = 'clean';         Desc = 'Remove lake build artifacts' },
        @{ Cmd = 'shell';         Desc = 'Open interactive shell in Docker container' },
        @{ Cmd = 'docker-build';  Desc = 'Build the Docker image' },
        @{ Cmd = 'lint';          Desc = 'Check doc-comment display name coverage' },
        @{ Cmd = 'stats';         Desc = 'Print theorem/def counts per file' },
        @{ Cmd = 'install-hooks'; Desc = 'Install git pre-commit hook' },
        @{ Cmd = 'ci';            Desc = 'Full CI: docker-build + check' }
    ) | ForEach-Object {
        Write-Host ("  {0,-20} {1}" -f $_.Cmd, $_.Desc)
    }
    Write-Host ""
    Write-Host "Flags:" -ForegroundColor White
    Write-Host "  -Native    Use native Lean instead of Docker"
    Write-Host ""
    Write-Host "Examples:" -ForegroundColor White
    Write-Host "  .\build.ps1 docker-build       # First time setup"
    Write-Host "  .\build.ps1 check              # Before committing"
    Write-Host "  .\build.ps1 build -Native      # If Lean is installed locally"
    Write-Host "  .\build.ps1 stats              # See proof progress"
    Write-Host ""
}

# ── Dispatch ──────────────────────────────────────────────────

try {
    switch ($Command) {
        'build'         { Invoke-Build }
        'build-all'     { Invoke-BuildAll }
        'check'         { Invoke-Check }
        'clean'         { Invoke-Clean }
        'shell'         { Invoke-Shell }
        'docker-build'  { Invoke-DockerBuild }
        'docker-pull'   {
            Write-Step "Pulling pre-built image"
            docker pull "ghcr.io/wsollers/lra-lean:latest" 2>$null
            if ($LASTEXITCODE -eq 0) {
                docker tag "ghcr.io/wsollers/lra-lean:latest" $IMAGE
                Write-Ok "Image pulled and tagged as '$IMAGE'"
            } else {
                Write-Warn "No pre-built image found. Run '.\build.ps1 docker-build'"
            }
        }
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
