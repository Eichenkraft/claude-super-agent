# Delegation Statistics Dashboard
# Shows Multi-AI Efficiency System metrics

param(
    [Parameter(Mandatory=$false)]
    [ValidateSet("today", "week", "month", "all")]
    [string]$Period = "today"
)

$ErrorActionPreference = "Stop"
$OutputEncoding = [System.Text.Encoding]::UTF8

$delegationLogFile = "$PSScriptRoot\01_SHARED_ASSETS\Tools\_stats\delegation-log.json"

function Write-Header {
    param([string]$Text)
    Write-Host ""
    Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host " $Text" -ForegroundColor White
    Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
}

function Write-Metric {
    param(
        [string]$Label,
        [string]$Value,
        [string]$Color = "White"
    )
    $padding = 35 - $Label.Length
    Write-Host "  $Label" -NoNewline
    Write-Host (" " * $padding) -NoNewline
    Write-Host $Value -ForegroundColor $Color
}

function Get-DateFilter {
    param([string]$Period)

    $now = Get-Date
    switch ($Period) {
        "today" {
            return $now.Date
        }
        "week" {
            return $now.AddDays(-7)
        }
        "month" {
            return $now.AddDays(-30)
        }
        "all" {
            return [DateTime]::MinValue
        }
    }
}

# Check if log file exists
if (-not (Test-Path $delegationLogFile)) {
    Write-Header "Delegation Statistics - No Data Yet"
    Write-Host ""
    Write-Host "  No delegation log found at:" -ForegroundColor Yellow
    Write-Host "  $delegationLogFile" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  The log will be created automatically when you:" -ForegroundColor White
    Write-Host "    - Delegate to Codex: ai-codex `"brief.md`"" -ForegroundColor Green
    Write-Host "    - Consult Gemini: ai-gemini `"question`"" -ForegroundColor Green
    Write-Host ""
    exit 0
}

# Read delegation log
try {
    $log = Get-Content $delegationLogFile -Raw -Encoding UTF8 | ConvertFrom-Json
    if ($log -isnot [Array]) {
        $log = @($log)
    }
} catch {
    Write-Host "ERROR: Could not read delegation log: $_" -ForegroundColor Red
    exit 1
}

if ($log.Count -eq 0) {
    Write-Header "Delegation Statistics - No Entries Yet"
    Write-Host ""
    Write-Host "  Log file exists but is empty" -ForegroundColor Yellow
    Write-Host ""
    exit 0
}

# Filter by period
$dateFilter = Get-DateFilter -Period $Period
$filteredLog = $log | Where-Object {
    [DateTime]$_.timestamp -ge $dateFilter
}

if ($filteredLog.Count -eq 0) {
    Write-Header "Delegation Statistics - No Data for $Period"
    Write-Host ""
    Write-Host "  No delegations found in the selected period: $Period" -ForegroundColor Yellow
    Write-Host "  Total entries in log: $($log.Count)" -ForegroundColor Gray
    Write-Host ""
    exit 0
}

# Calculate statistics
$totalDelegations = $filteredLog.Count
$codexDelegations = @($filteredLog | Where-Object { $_.delegated_to -eq "codex" }).Count
$geminiDelegations = @($filteredLog | Where-Object { $_.delegated_to -eq "gemini" }).Count
$selfImplemented = @($filteredLog | Where-Object { $_.delegated_to -eq "self" }).Count

$successfulDelegations = @($filteredLog | Where-Object { $_.success -eq $true }).Count
$failedDelegations = @($filteredLog | Where-Object { $_.success -eq $false }).Count

# Calculate delegation rate (codex + gemini vs total)
if ($totalDelegations -gt 0) {
    $delegationRate = [Math]::Round((($codexDelegations + $geminiDelegations) / $totalDelegations) * 100, 1)
    $successRate = [Math]::Round(($successfulDelegations / $totalDelegations) * 100, 1)
} else {
    $delegationRate = 0
    $successRate = 0
}

