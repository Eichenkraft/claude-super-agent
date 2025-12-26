# Claude Super Agent Workspace

## Multi-AI Efficiency System 🚀

**Achieve 80%+ delegation rate for maximum development velocity!**

A fully local-first workspace implementing **optimal task distribution** across specialized AI tools:

```
Claude Code    → ORCHESTRATION (Coordination, Planning, Decisions)
Codex GPT-5.2  → IMPLEMENTATION (Heavy Coding, Large Tasks) [UNLIMITED]
Gemini CLI     → CONSULTATION (Architecture, Quick Questions) [FAST]
```

**The Strategy**: Right tool for the right job = **3-4x faster development** through specialization!

---

## Quick Start (5 Minutes!)

**New here?** → Read [QUICKSTART.md](QUICKSTART.md) for hands-on tutorial!

**Want the full strategy?** → Read [DELEGATION-STRATEGY.md](DELEGATION-STRATEGY.md)

---

## Overview

This workspace provides:
- **Multi-AI Efficiency System**: 80%+ delegation through smart tool selection
- **Central Orchestrator**: Coordinates projects and delegates optimally
- **Codex Integration**: Unlimited coding capacity for 50+ LOC tasks
- **Gemini Consultation**: Fast architecture advice and error diagnosis
- **Delegation Tracking**: Real-time metrics dashboard for efficiency monitoring
- **Project Management**: Organized structure with templates and sub-agents
- **Knowledge Base**: Integrated Claude Master Knowledge Base
- **Curated Templates**: 30+ templates from awesome-claude-md, superpowers, and awesome-claude-code repos

## Key Features

### ⚡ Delegation Automation
- **delegate_smart.ps1**: Analyzes tasks and recommends optimal tool
- **Auto-brief generation**: One-command Codex brief creation
- **Parallel delegation**: Run Codex + Gemini simultaneously

### 📊 Efficiency Tracking
- **show_delegation_stats.ps1**: Real-time delegation dashboard
- **Delegation logging**: Track every task to measure 80% goal
- **Weekly reports**: Monitor trends and optimize workflow

### 📝 Comprehensive Templates
- **5 Codex Brief Templates**: script-generation, refactoring, new-feature, bug-fix, mcp-server
- **4 Gemini Question Templates**: architecture, error-analysis, performance, security
- **4 Real-World Examples**: Learn from actual delegation workflows

### 🎯 Optimized Thresholds
- **50+ LOC**: Auto-delegate to Codex (lowered from 200 for max efficiency!)
- **3+ files**: Immediate Codex delegation
- **Architecture questions**: Always consult Gemini first

## Workspace Structure

```
D:\CLAUDE SUPER AGENT\
├── 00_ORCHESTRATOR\          # Central orchestrator
│   ├── CLAUDE.md             # Orchestrator system prompt
│   ├── README.md             # Operating notes
│   └── .claude\
│       └── commands\         # Slash commands (delegate_codex, ask_gemini, etc.)
├── 01_SHARED_ASSETS\         # Shared resources
│   ├── External_Repos\       # Cloned repos (awesome-claude-md, superpowers)
│   ├── Skills\               # Global skill library
│   ├── KnowledgeBase\        # Claude-Master-Knowledge (auto-imported)
│   └── Tools\                # Tool wrappers (run_codex.ps1, run_gemini.ps1)
│       └── _logs\            # Execution logs
├── 02_TEMPLATES\             # Project templates
│   ├── curated\              # 22 curated templates
│   └── _manifests\           # Curation metadata
├── 03_PROJECTS\              # Active projects
│   └── Desktop-Expert\       # Windows desktop automation project
│       ├── CLAUDE.md
│       ├── README.md
│       ├── CHANGELOG.md
│       └── _agents\          # Sub-agents (Planner, Builder, Reviewer)
├── 99_SANDBOX\               # Scratch space for experiments
├── setup_env.ps1             # Environment setup script
└── README.md                 # This file
```

## Quick Start

### 1. Run Setup Script

```powershell
cd "D:\CLAUDE SUPER AGENT"
.\setup_env.ps1
```

This will:
- Set `CLAUDE_SUPER_AGENT_ROOT` environment variable
- Load navigation helper functions
- Load tool wrapper functions
- Optionally add to PowerShell profile for auto-load

