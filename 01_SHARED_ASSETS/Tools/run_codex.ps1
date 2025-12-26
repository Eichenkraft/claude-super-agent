# Codex CLI Wrapper Script
# Usage: .\run_codex.ps1 -Brief "path\to\brief.md" OR -BriefText "inline brief text"

param(
    [Parameter(Mandatory=$false)]
    [string]$Brief,

    [Parameter(Mandatory=$false)]
    [string]$BriefText,

    [Parameter(Mandatory=$false)]
    [string]$SandboxMode = "danger-full-access"
)

$ErrorActionPreference = "Stop"
$OutputEncoding = [System.Text.Encoding]::UTF8

# Setup logging
$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$logDir = "$PSScriptRoot\_logs"
if (-not (Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir -Force | Out-Null
}
$logFile = Join-Path $logDir "codex_$timestamp.log"

function Write-Log {
    param([string]$Message)
    $logMessage = "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] $Message"
    Write-Host $logMessage
    Add-Content -Path $logFile -Value $logMessage -Encoding UTF8
}

Write-Log "=== Codex CLI Wrapper Started ==="

# Validate input
if (-not $Brief -and -not $BriefText) {
    Write-Log "ERROR: Either -Brief or -BriefText must be provided"
    exit 1
}

# Check if codex is available
try {
    $codexVersion = codex --version 2>&1
    Write-Log "Codex version: $codexVersion"
} catch {
    Write-Log "ERROR: Codex CLI not found. Please install it first."
    Write-Log "Installation: https://github.com/anthropics/codex"
    exit 1
}

# Prepare brief content
$briefContent = ""
if ($Brief) {
    if (-not (Test-Path $Brief)) {
        Write-Log "ERROR: Brief file not found: $Brief"
        exit 1
    }
    $briefContent = Get-Content -Path $Brief -Raw -Encoding UTF8
    Write-Log "Using brief file: $Brief"
} else {
    $briefContent = $BriefText
    Write-Log "Using inline brief text"
}

Write-Log "Brief content length: $($briefContent.Length) characters"
Write-Log "Sandbox mode: $SandboxMode"

# Execute codex
Write-Log "Executing: codex exec --sandbox $SandboxMode"
Write-Log "---"

try {
    $briefContent | codex exec --sandbox $SandboxMode 2>&1 | Tee-Object -FilePath $logFile -Append
    $exitCode = $LASTEXITCODE

    Write-Log "---"
    Write-Log "Codex execution completed with exit code: $exitCode"

    if ($exitCode -ne 0) {
        Write-Log "ERROR: Codex execution failed"
        exit $exitCode
    }

    Write-Log "✓ Success! Log saved to: $logFile"
    exit 0

} catch {
    Write-Log "ERROR: Exception during codex execution: $_"
    exit 1
}
