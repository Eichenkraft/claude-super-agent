# Error Analysis Question Template

Use this template when consulting Gemini about errors, exceptions, bugs, or unexpected behavior.

---

## Question

[State the error/problem clearly]

**Context:**
- **What I'm trying to do**: [Goal/task]
- **Environment**: [OS, language version, framework]
- **When it occurs**: [Always/Sometimes/Under specific conditions]

**Error Message:**
```
[Paste full error message, stack trace, or log excerpt]
```

**Relevant Code:**
```[language]
[Paste the code section that's causing the error]
```

**What I've tried:**
- [Attempt 1 and result]
- [Attempt 2 and result]
- [Attempt 3 and result]

**Questions for Gemini:**
- What is the root cause of this error?
- Why is this happening?
- What's the recommended fix?
- Are there edge cases I should handle?
- How can I prevent this in the future?

---

## Example Error Analysis Questions

### Example 1: PowerShell Exception
```
I'm getting an error when running a PowerShell script that processes files.

Context:
- Task: Batch rename files in a directory
- Environment: PowerShell 7.4, Windows 11
- When: Happens when processing files with special characters in names

Error Message:
```
Get-ChildItem : Cannot find path 'D:\Files\test[1].txt' because it does not exist.
At line:5 char:12
+ $files = Get-ChildItem -Path $sourcePath -Filter $pattern
+          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
```

Relevant Code:
```powershell
$sourcePath = "D:\Files"
$pattern = "test[*].txt"
$files = Get-ChildItem -Path $sourcePath -Filter $pattern

foreach ($file in $files) {
    Rename-Item -Path $file.FullName -NewName "processed_$($file.Name)"
}
```

What I've tried:
- Escaping brackets with backticks: test`[*`].txt - still fails
- Using -LiteralPath instead of -Path - different error
- Manually testing with single file - works fine

Questions:
- Why does Get-ChildItem fail with bracket patterns?
- What's the correct way to handle special characters in file patterns?
- Should I use regex instead of wildcards?
```

### Example 2: Node.js TypeError
```
My MCP server crashes with a TypeError when processing certain inputs.

Context:
- Building MCP server in Node.js with TypeScript
- Environment: Node.js 20.11, TypeScript 5.3
- When: Only when input contains null values

Error Message:
```
TypeError: Cannot read properties of null (reading 'toString')
    at Server.handleToolCall (index.ts:45:32)
    at processTicksAndRejections (node:internal/process/task_queues:95:5)
```

Relevant Code:
```typescript
async handleToolCall(request: ToolCallRequest): Promise<ToolResponse> {
  const input = request.params.arguments;
  const result = await this.processData(input.value.toString());
  return { content: [{ type: "text", text: result }] };
}
```

What I've tried:
- Adding null check: if (input.value) - but then returns undefined
- Using optional chaining: input.value?.toString() - still crashes later
- Validating schema - schema looks correct

Questions:
- Why is input.value null when schema should prevent it?
- How should MCP servers handle invalid/missing input?
- Is this a schema validation issue or runtime issue?
```

### Example 3: Python Import Error
```
Getting ModuleNotFoundError when importing my own module.

Context:
- Python 3.11, using virtual environment
- Module structure: project/src/utils/helpers.py
- When: Only when running from certain directories

Error Message:
```
ModuleNotFoundError: No module named 'utils'
```

Relevant Code:
```python
# In project/src/main.py
from utils.helpers import process_data

def main():
    result = process_data("test")
    print(result)
```

Directory structure:
```
project/
├── src/
│   ├── main.py
│   └── utils/
│       ├── __init__.py
│       └── helpers.py
└── venv/
```

What I've tried:
- Adding src to PYTHONPATH - works but feels wrong
- Relative imports: from .utils.helpers - SyntaxError
- Running with python -m src.main - different error

Questions:
- What's the correct way to structure Python project imports?
- Should I use absolute or relative imports?
- Do I need a setup.py or pyproject.toml?
```

---

## Tips for Error Analysis Questions

**Include:**
- Full error message (not just first line)
- Stack trace if available
- Minimal reproducible code
- Environment details (versions matter!)
- What you've already tried

**Good Questions:**
- "Why does X happen when Y?"
- "What's the root cause of this error?"
- "How should I properly handle this case?"
- "Is this a bug or misunderstanding on my part?"

**Avoid:**
- Just pasting error without context
- Large code dumps without highlighting relevant parts
- "It doesn't work" without specifics
- Not mentioning what you've tried

**After Gemini's Response:**
- Try the suggested fix
- Ask clarifying questions if needed
- Request alternative solutions if first doesn't work
- Ask about preventing similar errors

---

## Debugging Checklist

Before asking Gemini, verify:
- [ ] Error is reproducible
- [ ] Minimal code example prepared
- [ ] Environment details noted
- [ ] Recent changes identified
- [ ] Basic troubleshooting done (docs, Google)
- [ ] Logs/stack trace captured
