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

5. **Suggest next steps**:
   1. "Run `/create-endpoint` to apply this middleware"
   2. "Run `/write-tests` to test middleware edge cases"
