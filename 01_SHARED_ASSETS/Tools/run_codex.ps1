# Codex CLI Wrapper Script - Enhanced for Multi-AI Efficiency System
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
$statsDir = "$PSScriptRoot\_stats"

if (-not (Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir -Force | Out-Null
}
if (-not (Test-Path $statsDir)) {
    New-Item -ItemType Directory -Path $statsDir -Force | Out-Null
}

$logFile = Join-Path $logDir "codex_$timestamp.log"
$delegationLogFile = Join-Path $statsDir "delegation-log.json"

function Write-Log {
    param([string]$Message)
    $logMessage = "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] $Message"
    Write-Host $logMessage
    Add-Content -Path $logFile -Value $logMessage -Encoding UTF8
}

function Log-Delegation {
    param(
        [string]$Task,
        [int]$EstimatedLOC,
        [int]$FilesCount,
        [string]$Reason,
        [bool]$Success,
        [double]$DurationSeconds
    )

    $entry = @{
        timestamp = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
        task = $Task
        estimated_loc = $EstimatedLOC
        files_count = $FilesCount
        delegated_to = "codex"
        reason = $Reason
        success = $Success
        duration_seconds = [Math]::Round($DurationSeconds, 2)
    }

    # Read existing log or create new
    $log = @()
    if (Test-Path $delegationLogFile) {
        try {
            $log = Get-Content $delegationLogFile -Raw -Encoding UTF8 | ConvertFrom-Json
            if ($log -isnot [Array]) {
                $log = @($log)
            }
        } catch {
            Write-Log "Warning: Could not read delegation log, creating new"
            $log = @()
        }
    }

    # Append new entry
    $log += $entry

    # Write back
    $log | ConvertTo-Json -Depth 10 | Set-Content -Path $delegationLogFile -Encoding UTF8

    Write-Log "Delegation logged to: $delegationLogFile"
}

function Estimate-LOC {
    param([string]$Content)

    # Simple heuristic: count newlines in brief
    # Better would be to parse the "Implementation Plan" section
    $lines = ($Content -split "`n").Length

    # Look for explicit LOC mentions
    if ($Content -match '(\d+)\+?\s*(LOC|lines of code)') {
        return [int]$Matches[1]
    }

    # Default estimation based on brief length
    if ($lines -lt 20) { return 50 }
    if ($lines -lt 40) { return 100 }
    if ($lines -lt 60) { return 200 }
    return 300
}

function Validate-Brief {
    param([string]$Content)

    $requiredSections = @(
        "# Mission",
        "# Context",
        "# Target Directory",
        "# Tech Stack",
        "# Implementation Plan",
        "# Success Criteria"
    )

    $missing = @()
    foreach ($section in $requiredSections) {
        if ($Content -notmatch [regex]::Escape($section)) {
            $missing += $section
        }
    }

    if ($missing.Count -gt 0) {
        Write-Log "WARNING: Brief is missing recommended sections:"
        foreach ($m in $missing) {
            Write-Log "  - $m"
        }
        Write-Log ""
        Write-Log "Recommended brief structure:"
        Write-Log "  # Mission"
        Write-Log "  # Context"
        Write-Log "  # Target Directory"
        Write-Log "  # Tech Stack"
        Write-Log "  # Entry Points"
        Write-Log "  # Constraints"
        Write-Log "  # Implementation Plan"
        Write-Log "  # Success Criteria"
        Write-Log "  # Risks & Watchouts"
        Write-Log ""

        # Ask user if they want to continue
        $response = Read-Host "Continue anyway? (y/n)"
        if ($response -ne 'y' -and $response -ne 'Y') {
            Write-Log "Aborted by user"
            exit 1
        }
    } else {
        Write-Log "✓ Brief validation passed - all required sections present"
    }
}

Write-Log "=== Codex CLI Wrapper Started (Enhanced) ==="
Write-Log "Multi-AI Efficiency System - Delegation to Codex"
Write-Log ""

# PRE-FLIGHT CHECKS

# 1. Validate input
if (-not $Brief -and -not $BriefText) {
    Write-Log "ERROR: Either -Brief or -BriefText must be provided"
    Write-Log ""
    Write-Log "Usage:"
    Write-Log "  .\run_codex.ps1 -Brief 'path\to\brief.md'"
    Write-Log "  .\run_codex.ps1 -BriefText 'Quick task description'"
    exit 1
}

# 2. Check if codex is available
Write-Log "Checking Codex CLI availability..."
try {
    $codexCheck = codex --version 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "Codex returned non-zero exit code"
    }
    Write-Log "✓ Codex CLI found: $codexCheck"
} catch {
    Write-Log "ERROR: Codex CLI not found or not working"
    Write-Log ""
    Write-Log "Please install Codex CLI:"
    Write-Log "  npm install -g @openai/codex"
    Write-Log "Or:"
    Write-Log "  brew install --cask codex"
    Write-Log ""
    Write-Log "More info: https://openai.com/codex"
    exit 1
}

