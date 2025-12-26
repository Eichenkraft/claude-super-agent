# Orchestrator - Operating Notes

This folder contains the **Super-Agent Orchestrator** configuration for the Claude Super Agent workspace.

## What is the Orchestrator?

The Orchestrator is the central coordinator for this workspace. It's responsible for:
- Creating and managing projects under `03_PROJECTS`
- Spawning and coordinating sub-agents
- Delegating coding work to Codex CLI
- Consulting Gemini CLI for architectural decisions
- Maintaining workspace organization and standards

## Key Files

- **CLAUDE.md**: The orchestrator's system prompt and operating instructions
- **.claude/commands/**: Custom slash commands for common operations

## How to Use

### Starting a New Session

1. Navigate to the workspace root:
   ```powershell
   ai-root
   ```

2. Open a new Claude Code session in the orchestrator folder:
   ```powershell
   ai-boss
   # Then start Claude Code
   ```

3. The orchestrator will read `CLAUDE.md` and operate according to its instructions

### Creating a New Project

The orchestrator will guide you through:
1. Selecting an appropriate template from `02_TEMPLATES/curated`
2. Creating the project structure in `03_PROJECTS/<Name>`
3. Setting up sub-agents (Planner, Builder, Reviewer)
4. Writing initial documentation (CLAUDE.md, README, CHANGELOG)

### Delegating to Codex

When a task requires significant coding (4+ files or 200+ LOC), the orchestrator will:
1. Create a properly formatted Codex brief
2. Save it to a file (e.g., `brief.md`)
3. Execute: `ai-codex path\to\brief.md`
4. Log results to `01_SHARED_ASSETS\Tools\_logs`

### Consulting Gemini

For architectural questions, error analysis, or tradeoff discussions:
1. Orchestrator formulates a question
2. Executes: `ai-gemini "Your question here"`
3. Integrates the response into decision-making

## Logs

All Codex and Gemini executions are logged to:
```
01_SHARED_ASSETS\Tools\_logs\
├── codex_YYYY-MM-DD_HH-mm-ss.log
└── gemini_YYYY-MM-DD_HH-mm-ss.log
```

Review logs to track what was delegated and the outcomes.

## Custom Commands

Create custom slash commands in `.claude/commands/`:
- Each command is a `.md` file
- Contains instructions for the orchestrator
- Can be invoked via `/command-name` in Claude Code

## Workspace Boundaries

The orchestrator operates ONLY within:
```
D:\CLAUDE SUPER AGENT\
```

It will NOT modify files outside this workspace unless explicitly requested.

## Best Practices

1. **Let the Orchestrator Delegate**: Don't manually run Codex/Gemini - let the orchestrator decide when to delegate
2. **Review CLANGELOGs**: Check project CHANGELOGs regularly to track progress
3. **Use Sub-Agents**: For complex projects, work through project-specific sub-agents
4. **Keep Templates Updated**: Add new templates to `02_TEMPLATES/curated` when you create reusable patterns

## Troubleshooting

**Orchestrator isn't delegating to Codex**:
- Check the delegation rules in CLAUDE.md
- Ensure task meets criteria (4+ files or 200+ LOC)

**Codex/Gemini commands not working**:
- Run `setup_env.ps1` to load environment functions
- Verify Codex/Gemini CLIs are installed

**Projects not scaffolding correctly**:
- Check `02_TEMPLATES/curated` has templates
- Verify folder structure matches expected layout

## Next Steps

1. Review `CLAUDE.md` to understand orchestrator behavior
2. Run `ai-help` to see available commands
3. Explore `02_TEMPLATES/curated` to see available templates
4. Check `01_SHARED_ASSETS/KnowledgeBase` for existing knowledge bases
5. Create your first project!

---

For more information, see the workspace root README.md
