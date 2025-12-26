# Security Question Template

Use this template when consulting Gemini about security concerns, vulnerabilities, or best practices.

---

## Question

[State your security concern or question clearly]

**Context:**
- **What I'm building**: [Application/system description]
- **Security Concern**: [Specific security aspect]
- **Threat Model**: [Who/what are you protecting against]
- **Data Sensitivity**: [Public/Internal/Confidential/PII]
- **Compliance**: [Any regulatory requirements - GDPR, HIPAA, etc.]

**Current Implementation:**
```[language]
[Code showing current approach]
```

**Security Questions:**
- Is this approach secure?
- What vulnerabilities exist?
- How should I properly implement [security feature]?
- What are best practices for [security concern]?
- Am I handling [sensitive data] correctly?

---

## Example Security Questions

### Example 1: API Key Storage
```
How should I securely store API keys in my PowerShell automation scripts?

Context:
- Building: Windows automation scripts using external APIs
- Security Concern: API keys currently hardcoded in scripts
- Threat Model: Scripts shared with team, version controlled
- Data Sensitivity: API keys grant full access to paid services
- Compliance: No specific requirements but company best practices

Current Implementation:
```powershell
# Currently doing this (BAD!):
$apiKey = "sk-1234567890abcdef"
$headers = @{ "Authorization" = "Bearer $apiKey" }
Invoke-RestMethod -Uri $apiUrl -Headers $headers
```

Options I'm considering:
1. Environment variables
2. Encrypted config files
3. Windows Credential Manager
4. Azure Key Vault

Questions:
- Which approach is most secure for local automation?
- How do I handle key rotation?
- Should I encrypt environment variables?
- What about sharing scripts with team members?
```

### Example 2: Input Validation
```
Am I properly validating user input to prevent injection attacks?

Context:
- Building: MCP server that executes PowerShell commands
- Security Concern: User input could contain malicious commands
- Threat Model: Malicious/untrusted input from external sources
- Data Sensitivity: Server has file system access
- Compliance: Standard security best practices

Current Implementation:
```typescript
async executePowerShell(command: string): Promise<string> {
  // Sanitizing by removing dangerous characters
  const sanitized = command.replace(/[;&|`$]/g, '');

  const result = await exec(`powershell.exe -Command "${sanitized}"`);
  return result.stdout;
}
```

Concerns:
- Is removing special characters sufficient?
- Could there be other injection vectors?
- Should I use allowlist instead of blocklist?
- Is there a safer way to execute commands?

Questions:
- What attacks is this vulnerable to?
- How should I properly validate PowerShell commands?
- Should I use a sandboxed execution environment?
- Are there alternatives to exec() that are safer?
```

### Example 3: Authentication Flow
```
Is my authentication implementation secure?

Context:
- Building: Web API with user authentication
- Security Concern: Implementing JWT-based auth
- Threat Model: Public-facing API, protection against unauthorized access
- Data Sensitivity: User accounts and personal data
- Compliance: GDPR (EU users)

Current Implementation:
```javascript
// Login endpoint
app.post('/api/login', async (req, res) => {
  const { username, password } = req.body;

  // Query database
  const user = await db.query(
    `SELECT * FROM users WHERE username = '${username}' AND password = '${password}'`
  );

  if (user) {
    const token = jwt.sign({ userId: user.id }, 'secret-key');
    res.json({ token });
  } else {
    res.status(401).json({ error: 'Invalid credentials' });
  }
});
```

Concerns:
- SQL injection risk in query?
- Storing passwords in plain text?
- Weak JWT secret?
- No rate limiting for brute force?

Questions:
- What are the major vulnerabilities here?
- How should I properly hash passwords?
- How do I prevent SQL injection?
- What's a secure JWT implementation?
- Should I implement 2FA?
```

### Example 4: File Upload Security
```
How do I securely handle file uploads?

Context:
- Building: Document management system
- Security Concern: Users uploading arbitrary files
- Threat Model: Malicious files (viruses, scripts, exploits)
- Data Sensitivity: Mixed (business documents)
- Compliance: Standard corporate security policy

Current Implementation:
```python
@app.route('/upload', methods=['POST'])
def upload_file():
    file = request.files['file']
    filename = file.filename

    # Save to upload directory
    file.save(f'/uploads/{filename}')

    return {'success': True, 'path': f'/uploads/{filename}'}
```

Concerns:
- Path traversal attacks (../../etc/passwd)?
- Malicious file execution?
- File type validation?
- File size limits?

Questions:
- What are the security risks with this code?
- How should I validate file types safely?
- Should I sanitize filenames?
- How do I prevent path traversal?
- Where should I store uploaded files?
- Do I need virus scanning?
```

---

## Common Security Topics

### Authentication & Authorization
- Password hashing and storage
- Session management
- Token-based auth (JWT, OAuth)
- API key management
- Multi-factor authentication

### Input Validation
- SQL injection prevention
- Command injection prevention
- Cross-site scripting (XSS)
- Path traversal
- XML/JSON injection

### Data Protection
- Encryption at rest
- Encryption in transit (TLS)
- Sensitive data handling
- Secrets management
- Key rotation

### API Security
- Rate limiting
- CORS configuration
- Authentication middleware
- Request validation
- Error message information leakage

---

## Tips for Security Questions

**Include:**
- Current implementation (even if you know it's wrong)
- What you're trying to protect
- Who/what you're protecting against
- Regulatory requirements if any
- Specific concerns you have

**Good Questions:**
- "Is this approach secure against [specific attack]?"
- "How should I properly implement [security feature]?"
- "What vulnerabilities exist in this code?"
- "What are the security tradeoffs of [option A vs B]?"

**Avoid:**
- "Make this secure" without specifics
- Implementing security by obscurity
- Rolling your own crypto
- Ignoring security until "later"

**After Gemini's Response:**
- Implement suggested fixes properly
- Test security measures
- Consider professional security audit for critical systems
- Stay updated on security best practices
- Document security decisions

---

## Security Checklist

Before deploying:
- [ ] All inputs validated/sanitized
- [ ] Authentication implemented properly
- [ ] Authorization checks in place
- [ ] Secrets not hardcoded
- [ ] HTTPS/TLS enabled
- [ ] Error messages don't leak info
- [ ] Rate limiting configured
- [ ] Logging enabled for security events
- [ ] Dependencies up to date
- [ ] Security headers configured

**Remember:**
- Security is not an afterthought
- Defense in depth (multiple layers)
- Principle of least privilege
- Don't trust user input ever
- Keep dependencies updated
- When in doubt, consult security experts
