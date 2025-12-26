# Knowledge Base Index

This directory contains shared knowledge bases available to all projects in the Super Agent workspace.

## Available Knowledge Bases

### Claude-Master-Knowledge
Primary knowledge repository imported from D:\Claude-Master-Knowledge.

**Location**: `01_SHARED_ASSETS/KnowledgeBase/Claude-Master-Knowledge`

**Usage in Projects**:
Projects can reference this knowledge base in their CLAUDE.md files:
```markdown
## Knowledge Base References
- Refer to: ../../01_SHARED_ASSETS/KnowledgeBase/Claude-Master-Knowledge
- Use existing patterns and conventions from the master KB
```

## Adding New Knowledge Bases

1. Place new knowledge bases in this directory
2. Update this INDEX.md with a description
3. Update relevant project CLAUDE.md files to reference the new KB

## Best Practices

- Keep knowledge bases organized by domain or technology
- Document the structure and purpose of each KB
- Reference KBs in project prompts to ensure consistency
- Update KBs when new patterns or conventions are established

## Auto-Import

The setup process automatically imports D:\Claude-Master-Knowledge if present.
To re-import or update, simply re-run the setup script.
