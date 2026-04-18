---
name: design-api
description: "Design REST or GraphQL API schema with endpoints, types, validation rules, and example requests/responses."
argument-hint: "[resource or feature, e.g. 'user management' or 'REST']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, AskUserQuestion, Task
---

When this skill is invoked:

1. **Read existing context**:
   - `design/product-spec.md` for features
   - `docs/architecture.md` for tech decisions

2. **Determine API style** via `AskUserQuestion` if not specified:
   - Options: REST / GraphQL / tRPC / Mixed

3. **For REST APIs**, design each resource:

   For each endpoint document:
   - **Method & Path**: `GET /api/v1/users/:id`
   - **Description**: What it does
   - **Auth**: Required? What role?
   - **Request**: Headers, params, query, body (with types)
   - **Response**: Status codes, body schema, error cases
   - **Example**: Full request/response pair

   Standard patterns to include:
   - Authentication endpoints (login, register, refresh, logout)
   - CRUD for each resource
   - List endpoints with pagination, filtering, sorting
   - Error response format

4. **For GraphQL**, design:
   - Type definitions (SDL)
   - Queries and Mutations
   - Input types and validation
   - Subscription types (if real-time)

5. **Write the API spec** to `design/api-spec.md`.

6. **Optionally generate OpenAPI spec** at `design/openapi.yaml` for REST APIs.

7. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /design-api — [YYYY-MM-DD HH:MM]
     - Action: wrote design/api-spec.md ([N] endpoints)
     - Recommended next: /create-endpoint
     ```
   - Render the handoff block with:
     - `/create-endpoint [resource]` — implement the first endpoint from the spec *(recommended)*
     - `/design-database` — align data model with API shapes
     - `/setup-auth` — wire auth before protected endpoints
     - `/write-tests` — draft contract tests
     - `@backend-lead` — review API design choices
