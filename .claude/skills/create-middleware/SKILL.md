---
name: create-middleware
description: "Create server middleware: auth guards, rate limiting, logging, CORS, validation, and request processing pipelines."
argument-hint: "<middleware-name> (e.g., auth, rate-limit, logger)"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project framework and backend** from config files.

2. **Ask about middleware needs** using `AskUserQuestion`:

   - Tab "Type" — "Middleware type?"
     Options: Authentication / Rate limiting / Request logging / CORS / Input validation / Error handling / Caching / Custom
   - Tab "Scope" — "Apply to?"
     Options: All routes / Specific route group / Single endpoint

3. **Generate middleware** based on framework:

   **Express/Fastify/Hono**:
   - Middleware function with next() pattern
   - Error handling middleware
   - Request/response type augmentation

   **Next.js**:
   - middleware.ts with matcher config
   - Edge runtime middleware
   - Auth redirect logic

   **Django**:
   - Middleware class with process_request/process_response
   - MIDDLEWARE setting registration

   **Spring Boot**:
   - Filter or HandlerInterceptor
   - @Component annotation
   - Filter chain ordering

   **Common middleware patterns**:
   - **Auth**: JWT verification, session validation, role check
   - **Rate limiting**: Sliding window, per-user limits, Redis-backed
   - **Logging**: Request ID, duration, status, structured JSON
   - **CORS**: Origin whitelist, credentials, preflight caching
   - **Validation**: Request body/query/params validation with Zod/Joi
   - **Error handling**: Global error catch, error formatting, Sentry reporting
   - **Caching**: ETag, Cache-Control headers, conditional requests

4. **Generate test file** for the middleware.

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /create-middleware — [YYYY-MM-DD HH:MM]
     - Action: added [middleware-name] middleware
     - Recommended next: /write-tests
     ```
   - Render the handoff block with:
     - `/write-tests` — cover middleware edge cases *(recommended)*
     - `/create-endpoint` — apply this middleware to a new endpoint
     - `/audit-security` — review if this is an auth/validation middleware
     - `/code-review` — review the middleware logic
     - `@backend-lead` — discuss middleware ordering or error handling
