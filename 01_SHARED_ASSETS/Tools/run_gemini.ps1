# Gemini CLI Wrapper Script - Enhanced for Multi-AI Efficiency System
# Usage: .\run_gemini.ps1 -Question "path\to\question.md" OR -QuestionText "inline question"

param(
    [Parameter(Mandatory=$false)]
    [string]$Question,

    [Parameter(Mandatory=$false)]
    [string]$QuestionText,

    [Parameter(Mandatory=$false)]
    [switch]$NoCache
)

$ErrorActionPreference = "Stop"
$OutputEncoding = [System.Text.Encoding]::UTF8

# Setup logging
$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$logDir = "$PSScriptRoot\_logs"
$statsDir = "$PSScriptRoot\_stats"
$cacheDir = "$PSScriptRoot\_cache"

if (-not (Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir -Force | Out-Null
}
if (-not (Test-Path $statsDir)) {
    New-Item -ItemType Directory -Path $statsDir -Force | Out-Null
}
if (-not (Test-Path $cacheDir)) {
    New-Item -ItemType Directory -Path $cacheDir -Force | Out-Null
}

$logFile = Join-Path $logDir "gemini_$timestamp.log"
$delegationLogFile = Join-Path $statsDir "delegation-log.json"
$cacheIndexFile = Join-Path $cacheDir "cache-index.json"

function Write-Log {
    param([string]$Message)
    $logMessage = "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] $Message"
    Write-Host $logMessage
    Add-Content -Path $logFile -Value $logMessage -Encoding UTF8
}

function Log-Delegation {
    param(
        [string]$Question,
        [string]$QuestionType,
        [string]$Reason,
        [bool]$CacheHit,
        [bool]$Success,
        [double]$DurationSeconds
    )

    $entry = @{
        timestamp = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
        task = $Question
        estimated_loc = 0
        files_count = 0
        delegated_to = "gemini"
        question_type = $QuestionType
        reason = $Reason
        cache_hit = $CacheHit
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

function Get-QuestionHash {
    param([string]$Content)

    # Normalize and create hash for caching
    $normalized = $Content.Trim().ToLower() -replace '\s+', ' '
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($normalized)
    $hasher = [System.Security.Cryptography.SHA256]::Create()
    $hash = $hasher.ComputeHash($bytes)
    $hashString = [BitConverter]::ToString($hash) -replace '-', ''
    return $hashString.Substring(0, 16)
}

function Check-Cache {
    param([string]$QuestionHash)

    if (-not (Test-Path $cacheIndexFile)) {
        return $null
    }

    try {
        $cacheIndex = Get-Content $cacheIndexFile -Raw -Encoding UTF8 | ConvertFrom-Json
        $entry = $cacheIndex | Where-Object { $_.hash -eq $QuestionHash } | Select-Object -First 1

        if ($entry) {
            $cacheFile = Join-Path $cacheDir "$($entry.hash).txt"
            if (Test-Path $cacheFile) {
                $age = (Get-Date) - [DateTime]$entry.timestamp
                if ($age.TotalHours -lt 24) {
                    Write-Log "✓ Cache HIT! (Age: $([Math]::Round($age.TotalHours, 1)) hours)"
                    return Get-Content $cacheFile -Raw -Encoding UTF8
                } else {
                    Write-Log "Cache entry expired (>24h old), will query fresh"
                    return $null
                }
            }
        }
    } catch {
        Write-Log "Warning: Cache check failed, proceeding with fresh query"
    }

    return $null
}

function Save-Cache {
    param(
        [string]$QuestionHash,
        [string]$Question,
        [string]$Response
    )

    # Save response to cache file
    $cacheFile = Join-Path $cacheDir "$QuestionHash.txt"
    $Response | Set-Content -Path $cacheFile -Encoding UTF8

    # Update cache index
    $cacheIndex = @()
    if (Test-Path $cacheIndexFile) {
        try {
            $cacheIndex = Get-Content $cacheIndexFile -Raw -Encoding UTF8 | ConvertFrom-Json
            if ($cacheIndex -isnot [Array]) {
                $cacheIndex = @($cacheIndex)
            }
        } catch {
            $cacheIndex = @()
        }
    }

    # Add new entry
    $entry = @{
        hash = $QuestionHash
        question_preview = $Question.Substring(0, [Math]::Min(100, $Question.Length))
        timestamp = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
    }

    # Remove old entry with same hash if exists
    $cacheIndex = $cacheIndex | Where-Object { $_.hash -ne $QuestionHash }
    $cacheIndex += $entry

    # Keep only last 50 entries
    if ($cacheIndex.Count -gt 50) {
        $cacheIndex = $cacheIndex | Sort-Object timestamp -Descending | Select-Object -First 50
    }

    $cacheIndex | ConvertTo-Json -Depth 10 | Set-Content -Path $cacheIndexFile -Encoding UTF8
    Write-Log "Response cached: $cacheFile"
}

function Detect-QuestionType {
    param([string]$Content)

    $contentLower = $Content.ToLower()

    if ($contentLower -match '(architecture|design pattern|approach|best practice|strategy)') {
        return "architecture"
    }
    if ($contentLower -match '(error|exception|bug|fail|crash|issue|problem)') {
        return "error-analysis"
    }
    if ($contentLower -match '(performance|slow|optimize|speed|efficient)') {
        return "performance"
    }
    if ($contentLower -match '(security|vulnerability|exploit|attack|safe)') {
        return "security"
    }
    if ($contentLower -match '(review|quality|code smell|refactor)') {
        return "code-review"
    }
    if ($contentLower -match '(trade-?off|pros? and cons?|compare|versus|vs\.)') {
        return "tradeoff-analysis"
    }

    return "general"
}

function Validate-Question {
    param([string]$Content)

    # Basic validation
    if ($Content.Length -lt 10) {
        Write-Log "WARNING: Question seems very short (<10 chars)"
        Write-Log "Consider providing more context for better answers"
        return $false
    }

    if ($Content.Length -gt 5000) {
        Write-Log "WARNING: Question is very long (>5000 chars)"
        Write-Log "Consider breaking it down into smaller questions"
        return $false
    }

    return $true
}

Write-Log "=== Gemini CLI Wrapper Started (Enhanced) ==="
Write-Log "Multi-AI Efficiency System - Consultation with Gemini"
Write-Log ""

# PRE-FLIGHT CHECKS

# 1. Validate input
if (-not $Question -and -not $QuestionText) {
    Write-Log "ERROR: Either -Question or -QuestionText must be provided"
    Write-Log ""
    Write-Log "Usage:"
    Write-Log "  .\run_gemini.ps1 -Question 'path\to\question.md'"
    Write-Log "  .\run_gemini.ps1 -QuestionText 'Your question here'"
    Write-Log ""
    Write-Log "Examples:"
    Write-Log "  .\run_gemini.ps1 -QuestionText 'What are pros/cons of WebSockets vs SSE?'"
    Write-Log "  .\run_gemini.ps1 -Question 'architecture-question.md'"
    exit 1
}

# 2. Check if gemini is available
Write-Log "Checking Gemini CLI availability..."
try {
    $geminiCheck = gemini --version 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "Gemini returned non-zero exit code"
    }
    Write-Log "✓ Gemini CLI found: $geminiCheck"
} catch {
    Write-Log "ERROR: Gemini CLI not found or not working"
    Write-Log ""
    Write-Log "Please install Gemini CLI:"
    Write-Log "  npm install -g @google/generative-ai-cli"
    Write-Log "Or configure according to your setup"
    Write-Log ""
    Write-Log "More info: https://ai.google.dev/gemini-api/docs/cli"
    exit 1
}

# 3. Prepare question content
$questionContent = ""
$questionDescription = ""

if ($Question) {
    if (-not (Test-Path $Question)) {
        Write-Log "ERROR: Question file not found: $Question"
        exit 1
    }
    $questionContent = Get-Content -Path $Question -Raw -Encoding UTF8
    $questionDescription = Split-Path -Leaf $Question
    Write-Log "✓ Using question file: $Question"
} else {
    $questionContent = $QuestionText
    $questionDescription = ($QuestionText.Substring(0, [Math]::Min(60, $QuestionText.Length))) -replace "`n", " "
    Write-Log "✓ Using inline question text"
}

Write-Log ""
Write-Log "Question content length: $($questionContent.Length) characters"

# 4. Validate question
Write-Log ""
Write-Log "Validating question..."
$validationOk = Validate-Question -Content $questionContent
if (-not $validationOk) {
    Write-Log ""
    $response = Read-Host "Continue anyway? (y/n)"
    if ($response -ne 'y' -and $response -ne 'Y') {
        Write-Log "Aborted by user"
        exit 1
    }
} else {
    Write-Log "✓ Question validation passed"
}

# 5. Detect question type
Write-Log ""
Write-Log "Analyzing question type..."
$questionType = Detect-QuestionType -Content $questionContent
Write-Log "  Question type: $questionType"
Write-Log ""

# 6. Check cache (unless -NoCache)
$cacheHit = $false
$cachedResponse = $null

if (-not $NoCache) {
    Write-Log "Checking response cache..."
    $questionHash = Get-QuestionHash -Content $questionContent
    $cachedResponse = Check-Cache -QuestionHash $questionHash

    if ($cachedResponse) {
        $cacheHit = $true
        Write-Log ""
        Write-Log "=== CACHED RESPONSE ==="
        Write-Log "---"
        Write-Log $cachedResponse
        Write-Log "---"
        Write-Log ""
        Write-Log "✓ Returned cached response (use -NoCache to force fresh query)"

        # Log delegation with cache hit
        Log-Delegation -Question $questionDescription `
                        -QuestionType $questionType `
                        -Reason "Cached consultation" `
                        -CacheHit $true `
                        -Success $true `
                        -DurationSeconds 0.0

        Write-Log ""
        Write-Log "Execution log saved to: $logFile"
        exit 0
    } else {
        Write-Log "No cache hit, querying Gemini..."
    }
} else {
    Write-Log "Cache disabled (-NoCache), querying Gemini..."
}

# 7. Show consultation reason
$consultationReason = "Gemini consultation: $questionType"
Write-Log "Consultation reason: $consultationReason"
Write-Log ""

# EXECUTION

$startTime = Get-Date

Write-Log "=== Starting Gemini Consultation ==="
Write-Log "Command: gemini (stdin)"
Write-Log "---"
Write-Log ""

$success = $false
$errorMessage = ""
$geminiResponse = ""

try {
    # Execute gemini
    $output = $questionContent | gemini 2>&1
    $exitCode = $LASTEXITCODE

    # Capture output
    $geminiResponse = $output | Out-String

    # Log output
    $geminiResponse | Tee-Object -FilePath $logFile -Append | Write-Host

    Write-Log ""
    Write-Log "---"
    Write-Log "=== Gemini Consultation Completed ==="

    $endTime = Get-Date
    $duration = ($endTime - $startTime).TotalSeconds

    Write-Log "Duration: $([Math]::Round($duration, 2)) seconds"
    Write-Log "Exit code: $exitCode"

    if ($exitCode -eq 0) {
        $success = $true
        Write-Log "Status: ✓ SUCCESS"

        # Cache response
        if (-not $NoCache) {
            Save-Cache -QuestionHash $questionHash -Question $questionDescription -Response $geminiResponse
        }
    } else {
        $errorMessage = "Gemini returned exit code $exitCode"
        Write-Log "Status: ✗ FAILED - $errorMessage"
    }

    # LOG DELEGATION
    Write-Log ""
    Write-Log "Logging delegation to stats..."
    Log-Delegation -Question $questionDescription `
                    -QuestionType $questionType `
                    -Reason $consultationReason `
                    -CacheHit $false `
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
    Write-Log "✓ Consultation successful! Check output above."
    Write-Log "  View stats: show_delegation_stats.ps1"
    exit 0

} catch {
    $endTime = Get-Date
    $duration = ($endTime - $startTime).TotalSeconds

    $errorMessage = $_.Exception.Message
    Write-Log ""
    Write-Log "---"
    Write-Log "=== Gemini Consultation Failed ==="
    Write-Log "ERROR: Exception during execution"
    Write-Log "Message: $errorMessage"
    Write-Log "Duration: $([Math]::Round($duration, 2)) seconds"

    # LOG FAILED DELEGATION
    Log-Delegation -Question $questionDescription `
                    -QuestionType $questionType `
                    -Reason $consultationReason `
                    -CacheHit $false `
                    -Success $false `
                    -DurationSeconds $duration

    Write-Log ""
    Write-Log "Execution log saved to: $logFile"
    exit 1
}
