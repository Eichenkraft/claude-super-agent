# Claude Super Agent - Environment Setup Script
# Run this script to configure your environment with navigation helpers and tool shortcuts

$ErrorActionPreference = "Stop"
$OutputEncoding = [System.Text.Encoding]::UTF8

$SUPER_AGENT_ROOT = "D:\CLAUDE SUPER AGENT"

Write-Host ""
Write-Host "=== Claude Super Agent - Environment Setup ===" -ForegroundColor Cyan
Write-Host ""

# Set environment variable
[System.Environment]::SetEnvironmentVariable("CLAUDE_SUPER_AGENT_ROOT", $SUPER_AGENT_ROOT, [System.EnvironmentVariableTarget]::User)
Write-Host "✓ Environment variable set: CLAUDE_SUPER_AGENT_ROOT=$SUPER_AGENT_ROOT" -ForegroundColor Green

# Define navigation functions
function global:ai-root { Set-Location "$env:CLAUDE_SUPER_AGENT_ROOT" }
function global:ai-boss { Set-Location "$env:CLAUDE_SUPER_AGENT_ROOT\00_ORCHESTRATOR" }
function global:ai-shared { Set-Location "$env:CLAUDE_SUPER_AGENT_ROOT\01_SHARED_ASSETS" }
function global:ai-templates { Set-Location "$env:CLAUDE_SUPER_AGENT_ROOT\02_TEMPLATES" }
function global:ai-projects { Set-Location "$env:CLAUDE_SUPER_AGENT_ROOT\03_PROJECTS" }
function global:ai-sandbox { Set-Location "$env:CLAUDE_SUPER_AGENT_ROOT\99_SANDBOX" }

function global:ai-project {
    param([string]$ProjectName)
    if (-not $ProjectName) {
        Write-Host "Usage: ai-project <name>" -ForegroundColor Yellow
        Write-Host "Available projects:"
        Get-ChildItem "$env:CLAUDE_SUPER_AGENT_ROOT\03_PROJECTS" -Directory | ForEach-Object { Write-Host "  - $($_.Name)" }
        return
    }
    $projectPath = "$env:CLAUDE_SUPER_AGENT_ROOT\03_PROJECTS\$ProjectName"
    if (Test-Path $projectPath) {
        Set-Location $projectPath
    } else {
        Write-Host "Project not found: $ProjectName" -ForegroundColor Red
    }
}

# Define tool helper functions
function global:ai-codex {
    param(
        [Parameter(Mandatory=$true)]
        [string]$BriefOrText,
        [string]$SandboxMode = "danger-full-access"
    )

    $toolScript = "$env:CLAUDE_SUPER_AGENT_ROOT\01_SHARED_ASSETS\Tools\run_codex.ps1"

    if (Test-Path $BriefOrText) {
        & $toolScript -Brief $BriefOrText -SandboxMode $SandboxMode
    } else {
        & $toolScript -BriefText $BriefOrText -SandboxMode $SandboxMode
    }
}

function global:ai-gemini {
    param(
        [Parameter(Mandatory=$true)]
        [string]$QuestionOrText
    )

    $toolScript = "$env:CLAUDE_SUPER_AGENT_ROOT\01_SHARED_ASSETS\Tools\run_gemini.ps1"

    if (Test-Path $QuestionOrText) {
        & $toolScript -Question $QuestionOrText
    } else {
        & $toolScript -QuestionText $QuestionOrText
    }
}

function global:ai-help {
    Write-Host ""
    Write-Host "=== Claude Super Agent - Command Reference ===" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Navigation Commands:" -ForegroundColor Yellow
    Write-Host "  ai-root              Navigate to workspace root"
    Write-Host "  ai-boss              Navigate to orchestrator (00_ORCHESTRATOR)"
    Write-Host "  ai-shared            Navigate to shared assets (01_SHARED_ASSETS)"
    Write-Host "  ai-templates         Navigate to templates (02_TEMPLATES)"
    Write-Host "  ai-projects          Navigate to projects folder (03_PROJECTS)"
    Write-Host "  ai-project <name>    Navigate to specific project"
    Write-Host "  ai-sandbox           Navigate to sandbox (99_SANDBOX)"
    Write-Host ""
    Write-Host "Tool Commands:" -ForegroundColor Yellow
    Write-Host "  ai-codex <brief>     Execute Codex CLI with brief (file path or text)"
    Write-Host "  ai-gemini <question> Execute Gemini CLI with question (file path or text)"
    Write-Host ""
    Write-Host "Other Commands:" -ForegroundColor Yellow
    Write-Host "  ai-help              Show this help message"
    Write-Host ""
    Write-Host "Environment:" -ForegroundColor Yellow
    Write-Host "  CLAUDE_SUPER_AGENT_ROOT = $env:CLAUDE_SUPER_AGENT_ROOT"
    Write-Host ""
}

Write-Host "✓ Navigation functions loaded:" -ForegroundColor Green
Write-Host "  ai-root, ai-boss, ai-shared, ai-templates, ai-projects, ai-sandbox, ai-project" -ForegroundColor Gray

Write-Host "✓ Tool functions loaded:" -ForegroundColor Green
Write-Host "  ai-codex, ai-gemini" -ForegroundColor Gray

Write-Host ""
Write-Host "Type 'ai-help' for command reference" -ForegroundColor Cyan
Write-Host ""

# Add functions to profile for persistence (optional)
$profilePath = $PROFILE.CurrentUserAllHosts
if (-not (Test-Path $profilePath)) {
    New-Item -Path $profilePath -ItemType File -Force | Out-Null
}

$profileContent = Get-Content -Path $profilePath -Raw -ErrorAction SilentlyContinue
if ($profileContent -notlike "*CLAUDE SUPER AGENT*") {
    Write-Host "Do you want to add these functions to your PowerShell profile for automatic loading? (y/n): " -NoNewline -ForegroundColor Yellow
    $response = Read-Host
    if ($response -eq 'y' -or $response -eq 'Y') {
        Add-Content -Path $profilePath -Value "`n# CLAUDE SUPER AGENT - Auto-load environment`n& '$SUPER_AGENT_ROOT\setup_env.ps1'" -Encoding UTF8
        Write-Host "✓ Added to PowerShell profile: $profilePath" -ForegroundColor Green
        Write-Host "  Functions will load automatically in new PowerShell sessions" -ForegroundColor Gray
    }
}

Write-Host "=== Setup Complete ===" -ForegroundColor Cyan
Write-Host ""
