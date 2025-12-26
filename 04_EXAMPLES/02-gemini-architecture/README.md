# Example: Gemini Architecture Consultation

**Scenario**: Architecture decision needed → Consult Gemini first

## The Question

"Should I use a JSON file or SQLite database for storing automation workflow state in my PowerShell project?"

**Why Gemini?**: This is an **architecture decision**, not a coding task.

## Consultation Workflow

### Step 1: Prepare Question

Use the architecture question template:
```powershell
# See example-question.md in this folder
```

### Step 2: Consult Gemini

```powershell
ai-gemini "04_EXAMPLES\02-gemini-architecture\example-question.md"
```

### Step 3: Gemini's Response

Gemini analyzes:
- **JSON File Approach**: Simple, no dependencies, easy version control
  - Pros: Easy to edit manually, no setup needed
  - Cons: Concurrent access issues, no query capabilities

- **SQLite Approach**: Better for complex queries, ACID properties
  - Pros: Reliable, queryable, handles concurrency
  - Cons: Binary format, requires SQL knowledge

**Recommendation**: "For your use case (single-user automation with <1000 operations/day), JSON is sufficient. SQLite adds unnecessary complexity unless you need complex queries or concurrent access."

### Step 4: Decision

Based on Gemini's input:
- ✅ Use JSON for simplicity
- Document decision in project README
- Can migrate to SQLite later if needed

**Time saved**: Hours of research + potential over-engineering

## Key Takeaway

**Architecture questions → Gemini consultation → Better decisions faster!**

## Files in This Example

- `README.md` - This file
- `example-question.md` - Sample architecture question
- `gemini-response.md` - Example response (for reference)
