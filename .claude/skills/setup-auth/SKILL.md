---
name: setup-auth
description: "Configure authentication: JWT, OAuth, session, or third-party provider."
argument-hint: "[strategy: jwt|session|oauth|clerk|supabase]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, WebSearch, AskUserQuestion, Task
---

When this skill is invoked:

1. **Determine auth strategy** via `AskUserQuestion` if not specified:
   - Options: JWT (access + refresh) / Session (cookie-based) / OAuth2 + JWT / Third-party (Clerk, Auth0, Supabase Auth) / Auth.js (NextAuth)

2. **Implement based on strategy**:

   **JWT Flow**:
   - Token generation and validation utilities
   - Access token (short-lived) + refresh token (long-lived)
   - Auth middleware for protected routes
   - Login, register, refresh, logout endpoints
   - Password hashing with bcrypt/argon2

   **Session Flow**:
   - Session store configuration (Redis, database)
   - Cookie settings (httpOnly, secure, sameSite)
   - Session middleware
   - Login, register, logout endpoints

   **OAuth2**:
   - Provider configuration (Google, GitHub, etc.)
   - Callback handling
   - User creation/linking on first login
   - Token storage

   **Third-party**:
   - SDK installation and configuration
   - Middleware/provider setup
   - Protected route patterns

3. **Frontend auth integration**:
   - Auth context/store
   - Protected route wrapper
   - Login/register forms
   - Token refresh logic
   - Redirect on auth failure

4. **Security checklist**:
   - [ ] Passwords hashed with bcrypt/argon2
   - [ ] Tokens have appropriate expiration
   - [ ] HttpOnly cookies for sensitive tokens
   - [ ] CSRF protection enabled
   - [ ] Rate limiting on auth endpoints

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-auth — [YYYY-MM-DD HH:MM]
     - Action: wired [strategy] auth + middleware + endpoints
     - Recommended next: /audit-security
     ```
   - Render the handoff block with:
     - `/audit-security` — verify auth security posture now, not after ship *(recommended)*
     - `/create-form LoginForm` — build the login UI
     - `/setup-email` — wire email verification / password reset
     - `/write-tests` — cover auth endpoints and middleware
     - `@security-lead` — review token handling and attack surface
