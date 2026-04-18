---
name: design-database
description: "Design database schema with tables/collections, relations, indexes, and migration plan."
argument-hint: "[database type, e.g. 'postgresql' or 'mongodb']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion, Task
---

When this skill is invoked:

1. **Read existing context**:
   - `design/product-spec.md` for data requirements
   - `design/api-spec.md` for API resource shapes
   - `docs/architecture.md` for database choice

2. **Determine database** if not specified:
   - Options: PostgreSQL / MySQL / SQLite / MongoDB / Supabase

3. **Design the schema**:

   For **relational databases**:
   - Entity-Relationship diagram (Mermaid)
   - Table definitions with columns, types, constraints
   - Foreign key relationships
   - Index strategy (which columns, why)
   - Common queries and their index coverage

   For **document databases**:
   - Collection definitions
   - Document shape with embedded vs. referenced patterns
   - Index strategy
   - Aggregation patterns

4. **Address common patterns**:
   - Soft delete vs. hard delete
   - Timestamps (created_at, updated_at)
   - UUID vs. auto-increment IDs
   - Audit trails
   - Multi-tenancy (if applicable)

5. **Write the schema doc** to `design/database-schema.md`.

6. **Generate initial migration** or schema file based on the chosen ORM.

7. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /design-database — [YYYY-MM-DD HH:MM]
     - Action: wrote design/database-schema.md + initial migration
     - Recommended next: /create-migration
     ```
   - Render the handoff block with:
     - `/create-migration` — scaffold the initial migration file *(recommended)*
     - `/create-model [table]` — generate ORM models from the schema
     - `/design-api` — design API on top of this data
     - `/create-endpoint [resource]` — build a first endpoint against the data
     - `@database-lead` — review schema and indexing choices
