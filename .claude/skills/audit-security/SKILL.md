---
name: audit-security
description: "Check for OWASP Top 10 vulnerabilities and security best practices."
argument-hint: "[file-or-directory]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash
---

When this skill is invoked:

1. **Scan the codebase** for common vulnerability patterns:

   - **Injection**: Raw SQL queries, unsanitized user input in commands, template injection
   - **Broken Auth**: Weak password policies, missing rate limiting, insecure token storage
   - **Sensitive Data**: Hardcoded secrets, API keys in code, PII in logs
   - **XSS**: Unescaped output, dangerouslySetInnerHTML, innerHTML
   - **CSRF**: Missing tokens, incorrect SameSite cookie settings
   - **Misconfiguration**: CORS wildcard, debug mode in production, verbose errors
   - **Dependencies**: Run `npm audit` or `pip audit` for known vulnerabilities

2. **Check configuration files**:
   - CORS settings
   - CSP headers
   - Cookie attributes (httpOnly, secure, sameSite)
   - Environment variable handling
   - .gitignore for sensitive files

3. **Output a security report** with:
   - Critical issues (fix immediately)
   - Warnings (fix before production)
   - Recommendations (improve security posture)
   - Each with file location, description, and fix suggestion

4. **Suggest**: `/setup-auth` if auth issues found, `@security-lead` for deeper analysis.
