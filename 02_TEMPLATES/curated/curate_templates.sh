#!/bin/bash

REPOS_DIR="/d/CLAUDE SUPER AGENT/01_SHARED_ASSETS/External_Repos"
CURATED_DIR="/d/CLAUDE SUPER AGENT/02_TEMPLATES/curated"
MANIFEST_DIR="/d/CLAUDE SUPER AGENT/02_TEMPLATES/_manifests"

# Initialize manifest
echo '{"templates": [], "curated_at": "'$(date -u +"%Y-%m-%dT%H:%M:%SZ")'"}' > "$MANIFEST_DIR/curation-manifest.json"

curate_template() {
    local name="$1"
    local source_repo="$2"
    local source_path="$3"
    local files="$4"
    
    echo "Curating: $name"
    mkdir -p "$CURATED_DIR/$name"
    
    # Copy files
    IFS='|' read -ra FILE_ARRAY <<< "$files"
    for file in "${FILE_ARRAY[@]}"; do
        full_path="$REPOS_DIR/$source_repo/$source_path/$file"
        if [ -f "$full_path" ]; then
            cp "$full_path" "$CURATED_DIR/$name/"
            echo "  ✓ Copied: $file"
        fi
    done
    
    # Create SOURCE.txt
    echo "Source Repository: $source_repo" > "$CURATED_DIR/$name/SOURCE.txt"
    echo "Original Path: $source_path" >> "$CURATED_DIR/$name/SOURCE.txt"
    echo "Curated: $(date -u +"%Y-%m-%d %H:%M:%S UTC")" >> "$CURATED_DIR/$name/SOURCE.txt"
}

# awesome-claude-md templates
curate_template "Awesome-CLAUDE-Main" "awesome-claude-md" "." "CLAUDE.md"
curate_template "Agent-Claude-MD-Expert" "awesome-claude-md" ".claude/agents" "claude-md-expert.md"
curate_template "Agent-Example-Curator" "awesome-claude-md" ".claude/agents" "example-curator.md"
curate_template "Agent-Project-Docs-Curator" "awesome-claude-md" ".claude/agents" "project-docs-curator.md"
curate_template "Command-Evaluate-Quality" "awesome-claude-md" ".claude/commands" "evaluate-quality.md"
curate_template "Command-Sync" "awesome-claude-md" ".claude/commands" "sync.md"

# superpowers templates - agents
curate_template "Agent-Code-Reviewer" "superpowers" "agents" "code-reviewer.md"

# superpowers templates - commands
curate_template "Command-Brainstorm" "superpowers" "commands" "brainstorm.md"
curate_template "Command-Execute-Plan" "superpowers" "commands" "execute-plan.md"
curate_template "Command-Write-Plan" "superpowers" "commands" "write-plan.md"

# superpowers templates - skills
curate_template "Skill-Brainstorming" "superpowers" "skills/brainstorming" "SKILL.md"
curate_template "Skill-Dispatching-Parallel-Agents" "superpowers" "skills/dispatching-parallel-agents" "SKILL.md"
curate_template "Skill-Executing-Plans" "superpowers" "skills/executing-plans" "SKILL.md"
curate_template "Skill-Finishing-Dev-Branch" "superpowers" "skills/finishing-a-development-branch" "SKILL.md"
curate_template "Skill-Receiving-Code-Review" "superpowers" "skills/receiving-code-review" "SKILL.md"
curate_template "Skill-Requesting-Code-Review" "superpowers" "skills/requesting-code-review" "SKILL.md|code-reviewer.md"
curate_template "Skill-Subagent-Driven-Development" "superpowers" "skills/subagent-driven-development" "SKILL.md|implementer-prompt.md|spec-reviewer-prompt.md|code-quality-reviewer-prompt.md"
curate_template "Skill-Systematic-Debugging" "superpowers" "skills/systematic-debugging" "SKILL.md|root-cause-tracing.md|defense-in-depth.md|condition-based-waiting.md"
curate_template "Skill-Test-Driven-Development" "superpowers" "skills/test-driven-development" "SKILL.md|testing-anti-patterns.md"
curate_template "Skill-Using-Git-Worktrees" "superpowers" "skills/using-git-worktrees" "SKILL.md"
curate_template "Skill-Using-Superpowers" "superpowers" "skills/using-superpowers" "SKILL.md"

# superpowers bootstrap
curate_template "Codex-Bootstrap" "superpowers" ".codex" "superpowers-bootstrap.md|INSTALL.md"

echo ""
echo "✓ Template curation complete!"
