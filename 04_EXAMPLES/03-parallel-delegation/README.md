# Example: Parallel Delegation

**Scenario**: Multiple independent tasks → Delegate to Codex + Gemini simultaneously

## The Scenario

Building an MCP server for file operations:
1. **Implementation** (coding task)
2. **Architecture review** (consultation task)

These are **independent** and can run **in parallel**!

## Parallel Workflow

### Step 1: Start Both Delegations Simultaneously

**Terminal 1** - Codex Implementation:
```powershell
ai-codex "04_EXAMPLES\03-parallel-delegation\mcp-server-brief.md"
```

**Terminal 2** - Gemini Architecture Review (at same time!):
```powershell
ai-gemini "Should I use streams or buffers for large file operations in an MCP server? Performance vs memory tradeoffs?"
```

### Step 2: Work in Parallel

**Codex** (5-8 minutes):
- Generates MCP server boilerplate
- Implements file reading tools
- Creates TypeScript types
- Writes basic tests

**Gemini** (1-2 minutes):
- Analyzes streams vs buffers
- Recommends streams for large files
- Explains memory implications
- Suggests best practices

### Step 3: Combine Results

1. Codex delivers working implementation
2. Gemini's insights inform optimization
3. Apply Gemini's recommendations to Codex's code
4. **Total time**: ~8 minutes (vs ~15 if sequential!)

## Efficiency Gains

**Sequential Approach**:
- Gemini consultation: 2 min
- Wait for Codex: 7 min
- **Total: 9 minutes**

**Parallel Approach**:
- Both run simultaneously: max(7, 2) = 7 minutes
- **Time saved: 2 minutes** (22% faster!)

## Key Takeaway

**Independent tasks? Run Codex + Gemini in PARALLEL for maximum speed!**

## When to Use Parallel Delegation

✅ **DO** parallelize when:
- Tasks are truly independent
- One doesn't need output of the other
- You have separate questions/implementations

❌ **DON'T** parallelize when:
- Tasks depend on each other
- You need one output to inform the other
- Resources are constrained

## Files in This Example

- `README.md` - This file
- `mcp-server-brief.md` - Codex brief for implementation
- `architecture-question.txt` - Gemini question text
- `combined-result/` - Final optimized code