### 2. Verify Setup

```powershell
ai-help
```

You should see:
- Navigation commands (ai-root, ai-boss, ai-shared, etc.)
- Tool commands (ai-codex, ai-gemini)
- Environment variables

### 3. Explore the Workspace

```powershell
ai-root           # Go to workspace root
ai-boss           # Go to orchestrator
ai-templates      # Browse curated templates
ai-projects       # Browse projects
ai-shared         # Browse shared assets
```

## Core Concepts

### Orchestrator

The **Super-Agent Orchestrator** (`00_ORCHESTRATOR/CLAUDE.md`) is the central coordinator.

**Responsibilities**:
- Create and manage projects
- Spawn sub-agents
- Delegate coding to Codex CLI
- Consult Gemini CLI for analysis
- Maintain workspace organization

**Delegation Rules**:
- **MUST delegate to Codex** when:
  - 4+ files will be modified
  - 200+ LOC will be written
  - Creating new repo/project
  - Developing MCP servers
  - Multi-step integrations
- **MUST consult Gemini** for:
  - Architecture tradeoffs
  - Error diagnosis
  - Alternative approaches
  - Code review insights

### Codex CLI Integration

Codex CLI handles heavy coding tasks.

**Usage**:
```powershell
# From file
ai-codex "path\to\brief.md"

# Inline (for short briefs)
ai-codex "Brief mission: Create hello world at D:\test"
```

**Brief Structure**:
```markdown
# Mission
[One-sentence mission]

# Context
[Background]

# Target Directory
[Absolute path]

# Tech Stack
[Languages, frameworks]

# Entry Points
[Main files]

# Constraints
[Limitations]

# Implementation Plan
1. [Step 1]
2. [Step 2]

# Success Criteria
[How to measure success]

# Risks & Watchouts
[Potential issues]
```

**Logs**: `01_SHARED_ASSETS/Tools/_logs/codex_*.log`

### Gemini CLI Consultation

Gemini CLI provides second opinions and analysis.

**Usage**:
```powershell
ai-gemini "Should I use WebSockets or Server-Sent Events for real-time updates?"
```

**Logs**: `01_SHARED_ASSETS/Tools/_logs/gemini_*.log`

### Projects

Projects live in `03_PROJECTS/` and follow a standard structure:

```
ProjectName/
├── CLAUDE.md           # Project-specific orchestrator prompt
├── README.md           # Project documentation
├── CHANGELOG.md        # Change history
├── PROJECT_BRIEF.md    # High-level goals (optional)
└── _agents/            # Sub-agents
    ├── Planner/
    ├── Builder/
    └── Reviewer/
```

**Creating a Project**:
1. Use the orchestrator: `ai-boss`
2. Ask: "Create a new project for [purpose]"
3. Orchestrator will scaffold structure and copy relevant templates

### Sub-Agents

Sub-agents are specialized Claude instances within a project.

**Common Archetypes**:
- **Planner**: Breaks down tasks, creates implementation plans
- **Builder**: Implements features, writes code
- **Reviewer**: Reviews code, validates quality

**Each agent has**:
- `CLAUDE.md` with role, scope, tools, and escalation rules
- Clear boundaries of responsibility
- Delegation rules (when to use Codex/Gemini)

### Templates

22 curated templates in `02_TEMPLATES/curated/`:

From **awesome-claude-md**:
- Awesome-CLAUDE-Main
- Agent-Claude-MD-Expert
- Agent-Example-Curator
- Agent-Project-Docs-Curator
- Command-Evaluate-Quality
- Command-Sync

From **superpowers**:
- Agent-Code-Reviewer
- Command-Brainstorm
- Command-Execute-Plan
- Command-Write-Plan
- Skill-Brainstorming
- Skill-Dispatching-Parallel-Agents
- Skill-Executing-Plans
- Skill-Finishing-Dev-Branch
- Skill-Receiving-Code-Review
- Skill-Requesting-Code-Review
- Skill-Subagent-Driven-Development
- Skill-Systematic-Debugging
- Skill-Test-Driven-Development
- Skill-Using-Git-Worktrees
- Skill-Using-Superpowers
- Codex-Bootstrap

**Manifest**: `02_TEMPLATES/_manifests/curation-manifest.json`