# Average duration
$avgDuration = 0
if ($filteredLog.Count -gt 0) {
    $totalDuration = ($filteredLog | Measure-Object -Property duration_seconds -Sum).Sum
    $avgDuration = [Math]::Round($totalDuration / $filteredLog.Count, 1)
}

# Codex LOC stats
$codexEntries = $filteredLog | Where-Object { $_.delegated_to -eq "codex" }
$totalLOC = 0
if ($codexEntries.Count -gt 0) {
    $totalLOC = ($codexEntries | Measure-Object -Property estimated_loc -Sum).Sum
}

# Gemini question types
$geminiEntries = $filteredLog | Where-Object { $_.delegated_to -eq "gemini" }
$questionTypes = $geminiEntries | Group-Object -Property question_type | Sort-Object Count -Descending

# Gemini cache hits
$cacheHits = @($geminiEntries | Where-Object { $_.cache_hit -eq $true }).Count
$cacheMisses = @($geminiEntries | Where-Object { $_.cache_hit -eq $false }).Count

# Display Dashboard
Write-Header "Multi-AI Efficiency System - Delegation Statistics"

Write-Host ""
Write-Host "  Period: " -NoNewline
Write-Host $Period.ToUpper() -ForegroundColor Yellow
Write-Host "  Log file: " -NoNewline
Write-Host (Split-Path $delegationLogFile -Leaf) -ForegroundColor Gray
Write-Host ""

# Overall Metrics
Write-Host ""
Write-Host "━━━ OVERALL METRICS ━━━" -ForegroundColor Cyan
Write-Metric "Total Delegations" $totalDelegations "White"
Write-Metric "Successful" $successfulDelegations "Green"
Write-Metric "Failed" $failedDelegations $(if ($failedDelegations -gt 0) { "Red" } else { "Green" })
Write-Metric "Success Rate" "$successRate%" $(if ($successRate -ge 90) { "Green" } elseif ($successRate -ge 75) { "Yellow" } else { "Red" })
Write-Metric "Average Duration" "$avgDuration seconds" "White"

# Delegation Breakdown
Write-Host ""
Write-Host "━━━ DELEGATION BREAKDOWN ━━━" -ForegroundColor Cyan
Write-Metric "Codex Delegations" $codexDelegations "Magenta"
Write-Metric "Gemini Consultations" $geminiDelegations "Blue"
Write-Metric "Self Implemented" $selfImplemented "White"

# Delegation Rate (GOAL: 80%)
Write-Host ""
Write-Host "━━━ EFFICIENCY TARGET ━━━" -ForegroundColor Cyan
$delegationRateColor = if ($delegationRate -ge 80) { "Green" } elseif ($delegationRate -ge 60) { "Yellow" } else { "Red" }
Write-Metric "Delegation Rate" "$delegationRate%" $delegationRateColor
Write-Metric "Target" "80%" "Gray"

if ($delegationRate -ge 80) {
    Write-Host "  ✓ EXCELLENT! Target achieved!" -ForegroundColor Green
} elseif ($delegationRate -ge 60) {
    Write-Host "  ⚠ GOOD, but room for improvement" -ForegroundColor Yellow
    Write-Host "    Consider delegating more tasks to Codex/Gemini" -ForegroundColor Gray
} else {
    Write-Host "  ✗ Below target - delegate more!" -ForegroundColor Red
    Write-Host "    Tip: Use Codex for tasks >50 LOC or >2 files" -ForegroundColor Gray
}

