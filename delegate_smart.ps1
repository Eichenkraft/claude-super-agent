# Smart Delegation Helper
# Analyzes task and recommends optimal tool (Codex, Gemini, or Self)

param(
    [Parameter(Mandatory=$true)]
    [string]$TaskDescription,

    [Parameter(Mandatory=$false)]
    [switch]$AutoBrief
)

$ErrorActionPreference = "Stop"
$OutputEncoding = [System.Text.Encoding]::UTF8

function Write-Header {
    param([string]$Text)
    Write-Host ""
    Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host " $Text" -ForegroundColor White
    Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
    Write-Host ""
}

function Estimate-LOC {
    param([string]$Description)

    $desc = $Description.ToLower()

    # Keyword-based LOC estimation
    if ($desc -match '(mcp server|new project|repository|complex integration)') {
        return 200
    }
    if ($desc -match '(refactor|multi-step|workflow|automation|pipeline)') {
        return 150
    }
    if ($desc -match '(script|tool|utility|function|class)') {
        return 75
    }
    if ($desc -match '(fix bug|update|modify|change|edit)') {
        return 30
    }
    if ($desc -match '(config|setting|parameter|variable)') {
        return 20
    }

    # Default based on description length
    $words = ($desc -split '\s+').Count
    if ($words -gt 30) { return 100 }
    if ($words -gt 15) { return 60 }
    return 40
}

function Estimate-Files {
    param([string]$Description)

    $desc = $Description.ToLower()

    # Count file-related keywords
    $fileCount = 0

    if ($desc -match '(multiple files|several files|many files)') {
        $fileCount = 5
    } elseif ($desc -match '(\d+)\s*files?') {
        $fileCount = [int]$Matches[1]
    } elseif ($desc -match '(new project|repository|mcp server)') {
        $fileCount = 6
    } elseif ($desc -match '(refactor|restructure|reorganize)') {
        $fileCount = 4
    } elseif ($desc -match '(script|tool|function)') {
        $fileCount = 1
    } elseif ($desc -match '(and|plus|\+)') {
        $fileCount = 2
    } else {
        $fileCount = 1
    }

    return $fileCount
}

function Detect-QuestionType {
    param([string]$Description)

    $desc = $Description.ToLower()

    if ($desc -match '(should i|which|best (way|practice|approach)|how (do i|should i)|what.*better)') {
        return "architecture-question"
    }
    if ($desc -match '(error|exception|fail|crash|issue|problem|bug)') {
        return "error-analysis"
    }
    if ($desc -match '(performance|slow|optimize|speed|faster|efficient)') {
        return "performance-question"
    }
    if ($desc -match '(security|safe|secure|vulnerability|risk)') {
        return "security-question"
    }
    if ($desc -match '(review|quality|check|validate|best practice)') {
        return "review-question"
    }
    if ($desc -match '(pros? and cons?|trade-?off|compare|versus|vs\.)') {
        return "tradeoff-analysis"
    }

    return "unknown"
}

function Get-Recommendation {
    param(
        [int]$EstimatedLOC,
        [int]$EstimatedFiles,
        [string]$QuestionType
    )

    # Decision logic based on Multi-AI Efficiency Protocol
    if ($QuestionType -ne "unknown") {
        return @{
            Tool = "gemini"
            Reason = "Architecture/design question detected"
            Confidence = "high"
        }
    }

    if ($EstimatedLOC -gt 50 -or $EstimatedFiles -gt 2) {
        return @{
            Tool = "codex"
            Reason = "LOC > 50 OR Files > 2 (delegation threshold)"
            Confidence = "high"
        }
    }

    if ($EstimatedLOC -gt 30 -or $EstimatedFiles -eq 2) {
        return @{
            Tool = "codex"
            Reason = "Near delegation threshold - better to delegate"
            Confidence = "medium"
        }
    }

    return @{
        Tool = "self"
        Reason = "Small task (< 50 LOC, 1-2 files) - may handle directly"
        Confidence = "medium"
    }
}

function Generate-CodexBrief {
    param(
        [string]$TaskDescription,
        [int]$EstimatedLOC,
        [int]$EstimatedFiles
    )

    $brief = @"
# Mission
$TaskDescription

# Context
Auto-generated brief by delegate_smart.ps1 based on task analysis.

# Target Directory
[FILL IN: Specify the absolute path where work should happen]

# Tech Stack
[FILL IN: Languages, frameworks, libraries, versions]

# Entry Points
[FILL IN: Main files or modules to focus on]

# Constraints
- Estimated LOC: $EstimatedLOC
- Estimated Files: $EstimatedFiles
- [Add more specific constraints]

# Implementation Plan
1. [FILL IN: Step 1]
2. [FILL IN: Step 2]
3. [FILL IN: Step 3]

# Success Criteria
- [FILL IN: How to measure success]
- Code executes without errors
- Documentation is updated
- Tests pass (if applicable)

# Risks & Watchouts
- [FILL IN: Potential issues to watch for]
"@

    return $brief
}

# Main Logic
Write-Header "Smart Delegation Analyzer"

Write-Host "Analyzing task..." -ForegroundColor Yellow
Write-Host ""

# Display task
Write-Host "━━━ TASK DESCRIPTION ━━━" -ForegroundColor Cyan
Write-Host "  $TaskDescription" -ForegroundColor White
Write-Host ""

# Analyze task
$estimatedLOC = Estimate-LOC -Description $TaskDescription
$estimatedFiles = Estimate-Files -Description $TaskDescription
$questionType = Detect-QuestionType -Description $TaskDescription

