# Architecture Question Template

Use this template when consulting Gemini about architectural decisions, design patterns, or technical approach choices.

---

## Question

[State your architecture question clearly]

**Context:**
- **Project**: [What you're building]
- **Current Architecture**: [Existing design if applicable]
- **Scale**: [Expected users, data volume, request rate]
- **Constraints**: [Technology limitations, budget, timeline]

**Specific Decision:**
[What architectural choice are you trying to make?]

**Options Considered:**
1. **Option A**: [Brief description]
   - Pros: [What's good about this]
   - Cons: [What's bad about this]

2. **Option B**: [Brief description]
   - Pros: [What's good about this]
   - Cons: [What's bad about this]

3. **Option C** (if applicable): [Brief description]
   - Pros: [What's good about this]
   - Cons: [What's bad about this]

**Questions for Gemini:**
- Which option would you recommend and why?
- What are the long-term maintenance implications?
- Are there better alternatives I haven't considered?
- What are the hidden pitfalls of each approach?
- How does this scale?

---

## Example Architecture Questions

### Example 1: State Management
```
I'm building a Windows desktop automation tool in PowerShell.

Context:
- Project: Desktop automation with 20+ scripts
- Current: Each script manages its own state
- Scale: Single user, 100s of operations/day
- Constraints: Must be PowerShell-native, no external DBs

Specific Decision:
How should I manage shared state across multiple automation scripts?

Options Considered:
1. JSON config files (read/write on each operation)
2. PowerShell module with in-memory state
3. SQLite database for persistence

Questions:
- Which approach is most maintainable?
- How do I handle concurrent script execution?
- What about state corruption/recovery?
```

### Example 2: API Design
```
I'm creating an MCP server that wraps a REST API.

Context:
- MCP server for Claude Code integration
- Wrapping a third-party API with rate limits
- Need to expose 10+ operations
- Users will make many requests

Specific Decision:
Should I cache API responses, and if so, how?

Options:
1. No caching - always fresh data
2. In-memory cache with TTL
3. Persistent cache (file-based)

Questions:
- What's the best caching strategy for MCP servers?
- How do I handle stale data gracefully?
- Should cache be configurable by users?
```

### Example 3: Module Structure
```
I'm refactoring a large PowerShell project.

Context:
- 5000+ LOC in single script
- Multiple responsibilities mixed together
- Need to improve testability

Specific Decision:
How should I structure the modules?

Options:
1. Monolithic script with functions
2. Multiple modules by feature area
3. Layered architecture (core, utils, UI)

Questions:
- What's the best practice for PowerShell projects at this scale?
- How do I handle module dependencies?
- What about backwards compatibility?
```

---

## Tips for Architecture Questions

**Good Questions:**
- Include specific context (scale, constraints)
- List options you've already considered
- Ask about tradeoffs, not just "what's best"
- Mention non-functional requirements (performance, security)

**Avoid:**
- Vague questions without context
- "Should I use X or Y" without explaining your use case
- Asking for code implementation (use Codex for that)
- Questions that need deep codebase knowledge

**Follow-up:**
After Gemini's response, you might:
- Ask about specific concerns they didn't address
- Request clarification on technical points
- Inquire about real-world experiences with options
- Ask for resources/references to learn more
