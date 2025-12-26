# Multi-AI Delegation Strategy

**Version**: 2.0
**Last Updated**: 2025-12-26
**Goal**: Achieve 80%+ delegation rate for maximum development efficiency

---

## The Core Concept

This workspace implements a **Multi-AI Efficiency System** where specialized tools handle what they do best:

```
Claude Code    → ORCHESTRATION (Coordination, Planning, Decisions)
Codex GPT-5.2  → IMPLEMENTATION (Heavy Coding, Large Tasks) [UNLIMITED]
Gemini CLI     → CONSULTATION (Architecture, Quick Questions) [FAST]
```

**Why 80% Delegation?**
1. **Specialization**: Each tool excels at specific tasks
2. **Parallelization**: Multiple agents working simultaneously
3. **Speed**: Codex often faster for large coding tasks
4. **Quality**: Best results through optimal tool selection

**This is about EFFICIENCY, not token savings!**

---

## The Decision Tree

### BEFORE ANY TASK - Mandatory Analysis:

```
┌─────────────────────────────────────────┐
│  ESTIMATE:                              │
│  • Lines of Code (LOC)                  │
│  • Files to modify/create               │
│  • Complexity                           │
└─────────────────────────────────────────┘
              │
              ▼
   ┌──────────────────────┐
   │  Is it a QUESTION    │
   │  about architecture, │     YES     ┌──────────────┐
   │  design, approach,   │────────────▶│   GEMINI     │
   │  or tradeoffs?       │             └──────────────┘
   └──────────────────────┘
              │ NO
              ▼
   ┌──────────────────────┐
   │  LOC > 50            │
   │        OR            │     YES     ┌──────────────┐
   │  Files > 2           │────────────▶│   CODEX      │
   │        OR            │             │  + LOG IT!   │
   │  Duration > 10min?   │             └──────────────┘
   └──────────────────────┘
              │ NO
              ▼
   ┌──────────────────────┐
   │  Handle directly     │
   │  BUT LOG TO:         │
   │  delegation-log.json │
   └──────────────────────┘
```

---

## Delegation Rules (ENFORCED)

### MUST Delegate to Codex When ANY of:
- ✅ **50+ LOC** estimated
- ✅ **3+ files** will be modified
- ✅ **New MCP server** development
- ✅ **New repository** initialization
- ✅ **Complex integrations** (multi-step, multiple systems)
- ✅ **Refactoring** across multiple modules
- ✅ **Task duration > 10 minutes**
- ✅ **Implementing any new feature** (not just edits)

### MUST Consult Gemini When:
- 🔍 **Architecture decisions**: "Which approach should I use?"
- 🔍 **Design patterns**: "What's the best pattern for this?"
- 🔍 **Error diagnosis**: "Why is this failing?"
- 🔍 **Performance analysis**: "How can I optimize this?"
- 🔍 **Security review**: "Is this approach secure?"
- 🔍 **Tradeoff analysis**: "Pros and cons of X vs Y?"

### MAY Handle Directly ONLY When ALL of:
- ✅ **< 50 LOC total**
- ✅ **1-2 files** maximum
- ✅ **Simple edits** to existing code
- ✅ **No architectural decisions** required
- ✅ **Task duration < 5 minutes**
- ⚠️ **CRITICAL**: You MUST still log to `delegation-log.json`

---

## Tool Capabilities

### Codex CLI (OpenAI GPT-5.2 Max)
**Best for**: Implementation, code generation, large tasks

**Strengths**:
- Unlimited usage
- Excellent at code generation
- Handles 50-500+ LOC easily
- Follows detailed briefs precisely
- Multi-file projects

**Use Cases**:
- Scripts and tools
- MCP servers
- Refactoring projects
- Bug fixes (complex)
- New features

**How to Use**:
```powershell
ai-codex "path\to\brief.md"
```

### Gemini CLI
**Best for**: Consultation, architecture, analysis

**Strengths**:
- Fast responses (1-2 minutes)
- Excellent reasoning
- Architecture insights
- Error diagnosis
- Tradeoff analysis
- Response caching (24h)

**Use Cases**:
- "Should I use X or Y?"
- "Why is this error happening?"
- "How can I optimize this?"
- "Is this approach secure?"
- "What are the tradeoffs?"

**How to Use**:
```powershell
ai-gemini "Your question here"
```

### Claude Code (You!)
**Best for**: Orchestration, coordination, small tasks

**Strengths**:
- Project coordination
- Planning and task breakdown
- Small edits (< 50 LOC)
- Documentation updates
- Decision-making
- Quality control

**Responsibilities**:
- Decide which tool to use
- Create briefs for Codex
- Formulate questions for Gemini
- Integrate results
- Track delegation metrics

---

## Delegation Workflow

### Step 1: Analyze Task

Use **delegate_smart.ps1**:
```powershell
delegate_smart.ps1 -TaskDescription "Your task here" -AutoBrief
```

**Output**:
- Estimated LOC
- Estimated files
- Recommended tool (Codex/Gemini/Self)
- Confidence level
- Auto-generated brief (if Codex)

### Step 2: Execute Delegation

**For Codex**:
1. Review/edit generated brief
2. Fill in [FILL IN] sections
3. Run: `ai-codex "brief.md"`
4. Review output
5. Update CHANGELOG

**For Gemini**:
1. Use question template (optional)
2. Run: `ai-gemini "question"`
3. Apply insights to your work
4. Document decision

