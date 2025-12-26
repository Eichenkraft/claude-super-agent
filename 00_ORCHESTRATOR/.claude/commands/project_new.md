# Create New Project

This command guides you through creating a new project in the workspace.

## Process

### 1. Plan the Project

Before creating, consider:
- **Purpose**: What problem does this solve?
- **Scope**: What's included/excluded?
- **Tech Stack**: Languages, frameworks, tools?
- **Constraints**: Time, resources, compatibility?

### 2. Choose a Template

Browse available templates:
```powershell
ai-templates
ls curated\
```

Available template types:
- Agent templates (sub-agent patterns)
- Command templates (workflow commands)
- Skill templates (reusable capabilities)
- Project CLAUDEs (orchestrator patterns)

### 3. Create Project Structure

```powershell
ai-projects
mkdir "ProjectName"
mkdir "ProjectName\_agents\Planner"
mkdir "ProjectName\_agents\Builder"
mkdir "ProjectName\_agents\Reviewer"
```

### 4. Copy Template

If a matching template exists:
```powershell
copy "..\02_TEMPLATES\curated\TemplateName\*" "ProjectName\"
```

If no exact match, copy the most similar one and customize.

### 5. Write Core Files

#### CLAUDE.md (Project Orchestrator)
```markdown
# ProjectName

## Purpose
[What this project does]

## Scope
[What's included and excluded]

## Tech Stack
[Languages, frameworks, versions]

## Entry Points
[Main files to start from]

## Codex Delegation Rules
- Delegate when: [criteria]
- Handle directly when: [criteria]

## Gemini Consultation
- Use for: [architectural decisions, etc.]

## Knowledge Base References
- Claude Master KB: ../../01_SHARED_ASSETS/KnowledgeBase/Claude-Master-Knowledge
- [Other KBs]

## Constraints
- [Constraint 1]
- [Constraint 2]

## Success Criteria
- [Criterion 1]
- [Criterion 2]
```

#### PROJECT_BRIEF.md
```markdown
# ProjectName Brief

## Goal
[High-level objective]

## Target Users
[Who will use this]

## Key Features
- [Feature 1]
- [Feature 2]

## Out of Scope
- [What's NOT included]

## Success Metrics
- [Metric 1]
- [Metric 2]
```

#### CHANGELOG.md
```markdown
# Changelog

## [Unreleased]
### Added
- Project scaffolding
- Initial documentation
```

#### README.md
```markdown
# ProjectName

[Brief description]

## Setup
1. [Step 1]
2. [Step 2]

## Usage
[How to use]

## Development
[How to contribute/modify]

## Commands
- `ai-project ProjectName` - Navigate to this project
- [Other commands]
```

### 6. Create Sub-Agents

For each agent (Planner, Builder, Reviewer), create `CLAUDE.md`:

```markdown
# [AgentName] Agent

## Role
[Specific responsibility]

## Scope
- [Responsibility 1]
- [Responsibility 2]

## Tools
- Codex CLI (via ai-codex)
- Gemini CLI (via ai-gemini)

## Delegation Rules
- Codex: [When to delegate]
- Gemini: [When to consult]
- Escalate: [When to escalate to orchestrator]

## Workflow
1. [Step 1]
2. [Step 2]
```

### 7. Initialize Git (Optional)

```powershell
cd ProjectName
git init
git add .
git commit -m "Initial project scaffolding"
```

## Example: Creating a Web Scraper Project

```powershell
# Navigate to projects
ai-projects

# Create structure
mkdir "WebScraper"
mkdir "WebScraper\_agents\Planner"
mkdir "WebScraper\_agents\Builder"
mkdir "WebScraper\_agents\Reviewer"

# Copy relevant template (if exists)
copy "..\02_TEMPLATES\curated\Skill-Systematic-Debugging\SKILL.md" "WebScraper\skills\"

# Write CLAUDE.md
# ... (see structure above, customize for web scraping)

# Write other files
# ... PROJECT_BRIEF, CHANGELOG, README

# Create agent prompts
# ... in _agents folders

# Update workspace CHANGELOG (optional)
ai-root
# Add entry to root CHANGELOG if tracking workspace changes
```

## After Creation

1. **Test Navigation**:
   ```powershell
   ai-project ProjectName
   ```

2. **Start Working**:
   Open Claude Code in the project folder and begin development

3. **Update CHANGELOG**:
   After each significant change, update `CHANGELOG.md`

4. **Delegate Appropriately**:
   Use `ai-codex` for heavy coding, `ai-gemini` for analysis

## Notes

- Keep projects focused and bounded
- Use templates to maintain consistency
- Document decisions in PROJECT_BRIEF or design docs
- Leverage sub-agents for complex projects
- Reference shared KBs and skills for reusability