# Show analysis
Write-Host "━━━ TASK ANALYSIS ━━━" -ForegroundColor Cyan
Write-Host "  Estimated LOC: " -NoNewline
Write-Host $estimatedLOC -ForegroundColor $(if ($estimatedLOC -gt 50) { "Yellow" } else { "Green" })

Write-Host "  Estimated Files: " -NoNewline
Write-Host $estimatedFiles -ForegroundColor $(if ($estimatedFiles -gt 2) { "Yellow" } else { "Green" })

Write-Host "  Question Type: " -NoNewline
Write-Host $questionType -ForegroundColor $(if ($questionType -ne "unknown") { "Blue" } else { "Gray" })

Write-Host ""

# Get recommendation
$recommendation = Get-Recommendation -EstimatedLOC $estimatedLOC -EstimatedFiles $estimatedFiles -QuestionType $questionType

# Display recommendation
Write-Host "━━━ RECOMMENDATION ━━━" -ForegroundColor Green
Write-Host ""

$toolColor = switch ($recommendation.Tool) {
    "codex" { "Magenta" }
    "gemini" { "Blue" }
    "self" { "White" }
}

Write-Host "  Recommended Tool: " -NoNewline
Write-Host $recommendation.Tool.ToUpper() -ForegroundColor $toolColor

Write-Host "  Reason: " -NoNewline
Write-Host $recommendation.Reason -ForegroundColor Gray

Write-Host "  Confidence: " -NoNewline
$confidenceColor = if ($recommendation.Confidence -eq "high") { "Green" } else { "Yellow" }
Write-Host $recommendation.Confidence -ForegroundColor $confidenceColor

Write-Host ""

# Show next steps
Write-Host "━━━ NEXT STEPS ━━━" -ForegroundColor Cyan
Write-Host ""

switch ($recommendation.Tool) {
    "codex" {
        Write-Host "  1. Create a Codex brief with:" -ForegroundColor White
        Write-Host "     - Mission statement" -ForegroundColor Gray
        Write-Host "     - Target directory" -ForegroundColor Gray
        Write-Host "     - Tech stack" -ForegroundColor Gray
        Write-Host "     - Implementation plan" -ForegroundColor Gray
        Write-Host "     - Success criteria" -ForegroundColor Gray
        Write-Host ""
        Write-Host "  2. Execute delegation:" -ForegroundColor White
        Write-Host "     ai-codex `"path\to\brief.md`"" -ForegroundColor Green
        Write-Host ""

        if ($AutoBrief) {
            Write-Host "  Generating brief template..." -ForegroundColor Yellow
            Write-Host ""

            $brief = Generate-CodexBrief -TaskDescription $TaskDescription -EstimatedLOC $estimatedLOC -EstimatedFiles $estimatedFiles

            $briefPath = "$PSScriptRoot\codex_brief_$(Get-Date -Format 'yyyyMMdd_HHmmss').md"
            $brief | Set-Content -Path $briefPath -Encoding UTF8

            Write-Host "  ✓ Brief template saved to:" -ForegroundColor Green
            Write-Host "    $briefPath" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "  Edit the brief (fill in [FILL IN] sections), then run:" -ForegroundColor White
            Write-Host "    ai-codex `"$briefPath`"" -ForegroundColor Green
            Write-Host ""
        } else {
            Write-Host "  TIP: Use -AutoBrief to generate a brief template" -ForegroundColor Yellow
            Write-Host "       delegate_smart.ps1 -TaskDescription `"...`" -AutoBrief" -ForegroundColor Gray
            Write-Host ""
        }
    }

    "gemini" {
        Write-Host "  Consult Gemini CLI for:" -ForegroundColor White

        switch ($questionType) {
            "architecture-question" {
                Write-Host "    Architecture / design decision" -ForegroundColor Gray
            }
            "error-analysis" {
                Write-Host "    Error analysis and troubleshooting" -ForegroundColor Gray
            }
            "performance-question" {
                Write-Host "    Performance optimization advice" -ForegroundColor Gray
            }
            "security-question" {
                Write-Host "    Security review and best practices" -ForegroundColor Gray
            }
            "review-question" {
                Write-Host "    Code review and quality check" -ForegroundColor Gray
            }
            "tradeoff-analysis" {
                Write-Host "    Tradeoff analysis between options" -ForegroundColor Gray
            }
        }

        Write-Host ""
        Write-Host "  Execute consultation:" -ForegroundColor White
        Write-Host "    ai-gemini `"$TaskDescription`"" -ForegroundColor Cyan
        Write-Host ""
    }

    "self" {
        Write-Host "  You may implement this task directly:" -ForegroundColor White
        Write-Host "    • Small scope (< 50 LOC, 1-2 files)" -ForegroundColor Gray
        Write-Host "    • No complex architecture decisions" -ForegroundColor Gray
        Write-Host ""
        Write-Host "  IMPORTANT: Still log to delegation-log.json!" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "  If task grows beyond 50 LOC or 2 files:" -ForegroundColor White
        Write-Host "    STOP and delegate to Codex instead" -ForegroundColor Red
        Write-Host ""
    }
}

# Efficiency note
Write-Host "━━━ EFFICIENCY NOTE ━━━" -ForegroundColor Yellow
Write-Host ""

if ($recommendation.Tool -eq "codex" -or $recommendation.Tool -eq "gemini") {
    Write-Host "  ✓ Delegating this task helps achieve our 80% delegation target!" -ForegroundColor Green
    Write-Host "    Specialization = Speed + Quality" -ForegroundColor Gray
} else {
    Write-Host "  ℹ This task is small enough to handle directly" -ForegroundColor White
    Write-Host "    But remember: 80% delegation target for maximum efficiency!" -ForegroundColor Gray
}

Write-Host ""
Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
