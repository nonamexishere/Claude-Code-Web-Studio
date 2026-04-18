---
name: create-model
description: "Generate database model/schema with ORM configuration and migrations."
argument-hint: "<ModelName> [--orm prisma|drizzle|typeorm|django]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

When this skill is invoked:

1. **Parse the argument** for model name and ORM.
   Auto-detect ORM from existing project files.

2. **Read existing context**:
   - Check `design/database-schema.md` for the table definition
   - Check existing models for naming and pattern conventions

3. **Generate**:
   - Model/schema definition with all fields, types, and constraints
   - Relations to other models (foreign keys, many-to-many)
   - Indexes for common query patterns
   - Timestamps (createdAt, updatedAt)
   - Migration file
   - Seed data example

4. **ORM-specific output**:
   - **Prisma**: schema.prisma model block + `npx prisma migrate dev`
   - **Drizzle**: schema file + migration SQL
   - **TypeORM**: Entity class with decorators
   - **Django**: Model class in models.py + migration command
   - **Sequelize**: Model definition + migration file

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /create-model — [YYYY-MM-DD HH:MM]
     - Action: generated [ModelName] model + migration
     - Recommended next: /create-endpoint
     ```
   - Render the handoff block with:
     - `/create-endpoint` — build API endpoints for this model *(recommended)*
     - `/create-migration` — add follow-up schema changes
     - `/design-api` — design API contracts for this model
     - `/write-tests` — cover model validation and relations
     - `@database-lead` — review schema choices
