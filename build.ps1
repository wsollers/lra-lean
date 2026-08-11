# ============================================================
# build.ps1 — lra-lean Windows Build and Maintenance Script
# ============================================================
#
# Usage:
#   .\build.ps1                    # Show help
#   .\build.ps1 build              # Build all production and test Lean libraries
#   .\build.ps1 build-all          # Build all volumes
#   .\build.ps1 test               # Build Lean test targets
#   .\build.ps1 check              # Build + proof-readiness + all checks
#   .\build.ps1 clean              # Remove build artifacts
#   .\build.ps1 shell              # Open shell in Docker container
#   .\build.ps1 docker-build       # Build the Docker image
#   .\build.ps1 docker-docs-build  # Build the Docker documentation image
#   .\build.ps1 docker-blueprint-build # Build the Docker Blueprint image
#   .\build.ps1 blueprint-inputs   # Generate available Blueprint inputs
#   .\build.ps1 blueprint          # Compile Blueprint PDF and web output
#   .\build.ps1 blueprint-existing # Compile Blueprint from existing generated inputs
#   .\build.ps1 docs               # Build site and attach Blueprint output
#   .\build.ps1 lint               # Check hover doc-comment coverage
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
        'build', 'build-all', 'test', 'check', 'clean', 'shell',
        'docker-build', 'docker-docs-build', 'docker-blueprint-build', 'docker-pull',
        'blueprint-inputs', 'blueprint', 'blueprint-existing', 'docs', 'lint', 'stats',
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
$BLUEPRINT_IMAGE = 'lra-lean-blueprint'
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

function Invoke-NoMathlibInEarlyVolumes {
    Write-Step "Checking Mathlib import policy in VolumeI / VolumeII"
    $python = Get-Command python -ErrorAction SilentlyContinue
    if (-not $python) {
        $python = Get-Command py -ErrorAction SilentlyContinue
    }
    if (-not $python) {
        throw "Python is required to run scripts/check-mathlib-imports.py"
    }
    & $python.Source (Join-Path $SrcDir 'scripts\check-mathlib-imports.py')
    if ($LASTEXITCODE -ne 0) { throw "Mathlib import policy check failed" }
    Write-Ok "No disallowed Mathlib imports in VolumeI / VolumeII"
}

function Invoke-Build {
    Write-Step "Building all production and test Lean libraries (Lean $Toolchain)"
    Invoke-NoMathlibInEarlyVolumes
    Invoke-Run @(
        'lake', 'build',
        'LRAVolumeI', 'LRAVolumeII', 'LRAVolumeIII',
        'LRAVolumeIV', 'LRAVolumeVI', 'LRAVolumeVII',
        'LRATests'
    )
    Write-Ok "All production and test Lean libraries built successfully"
}

function Invoke-BlueprintDocker {
    param([string]$BlueprintCommand)
    docker run --rm -v "${SrcDir}:/workspace" -w /workspace $BLUEPRINT_IMAGE $BlueprintCommand
    if ($LASTEXITCODE -ne 0) {
        throw "Command failed: docker run --rm -v ${SrcDir}:/workspace -w /workspace $BLUEPRINT_IMAGE $BlueprintCommand"
    }
}

function Invoke-BuildAll {
    Write-Step "Building all volumes (Lean $Toolchain)"
    Invoke-NoMathlibInEarlyVolumes
    Invoke-Run @(
        'lake', 'build',
        'LRAVolumeI', 'LRAVolumeII', 'LRAVolumeIII',
        'LRAVolumeIV', 'LRAVolumeVI', 'LRAVolumeVII'
    )
    Write-Ok "Full build successful"
}

function Invoke-Test {
    Write-Step "Building Lean test targets (Lean $Toolchain)"
    Invoke-NoMathlibInEarlyVolumes
    Invoke-Run @('lake', 'build', 'LRATests')
    Write-Ok "Lean test targets built successfully"
}