### Knowledge Base

**Auto-Imported**: `D:\Claude-Master-Knowledge` → `01_SHARED_ASSETS/KnowledgeBase/Claude-Master-Knowledge`

**Usage in Projects**:
Reference in project CLAUDE.md:
```markdown
## Knowledge Base References
- Claude Master KB: ../../01_SHARED_ASSETS/KnowledgeBase/Claude-Master-Knowledge
```

**INDEX**: `01_SHARED_ASSETS/KnowledgeBase/INDEX.md`

### Skills

Skills are reusable prompt modules (`.md` files with YAML frontmatter).

**Format**:
```markdown
---
name: skill-name
description: Brief description
author: Name
version: 1.0.0
tags: [tag1, tag2]
---

# Skill Content
...
```

**Locations**:
- Global: `01_SHARED_ASSETS/Skills/`
- Project: `03_PROJECTS/<Name>/skills/`

## Commands Reference

### Navigation
```powershell
ai-root              # D:\CLAUDE SUPER AGENT
ai-boss              # 00_ORCHESTRATOR
ai-shared            # 01_SHARED_ASSETS
ai-templates         # 02_TEMPLATES
ai-projects          # 03_PROJECTS
ai-project <name>    # 03_PROJECTS/<name>
ai-sandbox           # 99_SANDBOX
```

### Tools
```powershell
ai-codex <brief>     # Delegate to Codex CLI
ai-gemini <question> # Consult Gemini CLI
```

### Help
```powershell
ai-help              # Show all commands
```

## Workflows

### Creating a New Project

1. **Navigate to orchestrator**:
   ```powershell
   ai-boss
   ```

2. **Start Claude Code** and ask:
   > "Create a new project for [purpose]"

3. **Orchestrator will**:
   - Browse templates
   - Create project structure
   - Copy relevant templates
   - Write CLAUDE.md, README, CHANGELOG
   - Set up sub-agents

4. **Navigate to project**:
   ```powershell
   ai-project ProjectName
   ```

### Delegating to Codex

1. **Identify large task** (4+ files or 200+ LOC)

2. **Create brief** following the standard structure

3. **Save brief**: `codex_brief_feature_name.md`

4. **Delegate**:
   ```powershell
   ai-codex "codex_brief_feature_name.md"
   ```

5. **Review logs**: `01_SHARED_ASSETS/Tools/_logs/codex_*.log`

6. **Update CHANGELOG**: Document what was implemented

### Consulting Gemini

1. **Formulate question** with context

2. **Execute**:
   ```powershell
   ai-gemini "Your detailed question here"
   ```

3. **Review response** and logs

4. **Integrate insights** into your decisions

### Developing an MCP Server

1. **Research**: Check existing servers, review MCP docs

2. **Consult Gemini**: "What's the best approach for an MCP server that does X?"

3. **Create Codex brief** (MCP servers are typically 200+ LOC)

4. **Delegate**:
   ```powershell
   ai-codex "mcp_server_brief.md"
   ```

5. **Test**: Integrate with Claude Code

6. **Document**: Update project README and CHANGELOG

## External Repositories

Cloned into `01_SHARED_ASSETS/External_Repos/`:

