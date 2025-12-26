# Gemini CLI Wrapper Script
# Usage: .\run_gemini.ps1 -Question "path\to\question.md" OR -QuestionText "inline question"

param(
    [Parameter(Mandatory=$false)]
    [string]$Question,

    [Parameter(Mandatory=$false)]
    [string]$QuestionText
)

$ErrorActionPreference = "Stop"
$OutputEncoding = [System.Text.Encoding]::UTF8

# Setup logging
$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$logDir = "$PSScriptRoot\_logs"
if (-not (Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir -Force | Out-Null
}
$logFile = Join-Path $logDir "gemini_$timestamp.log"

function Write-Log {
    param([string]$Message)
    $logMessage = "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] $Message"
    Write-Host $logMessage
    Add-Content -Path $logFile -Value $logMessage -Encoding UTF8
}

Write-Log "=== Gemini CLI Wrapper Started ==="

# Validate input
if (-not $Question -and -not $QuestionText) {
    Write-Log "ERROR: Either -Question or -QuestionText must be provided"
    exit 1
}

# Check if gemini is available
try {
    $geminiVersion = gemini --version 2>&1
    Write-Log "Gemini version: $geminiVersion"
} catch {
    Write-Log "ERROR: Gemini CLI not found."
    Write-Log "Please install Gemini CLI or configure the correct command."
    exit 1
}

# Prepare question content
$questionContent = ""
if ($Question) {
    if (-not (Test-Path $Question)) {
        Write-Log "ERROR: Question file not found: $Question"
        exit 1
    }
    $questionContent = Get-Content -Path $Question -Raw -Encoding UTF8
    Write-Log "Using question file: $Question"
} else {
    $questionContent = $QuestionText
    Write-Log "Using inline question text"
}

Write-Log "Question content length: $($questionContent.Length) characters"

# Execute gemini
Write-Log "Executing gemini CLI..."
Write-Log "---"

try {
    # Adjust this command based on your actual Gemini CLI syntax
    # This is a placeholder - modify based on actual gemini CLI interface
    $questionContent | gemini 2>&1 | Tee-Object -FilePath $logFile -Append
    $exitCode = $LASTEXITCODE

    Write-Log "---"
    Write-Log "Gemini execution completed with exit code: $exitCode"

    if ($exitCode -ne 0) {
        Write-Log "ERROR: Gemini execution failed"
        exit $exitCode
    }

    Write-Log "✓ Success! Log saved to: $logFile"
    exit 0

} catch {
    Write-Log "ERROR: Exception during gemini execution: $_"
    exit 1
}
