# Delegate to Codex CLI

This command helps you create and execute a Codex brief for delegating significant coding tasks.

## When to Use

Delegate to Codex when:
- 4+ files will be modified
- 200+ lines of code will be written
- Creating a new repository or project
- Developing MCP servers or complex integrations
- Multi-step refactoring or architectural changes

## Process

1. **Create a Codex Brief** using this structure:

```markdown
# Mission
[One-sentence mission statement]

# Context
[Why this task exists, background information]

# Target Directory
[Absolute path where work should happen]

# Tech Stack
[Languages, frameworks, libraries, versions]

# Entry Points
[Main files or modules to focus on]

# Constraints
- [Specific limitation 1]
- [Specific limitation 2]

# Implementation Plan
1. [Step 1]
2. [Step 2]

# Success Criteria
- [Criterion 1]
- [Criterion 2]

# Risks & Watchouts
- [Risk 1]
- [Risk 2]
```

2. **Save the brief** to a file (e.g., `codex_brief.md`)

3. **Execute** using the wrapper:
```powershell
ai-codex "path\to\codex_brief.md"
```

Or for short inline briefs:
```powershell
ai-codex "Brief mission: Create hello world script at D:\workspace\test"
```

## Output

- Execution logs saved to: `01_SHARED_ASSETS\Tools\_logs\codex_TIMESTAMP.log`
- Review logs to verify success
- Update project CHANGELOG.md with results

## Example

```powershell
# Navigate to project
ai-project MyProject

# Create brief
# ... write brief to file ...

# Execute
ai-codex ".\codex_brief_new_feature.md"

# Review results
# Check logs and update CHANGELOG
```

## Notes

- Codex runs with `--sandbox danger-full-access` by default
- Ensure brief is clear and comprehensive
- Include all necessary context and constraints
- Specify absolute paths for target directories
