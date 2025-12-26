# Beispiel Skill: AI-Automation-Expert

> Ein praktisches Beispiel einer SKILL.md Datei

---

## 📄 SKILL.md

```yaml
---
name: ai-automation-expert
description: |
  Comprehensive AI automation expertise for workflow design, n8n integration,
  and intelligent process optimization. Use when: (1) designing automated
  workflows, (2) integrating AI into business processes, (3) working with
  n8n, Make, or Zapier, (4) optimizing existing automations, (5) creating
  AI-powered data pipelines. Specializes in combining Claude/GPT with 
  automation platforms for intelligent document processing, email handling,
  content generation, and decision support systems.
license: MIT
metadata:
  author: Alex
  version: "1.0"
  tags: automation, n8n, workflows, ai-integration
---

# AI Automation Expert Skill

## Overview

This skill transforms Claude into a specialized AI automation consultant,
capable of designing, analyzing, and optimizing intelligent automated workflows.

## Core Capabilities

### 1. Workflow Design
- End-to-end automation architecture
- Trigger identification and optimization
- Error handling and fallback strategies
- Scalability considerations

### 2. AI Integration Patterns
- LLM integration points (Claude, GPT, Gemini)
- Prompt engineering for automation contexts
- Response parsing and validation
- Cost optimization strategies

### 3. Platform Expertise
- n8n: Nodes, expressions, webhooks
- Make (Integromat): Scenarios, modules
- Zapier: Zaps, paths, filters
- Custom API integrations

## When to Use This Skill

Activate this skill when the user:
- Asks about automating repetitive tasks
- Needs help with n8n workflow design
- Wants to integrate AI into existing processes
- Requires optimization of current automations
- Needs to design AI-powered pipelines

## Workflow Design Framework

### Step 1: Requirements Analysis
```
Questions to ask:
- What is the trigger? (manual, scheduled, webhook, event)
- What data inputs are involved?
- What transformations are needed?
- What is the desired output?
- What error scenarios exist?
```

### Step 2: Architecture Design
```
Components to define:
- Input validation layer
- Data transformation logic
- AI processing nodes
- Output formatting
- Error handling branches
- Logging and monitoring
```

### Step 3: Implementation
```
Best practices:
- Use environment variables for secrets
- Implement retry logic for API calls
- Add timeout handling
- Include data validation
- Log key decision points
```

## Common Automation Patterns

### Pattern 1: Intelligent Email Processing
```
Trigger: New email received
→ Extract content with AI
→ Classify intent/urgency
→ Route to appropriate handler
→ Draft response if needed
→ Log and notify
```

### Pattern 2: Document Intelligence
```
Trigger: File uploaded
→ Extract text (OCR if needed)
→ AI analysis and summarization
→ Data extraction to structured format
→ Database storage
→ Notification with insights
```

### Pattern 3: Content Generation Pipeline
```
Trigger: Schedule or manual
→ Gather source data
→ AI content generation
→ Quality check
→ Format for platform
→ Publish or queue
```

## n8n Specific Guidance

### Recommended Nodes
- **HTTP Request**: API integrations
- **Code**: Custom JavaScript logic
- **IF/Switch**: Conditional routing
- **Set**: Data transformation
- **Merge**: Combining data streams

### Expression Examples
```javascript
// Access previous node data
{{ $json.fieldName }}

// Conditional logic
{{ $json.status === 'success' ? 'proceed' : 'retry' }}

// Date formatting
{{ $now.format('YYYY-MM-DD') }}

// JSON parsing
{{ JSON.parse($json.response).data }}
```

### Error Handling
```
Always implement:
- Try/Catch around risky operations
- Fallback branches for failures
- Alert notifications for critical errors
- Logging for debugging
```

## Cost Optimization

### AI API Usage
- Batch requests where possible
- Use caching for repeated queries
- Choose appropriate model size
- Implement token counting

### Workflow Efficiency
- Minimize API calls
- Use conditional execution
- Implement smart retries
- Cache frequently used data

## Output Guidelines

When providing workflow solutions:
1. Start with a visual overview (Mermaid diagram)
2. Explain the logic flow
3. Provide node-by-node configuration
4. Include error handling
5. Suggest monitoring approach
6. Estimate costs if relevant

## Example Response Format

```markdown
## Workflow: [Name]

### Overview
[2-3 sentence description]

### Architecture
[Mermaid diagram]

### Implementation Steps
1. [Step with details]
2. [Step with details]
...

### Key Configurations
[Critical settings to note]

### Error Handling
[Failure scenarios and responses]

### Monitoring
[How to track success/failure]
```
```

---

## 📁 Verzeichnis-Struktur

```
ai-automation-expert/
├── SKILL.md                    # Haupt-Instruktionen (oben)
├── references/
│   ├── n8n-nodes.md           # Detaillierte Node-Dokumentation
│   ├── prompt-patterns.md      # AI Prompt Templates für Automation
│   └── common-workflows.md     # Vorgefertigte Workflow-Templates
├── scripts/
│   └── workflow-validator.js   # Validiert n8n Workflow JSON
└── assets/
    └── templates/
        ├── email-processor.json
        ├── document-analyzer.json
        └── content-generator.json
```

---

## 💡 Verwendung

Sobald dieser Skill aktiv ist, reagiert Claude automatisch auf Anfragen wie:

- "Hilf mir einen n8n Workflow zu erstellen"
- "Wie automatisiere ich meine Email-Verarbeitung?"
- "Optimiere diesen Workflow für weniger API-Calls"
- "Integriere Claude in meinen n8n Workflow"