**For Self**:
1. Implement directly
2. Keep it <50 LOC
3. **Log to delegation-log.json!**

### Step 3: Track Results

Check delegation statistics:
```powershell
show_delegation_stats.ps1 -Period today
```

**Target metrics**:
- Delegation Rate: 80%+
- Success Rate: 90%+
- Codex tasks: 10-20/week
- Gemini consultations: 5-10/week

---

## Delegation Tracking

Every delegation is logged to:
```
01_SHARED_ASSETS/Tools/_stats/delegation-log.json
```

**Log entry format**:
```json
{
  "timestamp": "2025-12-26T12:00:00Z",
  "task": "Create log analysis script",
  "estimated_loc": 120,
  "files_count": 1,
  "delegated_to": "codex",
  "reason": "LOC > 50",
  "success": true,
  "duration_seconds": 45.2
}
```

**Why track?**
- Measure delegation rate
- Identify patterns
- Optimize workflow
- Prove efficiency gains

---

## Advanced Patterns

### Pattern 1: Parallel Delegation

For independent tasks:
```powershell
# Terminal 1
ai-codex "implementation-brief.md"

# Terminal 2 (simultaneously!)
ai-gemini "Architecture question?"
```

**Result**: max(time1, time2) instead of time1 + time2

### Pattern 2: Batch Related Tasks

Instead of 3 separate Codex briefs, create ONE comprehensive brief:
```markdown
# Mission
Implement features A, B, and C as cohesive module

# Implementation Plan
1. Feature A: ...
2. Feature B: ...
3. Feature C: ...
```

**Benefit**: Better integration, shared context

### Pattern 3: Question → Brief → Implementation

Best workflow for complex features:
1. Ask Gemini about architecture
2. Use Gemini's insights in Codex brief
3. Codex implements with optimal approach
4. **No wasted work!**

---

## Templates

### Codex Briefs
Located in: `02_TEMPLATES/codex-briefs/`

- `script-generation.md` - For new scripts
- `refactoring.md` - For code refactoring
- `new-feature.md` - For new features
- `bug-fix.md` - For bug fixes
- `mcp-server.md` - For MCP servers

### Gemini Questions
Located in: `02_TEMPLATES/gemini-questions/`

- `architecture.md` - Architecture decisions
- `error-analysis.md` - Error diagnosis
- `performance.md` - Performance optimization
- `security.md` - Security review

---

## Examples

See real-world examples in: `04_EXAMPLES/`

1. **Basic Codex Delegation** - 50+ LOC task
2. **Gemini Architecture** - Design question
3. **Parallel Delegation** - Simultaneous tasks
4. **Efficiency Best Practices** - Patterns and anti-patterns

---

## Success Metrics

### Daily Goals
- Use delegate_smart.ps1 for task analysis
- Delegate all 50+ LOC tasks to Codex
- Consult Gemini for design questions
- Log all tasks (even self-implemented)

### Weekly Review
```powershell
show_delegation_stats.ps1 -Period week
```

**Target**:
- Delegation Rate: **80%+** ✅
- Success Rate: **90%+**
- Average task size: 100-150 LOC (Codex)
- Gemini cache hit rate: 20%+

**If below target**:
- Review "self" tasks - could they be delegated?
- Lower threshold? (40 LOC instead of 50?)
- Batch smaller tasks together?
- Consult Gemini more proactively?

---

## Anti-Patterns to Avoid

❌ **Don't** implement 150 LOC yourself "because I can"
✅ **Do** delegate to Codex, use saved time for planning

❌ **Don't** skip Gemini and guess at architecture
✅ **Do** Quick consultation → better design!

❌ **Don't** delegate 20 LOC trivial tasks
✅ **Do** Handle <50 LOC yourself, batch if related

❌ **Don't** forget to log decisions
✅ **Do** Track everything for metrics!

❌ **Don't** work sequentially when tasks are independent
✅ **Do** Parallelize Codex + Gemini delegations!

---

## Quick Reference

### Command Cheatsheet

```powershell
# Analyze task and get recommendation
delegate_smart.ps1 -TaskDescription "..." -AutoBrief

# Delegate to Codex
ai-codex "path\to\brief.md"

# Consult Gemini
ai-gemini "Your question?"

# Check stats
show_delegation_stats.ps1 -Period today|week|month|all

# View delegation log
cat 01_SHARED_ASSETS\Tools\_stats\delegation-log.json
```

### Decision Quick Check

| Condition | Tool |
|-----------|------|
| LOC > 50 | Codex |
| Files > 2 | Codex |
| Architecture question | Gemini |
| Error diagnosis | Gemini |
| < 50 LOC + simple | Self (but log!) |
| MCP server | Always Codex |
| Design tradeoffs | Gemini first |

---

## Philosophy

**This system is built on**:
- **Specialization over generalization**: Right tool for the job
- **Delegation over DIY**: Leverage unlimited Codex
- **Consultation over guessing**: Gemini for better decisions
- **Tracking over gut feeling**: Metrics drive improvement
- **Parallelization over sequential**: Speed through concurrency
- **Efficiency over ego**: Results matter, not who wrote it

**Remember**: The goal is **maximum development velocity through optimal tool usage**, not to minimize any specific resource. It's about working smarter, not harder!

---

**Next Steps**: Read [QUICKSTART.md](QUICKSTART.md) for hands-on tutorial!