# Codex Details
if ($codexDelegations -gt 0) {
    Write-Host ""
    Write-Host "━━━ CODEX DETAILS ━━━" -ForegroundColor Magenta
    Write-Metric "Total LOC Estimated" $totalLOC "Magenta"
    Write-Metric "Average LOC per Task" ([Math]::Round($totalLOC / $codexDelegations, 0)) "Magenta"

    # Show recent Codex tasks
    $recentCodex = $codexEntries | Sort-Object timestamp -Descending | Select-Object -First 3
    Write-Host ""
    Write-Host "  Recent Codex Tasks:" -ForegroundColor Gray
    foreach ($entry in $recentCodex) {
        $taskPreview = $entry.task.Substring(0, [Math]::Min(50, $entry.task.Length))
        $status = if ($entry.success) { "✓" } else { "✗" }
        Write-Host "    $status $taskPreview" -ForegroundColor $(if ($entry.success) { "Green" } else { "Red" })
        Write-Host "       LOC: $($entry.estimated_loc) | Duration: $($entry.duration_seconds)s" -ForegroundColor DarkGray
    }
}

# Gemini Details
if ($geminiDelegations -gt 0) {
    Write-Host ""
    Write-Host "━━━ GEMINI DETAILS ━━━" -ForegroundColor Blue
    Write-Metric "Total Consultations" $geminiDelegations "Blue"
    Write-Metric "Cache Hits" $cacheHits "Green"
    Write-Metric "Cache Misses" $cacheMisses "Yellow"

    if ($geminiDelegations -gt 0) {
        $cacheHitRate = [Math]::Round(($cacheHits / $geminiDelegations) * 100, 1)
        Write-Metric "Cache Hit Rate" "$cacheHitRate%" $(if ($cacheHitRate -ge 20) { "Green" } else { "Gray" })
    }

    # Question types breakdown
    if ($questionTypes.Count -gt 0) {
        Write-Host ""
        Write-Host "  Question Types:" -ForegroundColor Gray
        foreach ($type in $questionTypes) {
            $typeName = $type.Name
            $count = $type.Count
            Write-Host "    • $typeName" -NoNewline -ForegroundColor White
            Write-Host (" " * (25 - $typeName.Length)) -NoNewline
            Write-Host $count -ForegroundColor Blue
        }
    }

    # Show recent Gemini questions
    $recentGemini = $geminiEntries | Sort-Object timestamp -Descending | Select-Object -First 3
    Write-Host ""
    Write-Host "  Recent Consultations:" -ForegroundColor Gray
    foreach ($entry in $recentGemini) {
        $taskPreview = $entry.task.Substring(0, [Math]::Min(50, $entry.task.Length))
        $cacheIndicator = if ($entry.cache_hit) { "⚡" } else { "  " }
        $status = if ($entry.success) { "✓" } else { "✗" }
        Write-Host "    $status$cacheIndicator $taskPreview" -ForegroundColor $(if ($entry.success) { "Cyan" } else { "Red" })
        Write-Host "       Type: $($entry.question_type) | Duration: $($entry.duration_seconds)s" -ForegroundColor DarkGray
    }
}

# Timeline
Write-Host ""
Write-Host "━━━ TIMELINE ━━━" -ForegroundColor Cyan

$oldestEntry = ($filteredLog | Sort-Object timestamp | Select-Object -First 1).timestamp
$newestEntry = ($filteredLog | Sort-Object timestamp -Descending | Select-Object -First 1).timestamp

Write-Metric "First Entry" ([DateTime]$oldestEntry).ToString("yyyy-MM-dd HH:mm") "Gray"
Write-Metric "Latest Entry" ([DateTime]$newestEntry).ToString("yyyy-MM-dd HH:mm") "Gray"

# Tips
Write-Host ""
Write-Host "━━━ TIPS ━━━" -ForegroundColor Yellow
Write-Host "  • Use different periods: -Period today|week|month|all" -ForegroundColor Gray
Write-Host "  • Delegate to Codex: ai-codex `"brief.md`"" -ForegroundColor Gray
Write-Host "  • Consult Gemini: ai-gemini `"question`"" -ForegroundColor Gray
Write-Host "  • View log: 01_SHARED_ASSETS\Tools\_stats\delegation-log.json" -ForegroundColor Gray
Write-Host ""

Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
