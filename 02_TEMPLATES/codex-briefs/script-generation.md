# Mission
Create a [PowerShell/Python/Node.js] script that [primary function/goal].

# Context
[Why this script is needed - background information]

Example scenarios:
- Automation of recurring tasks
- System administration workflow
- Data processing pipeline
- Integration between tools

# Target Directory
[Absolute path where script should be created]
Example: D:\CLAUDE SUPER AGENT\03_PROJECTS\ProjectName\scripts

# Tech Stack
- **Primary Language**: [PowerShell 7+ / Python 3.11+ / Node.js 18+]
- **Dependencies**: [List libraries, modules, packages needed]
- **Platform**: [Windows / Cross-platform]
- **Runtime Requirements**: [.NET, Python venv, npm packages, etc.]

# Entry Points
- **Main Script**: [script-name.ps1 / script.py / script.js]
- **Config File**: [Optional: config.json, .env, settings.yml]
- **Output Directory**: [Where results should be saved]

# Constraints
- **Error Handling**: Must handle errors gracefully with try/catch
- **Encoding**: UTF-8 for all text files
- **Parameters**: Support command-line arguments via param() block
- **Logging**: Log important operations to console and/or file
- **Idempotency**: Safe to re-run without side effects
- **Security**: No hardcoded secrets - use environment variables

# Implementation Plan
1. **Setup**:
   - Create script file structure
   - Set up parameter block with help comments
   - Initialize error handling and encoding

2. **Core Logic**:
   - [Step 2: Main functionality]
   - [Step 3: Processing logic]
   - [Step 4: Output generation]

3. **Error Handling**:
   - Validate inputs
   - Handle edge cases
   - Provide clear error messages

4. **Documentation**:
   - Add inline comments for complex logic
   - Create usage examples
   - Document all parameters

5. **Testing**:
   - Test with valid inputs
   - Test error cases
   - Verify output format

# Success Criteria
- Script executes without errors
- Produces expected output
- Parameters work as documented
- Error handling catches edge cases
- Code follows language best practices
- Documentation is clear and complete

# Risks & Watchouts
- **Path handling**: Ensure cross-platform compatibility if needed
- **Permissions**: Script may need elevated privileges
- **Dependencies**: Verify all required modules are available
- **Input validation**: Sanitize user inputs to prevent injection
- **File operations**: Handle file locks and concurrent access

---

## Usage Example

After creation, script should be usable like:

```powershell
# PowerShell
.\script-name.ps1 -Parameter1 "value" -Parameter2 "value"
```

```python
# Python
python script.py --parameter1 value --parameter2 value
```

```bash
# Node.js
node script.js --parameter1 value --parameter2 value
```

## Template Notes

- Fill in all [bracketed placeholders]
- Adjust sections based on actual requirements
- Add project-specific constraints as needed
- Consider security and performance from the start
