---
name: setup-graphql
description: "Set up GraphQL: server with schema/resolvers, client with code generation, subscriptions, and caching."
argument-hint: "[side: server|client|both]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project framework** from config files.

2. **Ask about GraphQL needs** using `AskUserQuestion`:

   - Tab "Side" — "GraphQL setup?"
     Options: Server only / Client only / Full-stack (both)
   - Tab "Server" — "Server approach?" (if server)
     Options: Apollo Server / GraphQL Yoga / Mercurius (Fastify) / Pothos (code-first) / Strawberry (Python)
   - Tab "Client" — "Client approach?" (if client)
     Options: Apollo Client / urql / TanStack Query + graphql-request / Relay

3. **Generate GraphQL server** (if selected):
   - Schema definition (SDL or code-first)
   - Resolver structure by domain
   - Context setup (auth, database connection)
   - DataLoader for N+1 prevention
   - Error handling with custom error types
   - Subscription setup (WebSocket)
   - Playground/Explorer in development

4. **Generate GraphQL client** (if selected):
   - Client initialization and cache config
   - GraphQL Code Generator setup (typed operations)
   - Query/mutation/subscription examples
   - Error handling and retry logic
   - Optimistic updates pattern
   - Cache invalidation patterns

5. **Generate supporting files**:
   - codegen.ts configuration
   - Schema types (generated)
   - Custom scalars (Date, JSON, etc.)
   - Test setup with mock schema

6. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-graphql — [YYYY-MM-DD HH:MM]
     - Action: wired GraphQL [side] with [server/client] stack
     - Recommended next: /design-api
     ```
   - Render the handoff block with:
     - `/design-api` — flesh out schema, types, and queries *(recommended)*
     - `/create-endpoint` — add resolver-backed queries and mutations
     - `/setup-auth` — wire auth into GraphQL context
     - `/write-tests` — add resolver and query tests
     - `@graphql-specialist` — schema design and N+1 prevention advice
