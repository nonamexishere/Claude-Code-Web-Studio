---
name: create-endpoint
description: "Generate API endpoint with controller, validation, and error handling."
argument-hint: "<METHOD /path> [--framework express|fastapi|nestjs]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

When this skill is invoked:

1. **Parse the argument** for HTTP method and path (e.g., `POST /api/users`).
   Auto-detect backend framework from existing project.

2. **Read existing patterns**:
   - Check existing endpoints for structure conventions
   - Check middleware chain (auth, validation, error handling)
   - Check `design/api-spec.md` for the endpoint specification

3. **Generate the endpoint** with:

   - **Route registration** in the appropriate router file
   - **Input validation** using Zod, Joi, or Pydantic
   - **Controller/Handler** with business logic
   - **Error handling** with proper status codes and error format
   - **Auth middleware** if the endpoint is protected
   - **TypeScript types** for request and response

4. **Framework-specific patterns**:
   - **Express**: Router + controller + validation middleware
   - **Fastify**: Route + schema + handler
   - **NestJS**: Controller + DTO + Service + Guard
   - **FastAPI**: Router + Pydantic model + dependency injection
   - **Django**: View + Serializer + URL conf

5. **Report what was created.**

6. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /create-endpoint — [YYYY-MM-DD HH:MM]
     - Action: scaffolded [METHOD path] with validation + handler
     - Recommended next: /write-tests
     ```
   - Render the handoff block with:
     - `/write-tests [endpoint-path]` — cover the endpoint before moving on *(recommended)*
     - `/create-model` — add the data model this endpoint needs
     - `/create-page` — build the UI that calls this endpoint
     - `/code-review src/[endpoint-path]` — review what you just wrote
     - `@backend-lead` — discuss error handling or auth choices
