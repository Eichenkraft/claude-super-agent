# Example: Basic Codex Delegation

**Scenario**: Task exceeds 50 LOC threshold → Delegate to Codex

## The Task

Create a PowerShell script that:
- Scans a directory for log files
- Parses each file for ERROR entries
- Generates a summary report
- Exports to CSV

**Complexity Estimation**:
- Estimated LOC: ~120
- Files: 1 script file
- **Decision**: LOC > 50 → **DELEGATE TO CODEX**

## Delegation Workflow

### Step 1: Analyze Task
```powershell
delegate_smart.ps1 -TaskDescription "Create PowerShell script to scan logs, parse errors, generate CSV report" -AutoBrief
```

**Output**:
```
Recommended Tool: CODEX
Reason: LOC > 50 (estimated 120)
Confidence: high

Brief template saved to: codex_brief_20251226_120000.md
```

### Step 2: Fill Brief

Edit the generated brief (`example-brief.md` in this folder).

### Step 3: Delegate

```powershell
ai-codex "04_EXAMPLES\01-codex-basic-delegation\example-brief.md"
```

### Step 4: Result

Codex generates:
- `log-analyzer.ps1` (actual: 135 LOC)
- Proper error handling
- CSV export functionality
- Usage documentation

**Time saved**: ~25 minutes of coding + testing

## Key Takeaway

**50+ LOC tasks should always go to Codex for maximum efficiency!**

## Files in This Example

- `README.md` - This file
- `example-brief.md` - Sample Codex brief
- `result-log-analyzer.ps1` - Example output from Codex (for reference)
