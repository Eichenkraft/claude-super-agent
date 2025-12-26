# Mission
Create an MCP (Model Context Protocol) server that provides [primary capability/resource] to Claude Code.

# Context
[Why this MCP server is needed - what problem it solves, what resources it exposes]

MCP servers enable Claude to:
- Access external tools and data sources
- Perform actions on the user's behalf
- Integrate with services and APIs
- Extend capabilities beyond built-in tools

This server will provide:
- [Capability 1]
- [Capability 2]
- [Capability 3]

# Target Directory
[Absolute path where MCP server should be created]
Example: D:\CLAUDE SUPER AGENT\03_PROJECTS\ProjectName\mcp-servers\server-name

# Tech Stack
- **Runtime**: Node.js 18+ / Python 3.11+ (choose based on requirements)
- **MCP SDK**: @modelcontextprotocol/sdk (Node.js) or mcp (Python)
- **Language**: TypeScript / Python
- **Dependencies**: [List required packages]
- **External APIs**: [APIs this server will integrate with]
- **Authentication**: [API keys, OAuth, etc.]

# Entry Points
- **Main Server**: index.ts / server.py
- **Configuration**: .env (for API keys/secrets)
- **Package Files**: package.json / requirements.txt
- **README**: Usage and setup instructions
- **Claude Config**: mcp_config.json (for Claude Code integration)

# Constraints
- **MCP Protocol**: Must follow MCP specification exactly
- **Error Handling**: Graceful handling of API failures
- **Authentication**: Secure handling of API keys (env vars, not hardcoded!)
- **Rate Limiting**: Respect API rate limits
- **Logging**: Clear logging for debugging
- **Documentation**: Complete usage docs for users
- **Testing**: Manual testing with Claude Code integration
- **Security**: Validate inputs, sanitize outputs

# Implementation Plan
1. **Setup**:
   - Initialize project (npm init / pip venv)
   - Install MCP SDK and dependencies
   - Set up TypeScript/Python environment
   - Create .env.example for configuration

2. **Server Structure**:
   - Import MCP SDK
   - Set up server initialization
   - Define server metadata (name, version)

3. **Resources** (if applicable):
   - Define resource types (uri, name, mimeType)
   - Implement resource handlers
   - Add resource listing

4. **Tools** (if applicable):
   - Define tool schemas (name, description, inputSchema)
   - Implement tool handlers
   - Add validation for tool inputs

5. **Prompts** (if applicable):
   - Define prompt templates
   - Add prompt arguments
   - Implement prompt handlers

6. **Error Handling**:
   - Wrap API calls in try/catch
   - Return meaningful error messages
   - Log errors for debugging

7. **Testing**:
   - Test each tool/resource independently
   - Test error cases
   - Integrate with Claude Code and test end-to-end

8. **Documentation**:
   - README with setup instructions
   - Example usage scenarios
   - Claude Code integration guide
   - API key configuration

# Success Criteria
- Server starts without errors
- Implements MCP protocol correctly
- All tools/resources work as expected
- Integrates successfully with Claude Code
- Error handling is comprehensive
- Documentation is clear and complete
- API keys are handled securely
- No hardcoded secrets
- Logging helps with debugging

# Risks & Watchouts
- **MCP Protocol Compliance**: Must strictly follow MCP spec
- **API Rate Limits**: Implement backoff/retry logic
- **Authentication**: Secure storage of credentials
- **Error Messages**: Don't leak sensitive info in errors
- **Performance**: API calls might be slow, handle timeouts
- **Versioning**: Consider version compatibility with MCP SDK
- **Dependencies**: Keep dependencies minimal and updated

---

## MCP Server Checklist

Before marking server complete:
- [ ] Server structure follows MCP spec
- [ ] All tools/resources implemented
- [ ] Error handling comprehensive
- [ ] API keys in .env (not hardcoded!)
- [ ] Logging implemented
- [ ] README with setup instructions
- [ ] Tested with Claude Code integration
- [ ] .env.example provided
- [ ] package.json/requirements.txt complete
- [ ] CHANGELOG entry added

## MCP Integration Steps

1. **Development**:
   ```bash
   # Node.js
   npm install
   npm run build
   npm run dev

   # Python
   python -m venv venv
   source venv/bin/activate  # or venv\Scripts\activate on Windows
   pip install -r requirements.txt
   python server.py
   ```

2. **Claude Code Config**:
   Add to Claude Code's MCP settings:
   ```json
   {
     "mcpServers": {
       "server-name": {
         "command": "node",
         "args": ["path/to/server/build/index.js"],
         "env": {
           "API_KEY": "your-api-key"
         }
       }
     }
   }
   ```

3. **Testing**:
   - Restart Claude Code
   - Verify server appears in MCP list
   - Test each tool/resource

## Server Template Structure

```
mcp-server-name/
├── src/
│   └── index.ts (or server.py)
├── .env.example
├── .gitignore
├── package.json (or requirements.txt)
├── tsconfig.json (if TypeScript)
├── README.md
└── CHANGELOG.md
```

## Common MCP Patterns

**Tools**: For actions (write, delete, execute)
**Resources**: For read-only data (files, API responses)
**Prompts**: For templated interactions

Choose based on what your server provides!
