# Create New Sub-Agent

This command guides you through creating a new sub-agent within a project.

## What is a Sub-Agent?

A sub-agent is a specialized Claude instance with a focused role within a project. Each agent has:
- **Specific Responsibility**: A well-defined scope
- **Tools**: Access to Codex, Gemini, and other resources
- **Escalation Rules**: When to delegate or escalate
- **CLAUDE.md**: Its own system prompt

## When to Create a Sub-Agent

Create new sub-agents for:
- **Specialized Domains**: Database management, API design, UI/UX
- **Workflow Stages**: Planning, Implementation, Testing, Deployment
- **Quality Roles**: Code reviewer, security auditor, performance optimizer
- **Integration Points**: External API handler, data processor

## Process

### 1. Identify the Need

Before creating, answer:
- What specific responsibility does this agent have?
- How does it differ from existing agents?
- What decisions will it make autonomously?
- When should it escalate to other agents or the orchestrator?

### 2. Create Agent Folder

```powershell
ai-project ProjectName
mkdir "_agents\AgentName"
```

### 3. Write CLAUDE.md

Create `_agents\AgentName\CLAUDE.md`:

```markdown
# [AgentName] Agent

## Role
[One-sentence description of responsibility]

## Scope

### Responsibilities
- [Primary responsibility 1]
- [Primary responsibility 2]
- [Primary responsibility 3]

### NOT Responsible For
- [Out of scope 1]
- [Out of scope 2]

## Context

### Project
[Brief project context this agent needs]

### Related Agents
- **[OtherAgent1]**: [How they interact]
- **[OtherAgent2]**: [How they interact]

## Available Tools

- **Codex CLI**: Via `ai-codex` for significant coding tasks
- **Gemini CLI**: Via `ai-gemini` for analysis and second opinions
- **Git**: For version control operations
- **[Other Tools]**: [Specific tools for this agent]

## Delegation Rules

### When to Use Codex
- [Criterion 1: e.g., 4+ files or 200+ LOC]
- [Criterion 2: e.g., complex integrations]
- [Criterion 3: e.g., new component creation]

### When to Consult Gemini
- [Scenario 1: e.g., architecture decisions]
- [Scenario 2: e.g., error diagnosis]
- [Scenario 3: e.g., alternative approaches]

### When to Escalate
- **To Orchestrator**: [When this agent is blocked or needs cross-project coordination]
- **To [OtherAgent]**: [When specific expertise is needed]

## Constraints

- [Constraint 1: e.g., Must follow project coding standards]
- [Constraint 2: e.g., Cannot modify files outside project directory]
- [Constraint 3: e.g., Must update CHANGELOG for all changes]

## Workflow

1. [Step 1 of typical workflow]
2. [Step 2]
3. [Step 3]

## Knowledge Base References

- Project KB: [Path to project-specific knowledge]
- Shared KB: ../../01_SHARED_ASSETS/KnowledgeBase/Claude-Master-Knowledge
- Skills: [Relevant skills from shared assets]

## Success Criteria

- [How to measure this agent's success]
- [Quality standards to uphold]

## Notes

- [Important caveats]
- [Common pitfalls to avoid]
```

### 4. Document in Project README

Update `ProjectName/README.md` to list the new agent:

```markdown
## Sub-Agents

- **Planner**: Plans implementation strategies
- **Builder**: Implements features and fixes
- **Reviewer**: Reviews code and validates quality
- **[NewAgent]**: [Description]
```

### 5. Test the Agent

1. Navigate to agent folder:
   ```powershell
   cd _agents\AgentName
   ```

2. Open Claude Code with the agent's CLAUDE.md

3. Give it a test task within its scope

4. Verify it follows delegation rules and constraints

## Common Agent Archetypes

### Planner Agent
```markdown
## Role
Breaks down tasks into actionable implementation plans

## Key Responsibilities
- Analyze requirements
- Create step-by-step plans
- Identify dependencies
- Estimate complexity
```

### Builder Agent
```markdown
## Role
Implements features, writes code, creates tests

## Key Responsibilities
- Write production code
- Create unit and integration tests
- Follow coding standards
- Update documentation
```

### Reviewer Agent
```markdown
## Role
Reviews code quality, validates against requirements

## Key Responsibilities
- Code review for quality and standards
- Security and performance analysis
- Validation against success criteria
- Suggest improvements
```

### Database Agent
```markdown
## Role
Manages all database-related tasks

## Key Responsibilities
- Schema design and migrations
- Query optimization
- Data integrity validation
- Backup and recovery strategies
```

### API Agent
```markdown
## Role
Handles API design and integration

## Key Responsibilities
- API endpoint design
- Request/response validation
- Error handling
- Rate limiting and security
```

## Integration Example

User asks: "Optimize the database queries in this project"

**Orchestrator** recognizes this is a specialized task and routes to **Database Agent**:

1. **Database Agent** analyzes current queries
2. Consults **Gemini** for optimization strategies
3. Creates optimization plan
4. Delegates implementation to **Codex** (if 200+ LOC)
5. Updates **CHANGELOG.md**
6. **Reviewer Agent** validates performance improvements

## Best Practices

1. **Single Responsibility**: Each agent should have ONE clear purpose
2. **Clear Boundaries**: Define what's in scope and out of scope
3. **Escalation Paths**: Document when to ask for help
4. **Tool Access**: Only grant tools the agent actually needs
5. **Context**: Provide just enough context, not everything
6. **Autonomy**: Let agents make decisions within their scope

## Notes

- Don't create too many agents - start with 3-5 core agents
- Agents can share access to the same files
- Use agents to enforce separation of concerns
- Update agent prompts as you learn what works
