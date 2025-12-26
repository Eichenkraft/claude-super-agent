# Example: Multi-AI Efficiency Best Practices

**Goal**: Achieve 80%+ delegation rate through smart task distribution

## The Efficiency Matrix

| Task Type | LOC | Files | Complexity | Tool | Why |
|-----------|-----|-------|------------|------|-----|
| Bug fix (typo) | 5 | 1 | Low | **Self** | Too small to delegate |
| Add validation | 30 | 1 | Low | **Self** | <50 LOC, simple logic |
| New feature | 120 | 3 | Medium | **Codex** | >50 LOC, >2 files |
| Architecture decision | 0 | 0 | High | **Gemini** | Design question |
| MCP server | 250 | 5 | High | **Codex** | Always delegate! |
| Performance review | 0 | 0 | Medium | **Gemini** | Analysis task |

## Best Practice Patterns

### Pattern 1: Threshold Discipline

```
IF LOC > 50 OR files > 2:
    → Codex
ELSE IF Architecture/Design Question:
    → Gemini
ELSE:
    → Self (but LOG IT!)
```

**Example**:
- "Add input validation" (30 LOC, 1 file) → Self ✓
- "Refactor validation module" (75 LOC, 2 files) → Codex ✓

### Pattern 2: Question First, Code Second

**Bad workflow**:
1. Start coding
2. Hit design question
3. Stop, ask Gemini
4. Realize approach was wrong
5. Rewrite code

**Good workflow**:
1. Identify design questions FIRST
2. Ask Gemini
3. Use insights to create Codex brief
4. Codex implements with right approach
5. **No wasted work!**

### Pattern 3: Batch Similar Tasks

**Instead of**:
```powershell
ai-codex "feature-1.md"
# wait...
ai-codex "feature-2.md"
# wait...
ai-codex "feature-3.md"
```

**Do this**:
Create ONE comprehensive brief:
```markdown
# Mission
Implement features 1, 2, and 3 as cohesive module

# Implementation Plan
1. Feature 1: ...
2. Feature 2: ...
3. Feature 3: ...
```

**Result**: Better integration, fewer context switches!

### Pattern 4: Log Everything

Even small tasks should be logged:
```powershell
# Small fix you did yourself
# Still log to delegation-log.json:
{
  "task": "Fix typo in README",
  "delegated_to": "self",
  "estimated_loc": 5,
  "reason": "Too small for delegation"
}
```

**Why?**: Track your ACTUAL delegation rate!

## Weekly Efficiency Review

Run this every week:
```powershell
show_delegation_stats.ps1 -Period week
```

**Target metrics**:
- Delegation Rate: **80%+** ✅
- Codex Tasks: 10-20/week
- Gemini Consultations: 5-10/week
- Average LOC per Codex task: 100-200

**If below 80%**:
- Review tasks marked "self"
- Could any have been delegated?
- Lower threshold further? (40 LOC?)
- Batch smaller tasks?

## Anti-Patterns to Avoid

❌ **Don't**: Implement 150 LOC yourself "because I can"
✅ **Do**: Delegate to Codex, use saved time for architecture!

❌ **Don't**: Skip Gemini and guess at architecture
✅ **Do**: Quick 2-min consultation → better design!

❌ **Don't**: Delegate 20 LOC tasks to Codex
✅ **Do**: Handle <50 LOC yourself, batch related tasks

❌ **Don't**: Forget to log decisions
✅ **Do**: Track everything for metrics!

## Real-World Example

**Morning sprint** (4 hours):
1. **Gemini**: Architecture question (2 min)
2. **Codex**: Implement feature A (8 min)
3. **Self**: Fix small bug (5 min)
4. **Codex**: Implement feature B (7 min)
5. **Gemini**: Performance review (2 min)
6. **Codex**: Optimize based on Gemini (5 min)
7. **Self**: Update docs (10 min)

**Total tasks**: 7
**Delegated**: 5 (71%)
**Time**: 39 minutes
**If all done manually**: ~2-3 hours!

**Efficiency gain**: 3-4x faster! 🚀

## Key Takeaways

1. **Respect thresholds**: 50 LOC, 2 files → DELEGATE!
2. **Architecture first**: Ask Gemini before coding
3. **Parallel when possible**: Independent tasks simultaneously
4. **Batch related work**: Fewer context switches
5. **Log everything**: Track for improvement
6. **Review weekly**: Aim for 80%+ delegation!

## Efficiency Checklist

Daily:
- [ ] Used delegate_smart.ps1 for task analysis?
- [ ] Delegated all 50+ LOC tasks to Codex?
- [ ] Consulted Gemini for design questions?
- [ ] Logged all tasks (even self-implemented)?

Weekly:
- [ ] Ran show_delegation_stats.ps1?
- [ ] Delegation rate 80%+?
- [ ] Identified improvement opportunities?
- [ ] Adjusted workflow based on metrics?

**Remember**: The goal isn't to delegate everything, but to **optimize for speed and quality through specialization**!
