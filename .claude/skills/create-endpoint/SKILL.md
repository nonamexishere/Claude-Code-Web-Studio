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

5. **Report what was created** and suggest:
   - `/write-tests` to test the endpoint
   - `/create-model` if a new data model is needed
