# Quick Start - Multi-AI Efficiency System

**Get started with optimal delegation in 5 minutes!**

---

## Step 1: Setup (2 minutes)

### Run the setup script:
```powershell
cd "D:\CLAUDE SUPER AGENT"
.\setup_env.ps1
```

This will:
- Set environment variables
- Load helper functions (ai-codex, ai-gemini, etc.)
- Optionally add to PowerShell profile for auto-load

### Verify setup:
```powershell
ai-help
```

You should see all commands listed!

---

## Step 2: Your First Delegation (3 minutes)

### Scenario: Create a PowerShell Script

**Task**: Create a script that lists all .log files and counts ERROR entries.

### Option A: Smart Analysis (Recommended)

```powershell
delegate_smart.ps1 -TaskDescription "Create PowerShell script to find .log files and count ERROR entries" -AutoBrief
```

**Output**:
```
Analyzing task...

Recommended Tool: CODEX
Reason: LOC > 50 (estimated 75)
Confidence: high

✓ Brief template saved to: codex_brief_20251226_120000.md

Edit the brief, then run:
  ai-codex "codex_brief_20251226_120000.md"
```

### Option B: Manual Delegation

1. **Copy template**:
   ```powershell
   cp "02_TEMPLATES\codex-briefs\script-generation.md" "my-brief.md"
   ```

2. **Edit** `my-brief.md` (fill in [FILL IN] sections)

3. **Delegate**:
   ```powershell
   ai-codex "my-brief.md"
   ```

### Result

Codex generates:
- Complete PowerShell script
- Error handling
- Parameter support
- Documentation

**Time**: ~5-8 minutes (vs 30+ if coded manually!)

---

## Step 3: Architecture Consultation

**Question**: "Should I use JSON or SQLite for storing script configuration?"

### Execute:
```powershell
ai-gemini "Should I use JSON files or SQLite database for storing PowerShell script configuration? Scale: single user, < 1000 operations/day."
```

### Result (example):
```
For your use case (single user, low volume), JSON is simpler and sufficient:

Pros:
- No dependencies
- Easy to edit manually
- Version control friendly
- Simple implementation

Cons compared to SQLite:
- No concurrent access safety
- No complex querying

Recommendation: Use JSON. SQLite adds unnecessary complexity
for your scale. Migrate later if needed.
```

**Decision made in 2 minutes!** ✅

---

## Step 4: Check Your Stats

```powershell
show_delegation_stats.ps1 -Period today
```

**Example output**:
```
═══════════════════════════════════════════════════════════
 Multi-AI Efficiency System - Delegation Statistics
═══════════════════════════════════════════════════════════

━━━ OVERALL METRICS ━━━
  Total Delegations              2
  Successful                     2
  Success Rate                   100%

━━━ DELEGATION BREAKDOWN ━━━
  Codex Delegations             1
  Gemini Consultations          1
  Self Implemented              0

━━━ EFFICIENCY TARGET ━━━
  Delegation Rate               100%
  Target                        80%

  ✓ EXCELLENT! Target achieved!

━━━ CODEX DETAILS ━━━
  Total LOC Estimated           75

━━━ GEMINI DETAILS ━━━
  Total Consultations           1
  Question Types:
    • architecture              1
```

**You're already at 100% delegation!** 🚀

---

## Common Workflows

### Workflow 1: Simple Task (< 50 LOC)

```powershell
# 1. Quick fix - do it yourself
# Edit the file directly

# 2. But LOG it!
# (Tracking happens automatically via wrapper scripts)
```

### Workflow 2: Medium Task (50-150 LOC)

```powershell
# 1. Analyze
delegate_smart.ps1 -TaskDescription "..." -AutoBrief

# 2. Edit brief
# Fill in details

# 3. Delegate
ai-codex "brief.md"

# 4. Review output
# Test and integrate
```

### Workflow 3: Complex Feature (150+ LOC)

```powershell
# 1. Architecture question (if needed)
ai-gemini "Best approach for [feature]?"

# 2. Create comprehensive brief
# Use Gemini's insights

# 3. Delegate to Codex
ai-codex "feature-brief.md"

# 4. Review and test
```

### Workflow 4: Parallel Tasks

```powershell
# Terminal 1
ai-codex "implementation-brief.md"

# Terminal 2 (at the same time!)
ai-gemini "Performance question?"

# Combine results when both finish
```

---

## Daily Checklist

✅ Used `delegate_smart.ps1` for task analysis?
✅ Delegated all 50+ LOC tasks to Codex?
✅ Consulted Gemini for design questions?
✅ Tracked delegations (happens automatically)?

**Weekly**:
```powershell
show_delegation_stats.ps1 -Period week
```
Target: 80%+ delegation rate!

---

## Quick Reference

### Commands

```powershell
# Navigation
ai-root              # Go to workspace root
ai-boss              # Go to orchestrator
ai-projects          # Go to projects

# Delegation
ai-codex "brief.md"        # Delegate to Codex
ai-gemini "question"       # Consult Gemini

# Analysis
delegate_smart.ps1 -TaskDescription "..." -AutoBrief

# Stats
show_delegation_stats.ps1 -Period today|week|month|all

# Help
ai-help
```

### Decision Tree

```
Architecture/Design Question?
  YES → ai-gemini "..."
  NO  ↓

LOC > 50 OR Files > 2?
  YES → ai-codex "brief.md"
  NO  ↓

Handle yourself (but log it!)
```

---

## Templates Location

- **Codex Briefs**: `02_TEMPLATES\codex-briefs\`
  - script-generation.md
  - refactoring.md
  - new-feature.md
  - bug-fix.md
  - mcp-server.md

- **Gemini Questions**: `02_TEMPLATES\gemini-questions\`
  - architecture.md
  - error-analysis.md
  - performance.md
  - security.md

---

## Examples to Learn From

See: `04_EXAMPLES\`

1. **01-codex-basic-delegation** - How to delegate a 120 LOC task
2. **02-gemini-architecture** - Architecture consultation example
3. **03-parallel-delegation** - Running Codex + Gemini simultaneously
4. **04-efficiency-best-practices** - Patterns and anti-patterns

---

## Troubleshooting

### "Codex not found"
```powershell
codex --version
```
If error: Install Codex CLI from OpenAI

### "Gemini not found"
```powershell
gemini --version
```
If error: Configure Gemini CLI

### "ai-codex not recognized"
Re-run setup:
```powershell
.\setup_env.ps1
```

### "Delegation log not found"
Normal on first run! Log is created automatically when you first delegate.

---

## Next Steps

1. ✅ **Read**: [DELEGATION-STRATEGY.md](DELEGATION-STRATEGY.md) - Full strategy guide
2. ✅ **Browse**: `02_TEMPLATES/` - All available templates
3. ✅ **Learn**: `04_EXAMPLES/` - Real-world examples
4. ✅ **Try**: Delegate your first real task!
5. ✅ **Track**: Run `show_delegation_stats.ps1` weekly

---

## Tips for Success

**DO**:
- ✅ Use `delegate_smart.ps1` for every task
- ✅ Respect the 50 LOC threshold
- ✅ Ask Gemini before making architecture decisions
- ✅ Parallelize independent tasks
- ✅ Check stats weekly

**DON'T**:
- ❌ Implement 100+ LOC yourself
- ❌ Skip architecture consultation
- ❌ Delegate trivial tasks (< 50 LOC)
- ❌ Forget to track delegations
- ❌ Work sequentially when you can parallelize

---

**You're ready! Start delegating and achieve 80%+ efficiency!** 🚀

Questions? See: [DELEGATION-STRATEGY.md](DELEGATION-STRATEGY.md)