# 3. Prepare brief content
$briefContent = ""
$taskDescription = ""

if ($Brief) {
    if (-not (Test-Path $Brief)) {
        Write-Log "ERROR: Brief file not found: $Brief"
        exit 1
    }
    $briefContent = Get-Content -Path $Brief -Raw -Encoding UTF8
    $taskDescription = Split-Path -Leaf $Brief
    Write-Log "✓ Using brief file: $Brief"
} else {
    $briefContent = $BriefText
    $taskDescription = ($BriefText.Substring(0, [Math]::Min(50, $BriefText.Length))) -replace "`n", " "
    Write-Log "✓ Using inline brief text"
}

Write-Log ""
Write-Log "Brief content length: $($briefContent.Length) characters"

# 4. Validate brief structure
Write-Log ""
Write-Log "Validating brief structure..."
Validate-Brief -Content $briefContent

# 5. Estimate complexity
Write-Log ""
Write-Log "Estimating task complexity..."
$estimatedLOC = Estimate-LOC -Content $briefContent

# Count file mentions as rough estimate
$fileCount = ([regex]::Matches($briefContent, '\.(ps1|py|js|ts|md|json|yml|yaml|txt)')).Count
if ($fileCount -eq 0) { $fileCount = 1 }

Write-Log "  Estimated LOC: $estimatedLOC"
Write-Log "  Estimated files: $fileCount"
Write-Log ""

# 6. Show delegation reason
$delegationReason = "Task delegated to Codex"
if ($estimatedLOC -gt 50) {
    $delegationReason = "LOC ($estimatedLOC) exceeds threshold (50)"
}
if ($fileCount -gt 2) {
    $delegationReason += " | Files ($fileCount) exceeds threshold (2)"
}

Write-Log "Delegation reason: $delegationReason"
Write-Log "Sandbox mode: $SandboxMode"
Write-Log ""

# EXECUTION

$startTime = Get-Date

Write-Log "=== Starting Codex Execution ==="
Write-Log "Command: codex exec --sandbox $SandboxMode"
Write-Log "---"
Write-Log ""

$success = $false
$errorMessage = ""

try {
    # Execute codex
    $output = $briefContent | codex exec --sandbox $SandboxMode 2>&1
    $exitCode = $LASTEXITCODE

    # Log output
    $output | Tee-Object -FilePath $logFile -Append

    Write-Log ""
    Write-Log "---"
    Write-Log "=== Codex Execution Completed ==="

    $endTime = Get-Date
    $duration = ($endTime - $startTime).TotalSeconds

    Write-Log "Duration: $([Math]::Round($duration, 2)) seconds"
    Write-Log "Exit code: $exitCode"

    if ($exitCode -eq 0) {
        $success = $true
        Write-Log "Status: ✓ SUCCESS"
    } else {
        $errorMessage = "Codex returned exit code $exitCode"
        Write-Log "Status: ✗ FAILED - $errorMessage"
    }

    # LOG DELEGATION
    Write-Log ""
    Write-Log "Logging delegation to stats..."
    Log-Delegation -Task $taskDescription `
                    -EstimatedLOC $estimatedLOC `
                    -FilesCount $fileCount `
                    -Reason $delegationReason `
                    -Success $success `
                    -DurationSeconds $duration

    Write-Log ""
    Write-Log "Execution log saved to: $logFile"

    if (-not $success) {
        Write-Log ""
        Write-Log "TIP: Check the log file for detailed error information"
        exit $exitCode
    }

    Write-Log ""
    Write-Log "✓ Delegation successful! Check output above."
    Write-Log "  View stats: show_delegation_stats.ps1"
    exit 0

} catch {
    $endTime = Get-Date
    $duration = ($endTime - $startTime).TotalSeconds

    $errorMessage = $_.Exception.Message
    Write-Log ""
    Write-Log "---"
    Write-Log "=== Codex Execution Failed ==="
    Write-Log "ERROR: Exception during execution"
    Write-Log "Message: $errorMessage"
    Write-Log "Duration: $([Math]::Round($duration, 2)) seconds"

    # LOG FAILED DELEGATION
    Log-Delegation -Task $taskDescription `
                    -EstimatedLOC $estimatedLOC `
                    -FilesCount $fileCount `
                    -Reason $delegationReason `
                    -Success $false `
                    -DurationSeconds $duration

    Write-Log ""
    Write-Log "Execution log saved to: $logFile"
    exit 1
}