function Invoke-Check {
    Invoke-NoMathlibInEarlyVolumes
    Invoke-Build
    Write-Step "Checking proof-readiness"
    $vol2 = Join-Path $SrcDir 'LRA\VolumeII'
    Invoke-ProofReadiness
    Write-Ok "Proof-readiness check passed"
    Write-Step "Checking for Mathlib imports outside VolumeII switch modules"
    $switchRoot = Join-Path $vol2 'Switches'
    $matlibFiles = Get-ChildItem -Path $vol2 -Filter '*.lean' -Recurse |
        Where-Object { -not $_.FullName.StartsWith($switchRoot) } |
        Select-String -Pattern '^import Mathlib' -List | Select-Object -ExpandProperty Path
    if ($matlibFiles) {
        Write-Fail "Mathlib import found outside VolumeII switch modules:"
        $matlibFiles | ForEach-Object { Write-Host "    $_" -ForegroundColor Red }
        throw "VolumeII Mathlib imports are allowed only under LRA/VolumeII/Switches."
    }
    Write-Ok "No Mathlib imports outside VolumeII switches"
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

function Invoke-DockerBlueprintBuild {
    Write-Step "Building Docker Blueprint image '$BLUEPRINT_IMAGE'"
    $dockerfile = Join-Path $SrcDir 'Dockerfile.blueprint'
    if (-not (Test-Path $dockerfile)) { throw "Dockerfile.blueprint not found at: $dockerfile" }
    docker build -f $dockerfile -t $BLUEPRINT_IMAGE $SrcDir
    if ($LASTEXITCODE -ne 0) { throw "Docker Blueprint build failed" }
    Write-Ok "Docker image '$BLUEPRINT_IMAGE' built"
}

function Invoke-BlueprintInputs {
    Write-Step "Generating available Blueprint inputs"
    if ($Native) {
        Invoke-DocsRun @('python', 'scripts/build-volume-blueprints.py')
    } else {
        Invoke-BlueprintDocker 'inputs'
    }
    Write-Ok "Blueprint inputs generated"
}

function Invoke-Blueprint {
    Write-Step "Compiling Blueprint PDF and web output"
    if ($Native) {
        Invoke-BlueprintInputs
        Invoke-DocsRun @('leanblueprint', 'pdf')
        Invoke-DocsRun @('leanblueprint', 'web')
    } else {
        Invoke-BlueprintDocker 'blueprint'
    }
    Write-Ok "Blueprint compiled"
}

function Invoke-BlueprintExisting {
    Write-Step "Compiling Blueprint PDF and web output from existing generated inputs"
    if ($Native) {
        Invoke-DocsRun @('leanblueprint', 'pdf')
        Invoke-DocsRun @('leanblueprint', 'web')
    } else {
        Invoke-BlueprintDocker 'blueprint-existing'
    }
    Write-Ok "Blueprint compiled from existing inputs"
}

function Invoke-Docs {
    Write-Step "Generating repository documentation site"
    if ($Native) {
        Invoke-Blueprint
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
        Copy-Item -Force -Path (Join-Path $SrcDir 'blueprint\print\print.pdf') -Destination (Join-Path $SrcDir 'site\lra-blueprint.pdf')
    } else {
        Invoke-BlueprintDocker 'docs'
    }
    Write-Ok "Documentation site generated in site/"
}

function Invoke-Lint {
    param([switch]$WarnOnly)
    Write-Step "Checking repository-wide hover documentation coverage"
    $python = Get-Command python -ErrorAction SilentlyContinue
    if (-not $python) {
        $python = Get-Command py -ErrorAction SilentlyContinue
    }
    if (-not $python) {
        throw "Python is required to run scripts/check-hover-docs.py"
    }
    $script = Join-Path $SrcDir 'scripts\check-hover-docs.py'
    $leanRoot = Join-Path $SrcDir 'LRA'
    & $python.Source $script --root $leanRoot
    if ($LASTEXITCODE -eq 0) {
        Write-Ok "All public declarations have hover doc-comments and logical forms"
    } else {
        $msg = "Hover documentation coverage check failed"
        if ($WarnOnly) {
            Write-Warn "$msg (warning — not blocking)"
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
        @{ Cmd = 'build';         Desc = 'Build all production and test Lean libraries' },
        @{ Cmd = 'build-all';     Desc = 'Build all volumes' },
        @{ Cmd = 'test';          Desc = 'Build Lean test targets' },
        @{ Cmd = 'check';         Desc = 'Build + proof-readiness, no Mathlib, lint' },
        @{ Cmd = 'clean';         Desc = 'Remove lake build artifacts' },
        @{ Cmd = 'shell';         Desc = 'Open interactive shell in Docker container' },
        @{ Cmd = 'docker-build';  Desc = 'Build the Docker image' },
        @{ Cmd = 'docker-docs-build'; Desc = 'Build the Docker documentation image' },
        @{ Cmd = 'docker-blueprint-build'; Desc = 'Build the Docker Blueprint image' },
        @{ Cmd = 'blueprint-inputs'; Desc = 'Generate available Blueprint inputs' },
        @{ Cmd = 'blueprint';      Desc = 'Compile Blueprint PDF and web output' },
        @{ Cmd = 'blueprint-existing'; Desc = 'Compile Blueprint from existing generated inputs' },
        @{ Cmd = 'docs';           Desc = 'Build site and attach Blueprint output' },
        @{ Cmd = 'lint';          Desc = 'Check repository-wide hover doc-comment coverage' },
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
        'test'          { Invoke-Test }
        'check'         { Invoke-Check }
        'clean'         { Invoke-Clean }
        'shell'         { Invoke-Shell }
        'docker-build'  { Invoke-DockerBuild }
        'docker-docs-build' { Invoke-DockerDocsBuild }
        'docker-blueprint-build' { Invoke-DockerBlueprintBuild }
        'blueprint-inputs' { Invoke-BlueprintInputs }
        'blueprint'     { Invoke-Blueprint }
        'blueprint-existing' { Invoke-BlueprintExisting }
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
