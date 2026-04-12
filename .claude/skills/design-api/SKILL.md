---
name: design-api
description: "Design REST or GraphQL API schema with endpoints, types, validation rules, and example requests/responses."
argument-hint: "[resource or feature, e.g. 'user management' or 'REST']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, AskUserQuestion
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

7. **Suggest next steps**:
   - `/create-endpoint [resource]` to implement endpoints
   - `/design-database` to align data model with API
   - `/setup-auth` to implement authentication
