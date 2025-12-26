# Ask Gemini for Second Opinion

This command helps you consult Gemini CLI for architectural advice, error analysis, or alternative approaches.

## When to Use

Consult Gemini for:
- **Architecture tradeoffs**: "Should I use WebSockets or Server-Sent Events?"
- **Error diagnosis**: "Why am I getting this error? [paste error]"
- **Alternative approaches**: "What are other ways to implement this feature?"
- **Code review insights**: "Are there edge cases I'm missing in this design?"
- **Best practices**: "What's the recommended pattern for this use case?"

## Process

1. **Formulate a clear question**

2. **Execute** using the wrapper:

```powershell
# Inline question
ai-gemini "What are the pros and cons of using Redis vs in-memory caching for session storage?"

# From file
ai-gemini "path\to\question.md"
```

## Output

- Results displayed in console
- Execution logs saved to: `01_SHARED_ASSETS\Tools\_logs\gemini_TIMESTAMP.log`
- Review and incorporate insights into your decision-making

## Example Workflows

### Architecture Decision
```powershell
ai-gemini "I'm building a real-time collaboration app. Should I use WebSockets, SSE, or long polling? Consider: scalability, browser support, and implementation complexity."
```

### Error Troubleshooting
```powershell
ai-gemini "I'm getting 'Cannot read property of undefined' in my React component when accessing state.user.name. The state is initialized as empty object. What's the best way to handle this?"
```

### Design Review
```powershell
ai-gemini "I'm designing an API rate limiter. Considering: token bucket, leaky bucket, and fixed window. What are the tradeoffs? Which is best for a multi-tenant SaaS?"
```

### Alternative Approaches
```powershell
ai-gemini "I need to process 10K records from a CSV file. Currently using synchronous loops. What are more efficient approaches in Node.js?"
```

## Integration with Workflow

1. **Before Delegating to Codex**: Ask Gemini to validate architectural approach
2. **After Codex Execution**: Ask Gemini to review the implementation for edge cases
3. **During Debugging**: Get Gemini's analysis of error messages
4. **For Refactoring**: Consult Gemini on alternative patterns

## Notes

- Be specific in your questions
- Provide relevant context (tech stack, constraints, goals)
- Use for analysis, not execution
- Document decisions in project CHANGELOG or design docs
