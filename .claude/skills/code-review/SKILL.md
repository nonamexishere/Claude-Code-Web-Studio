---
name: code-review
description: "AI-powered code review: bugs, security, performance, best practices, and suggestions."
argument-hint: "<file-or-directory> [--focus security|performance|all]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash
---

When this skill is invoked:

1. **Read the target** file or directory.

2. **Review in this order**:

   **Correctness**:
   - Logic errors, off-by-one, null/undefined handling
   - Race conditions in async code
   - Missing error handling

   **Security** (OWASP Top 10):
   - Injection vulnerabilities (SQL, XSS, command injection)
   - Auth/authz issues
   - Sensitive data exposure
   - Missing input validation

   **Performance**:
   - Unnecessary re-renders (React)
   - N+1 queries
   - Missing indexes
   - Bundle size impact
   - Memory leaks

   **Maintainability**:
   - Code duplication
   - Complex conditionals
   - Missing types
   - Unclear naming

   **Best Practices**:
   - Framework-specific anti-patterns
   - Accessibility issues
   - Missing error states, loading states, empty states

3. **Output format**:

   For each issue found:
   - **Severity**: Critical / Warning / Suggestion
   - **File:Line**: Location
   - **Issue**: What's wrong
   - **Fix**: How to fix it (with code example)

4. **Summary**:
   - Total issues by severity
   - Overall code quality rating (1-10)
   - Top 3 priorities to fix