1. **awesome-claude-md** (https://github.com/josix/awesome-claude-md)
   - Collection of CLAUDE.md examples
   - Agent and command templates

2. **superpowers** (https://github.com/obra/superpowers)
   - Skills and agent patterns
   - Codex integration examples

**Status**: `01_SHARED_ASSETS/External_Repos/CLONE_STATUS.md`

## Existing Projects

### Desktop-Expert

Windows desktop automation and terminal workflows expert.

**Location**: `03_PROJECTS/Desktop-Expert`

**Capabilities**:
- PowerShell scripting
- Windows automation
- MCP server development
- Image generation (super-image-generator)

**Navigate**:
```powershell
ai-project Desktop-Expert
```

## Idempotency

This workspace is designed to be **idempotent**:
- Re-running `setup_env.ps1` is safe
- Folder creation checks for existence
- Git operations check for repos before cloning (will pull if exists)
- No random suffixes or duplicate folders

## Importing Knowledge Base

The setup automatically imports `D:\Claude-Master-Knowledge` if present.

**To re-import or update**:
1. Ensure latest KB is at: `D:\Claude-Master-Knowledge`
2. Delete: `01_SHARED_ASSETS/KnowledgeBase/Claude-Master-Knowledge`
3. Re-run setup or manually copy:
   ```powershell
   Copy-Item -Path "D:\Claude-Master-Knowledge" -Destination "01_SHARED_ASSETS\KnowledgeBase\" -Recurse
   ```

## Best Practices

1. **Let the Orchestrator Coordinate**: Don't manually manage projects; use the orchestrator
2. **Delegate Appropriately**: Use Codex for heavy lifting, Gemini for analysis
3. **Update CHANGELOGs**: Document all changes in project CHANGELOGs
4. **Use Templates**: Browse curated templates before creating new structures
5. **Leverage Sub-Agents**: Use specialized agents for complex projects
6. **Reference KBs**: Check knowledge bases for existing patterns
7. **Keep Work Scoped**: Projects should stay within their directories
8. **Review Logs**: Check Codex/Gemini logs to track delegated work

## Troubleshooting

### Commands Not Found (ai-root, ai-codex, etc.)

Run setup script:
```powershell
cd "D:\CLAUDE SUPER AGENT"
.\setup_env.ps1
```

### Codex CLI Not Found

Install Codex CLI:
```
https://github.com/anthropics/codex
```

### Gemini CLI Not Found

Install Gemini CLI or configure the wrapper script at:
```
01_SHARED_ASSETS\Tools\run_gemini.ps1
```

### Templates Not Found

Ensure external repos are cloned:
```powershell
cd "01_SHARED_ASSETS\External_Repos"
ls
# Should see: awesome-claude-md, superpowers
```

If missing, re-run setup or clone manually.

### Knowledge Base Not Imported

Check if `D:\Claude-Master-Knowledge` exists.
If yes, run:
```powershell
Copy-Item -Path "D:\Claude-Master-Knowledge" -Destination "01_SHARED_ASSETS\KnowledgeBase\" -Recurse
```

## Maintenance

### Update External Repos

```powershell
cd "01_SHARED_ASSETS\External_Repos\awesome-claude-md"
git pull

cd ..\superpowers
git pull
```

### Add New Templates

1. Discover new template
2. Copy to `02_TEMPLATES/curated/<TemplateName>/`
3. Create `SOURCE.txt` with origin info
4. Update `02_TEMPLATES/_manifests/curation-manifest.json`

### Clean Logs

```powershell
cd "01_SHARED_ASSETS\Tools\_logs"
# Review and archive or delete old logs
```

## Security Notes

- **Never commit secrets**: Use environment variables or `.env` files
- **Review Codex briefs**: Ensure no sensitive data in briefs
- **Sandbox mode**: Codex runs with `--sandbox danger-full-access` by default
- **Logs contain execution history**: Protect log files if they contain sensitive info

## Next Steps

1. **Run setup**: `.\setup_env.ps1`
2. **Explore templates**: `ai-templates`
3. **Navigate to orchestrator**: `ai-boss`
4. **Create your first project**: Ask orchestrator to scaffold a new project
5. **Delegate a task**: Create a Codex brief and run `ai-codex`
6. **Consult Gemini**: Ask for architectural advice with `ai-gemini`

## Resources

- **Orchestrator**: `00_ORCHESTRATOR/CLAUDE.md`
- **Templates**: `02_TEMPLATES/curated/`
- **Knowledge Base Index**: `01_SHARED_ASSETS/KnowledgeBase/INDEX.md`
- **External Repos**: `01_SHARED_ASSETS/External_Repos/`
- **Desktop-Expert Project**: `03_PROJECTS/Desktop-Expert/`

## Philosophy

This workspace embodies:
- **Orchestration over micromanagement**: Let the orchestrator coordinate
- **Delegation over DIY**: Use Codex for coding, Gemini for analysis
- **Templates over reinvention**: Reuse curated patterns
- **Projects over chaos**: Organize work into bounded projects
- **Sub-agents over monoliths**: Specialize agents for complex domains
- **Documentation over memory**: Keep CHANGELOGs and READMEs updated

---

**Welcome to the Claude Super Agent Workspace!**

Start with `ai-help` and explore from there.
