# Desktop-Expert

Windows desktop automation and terminal workflows expert.

## Overview

This project contains automation scripts, tools, and MCP servers for Windows desktop operations, PowerShell workflows, and system integrations.

## Quick Start

### 1. Setup Environment

Run the workspace setup script (from workspace root):
```powershell
D:\CLAUDE SUPER AGENT\setup_env.ps1
```

This loads navigation helpers and tool commands.

### 2. Navigate to Project

```powershell
ai-project Desktop-Expert
```

### 3. Start Working

Open Claude Code in this directory. The agent will read `CLAUDE.md` and operate as the Desktop-Expert.

## Project Structure

```
Desktop-Expert/
├── CLAUDE.md           # Agent system prompt
├── README.md           # This file
├── CHANGELOG.md        # Change history
├── scripts/            # Automation scripts
├── mcp/               # MCP servers
├── tools/             # Utility programs
├── configs/           # Configuration files
├── images/            # Generated images
├── docs/              # Documentation
├── skills/            # Reusable skills
└── _agents/           # Sub-agents (if needed)
```

## Key Capabilities

### Windows Automation
- File and folder operations
- Process management
- System configuration
- Registry management
- Scheduled tasks

### PowerShell Scripting
- Cmdlet development
- Module creation
- Pipeline processing
- Error handling patterns

### MCP Server Development
- Custom tools for Claude Code
- Desktop API integrations
- System monitoring servers

### Image Generation
- Replicate API integration via super-image-generator
- Default model: flux-2-pro
- Sequence generation with reference images

## Common Commands

### Navigation
```powershell
ai-project Desktop-Expert    # Go to this project
ai-shared                    # Go to shared assets
ai-templates                 # Browse templates
```

### Delegation
```powershell
# For large coding tasks (4+ files or 200+ LOC)
ai-codex "path\to\brief.md"

# For architectural questions
ai-gemini "Should I use COM or .NET for this Windows API call?"
```

### Running Scripts
```powershell
# Execute a PowerShell script
.\scripts\script-name.ps1 -Parameter Value

# With admin privileges (if needed)
Start-Process powershell -Verb runAs -ArgumentList "-File .\scripts\script-name.ps1"
```

## Development Workflow

### Creating a New Script

1. **Plan**: Define inputs, outputs, steps
2. **Implement**:
   - If < 50 LOC and simple: write directly
   - If 4+ files or 200+ LOC: create Codex brief and delegate
3. **Test**: Run script with various inputs
4. **Document**: Update CHANGELOG.md and this README
5. **Commit** (if using git)

### Creating an MCP Server

1. **Research**: Check existing servers, review MCP docs
2. **Design**: Plan server capabilities and tools
3. **Brief**: Create Codex brief (MCP servers are typically 200+ LOC)
4. **Delegate**: `ai-codex "mcp_brief.md"`
5. **Test**: Integrate with Claude Code
6. **Document**: Add usage instructions

## Tools & Logs

### Codex Execution Logs
Location: `../../01_SHARED_ASSETS/Tools/_logs/codex_*.log`

Review logs to see what Codex executed and results.

### Gemini Consultation Logs
Location: `../../01_SHARED_ASSETS/Tools/_logs/gemini_*.log`

Review logs for architectural advice and analysis.

## Best Practices

1. **PowerShell-First**: Use native PowerShell cmdlets, not bash aliases
2. **Error Handling**: Always use try-catch blocks
3. **UTF-8 Encoding**: Set `$OutputEncoding = [System.Text.Encoding]::UTF8`
4. **Idempotency**: Scripts should be safe to re-run
5. **No Hardcoded Secrets**: Use environment variables or .env files
6. **Document Changes**: Update CHANGELOG.md
7. **Test Before Committing**: Ensure scripts work as expected

## Knowledge Base

This project references:
- **Claude Master KB**: `../../01_SHARED_ASSETS/KnowledgeBase/Claude-Master-Knowledge`

Check the KB for existing patterns, scripts, and conventions before creating new ones.

## Troubleshooting

### Script Execution Policy Error
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Codex/Gemini Commands Not Found
Run the setup script:
```powershell
D:\CLAUDE SUPER AGENT\setup_env.ps1
```

### Permission Denied
Run PowerShell as Administrator or adjust file permissions.

### UTF-8 Encoding Issues
Ensure scripts start with:
```powershell
$OutputEncoding = [System.Text.Encoding]::UTF8
```

## Resources

- **Orchestrator Docs**: `../../00_ORCHESTRATOR/README.md`
- **Templates**: `../../02_TEMPLATES/curated/`
- **Shared Skills**: `../../01_SHARED_ASSETS/Skills/`
- **External Repos**: `../../01_SHARED_ASSETS/External_Repos/`

## Contributing

1. Create a new branch for features
2. Follow PowerShell best practices
3. Update CHANGELOG.md
4. Test thoroughly
5. Document in this README

## License

[Specify license if applicable]

## Contact

[Your contact information or project maintainer]

---

**Tip**: Type `ai-help` in PowerShell to see all available workspace commands.
