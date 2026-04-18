---
name: create-migration
description: "Create database migration: schema changes with Prisma, Drizzle, Knex, Alembic, or Rails migrations with rollback support."
argument-hint: "<migration-name> (e.g., add-users-table, add-email-to-posts)"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project ORM/migration tool** from config files.

2. **Ask about migration** using `AskUserQuestion`:

   - Tab "Type" — "Migration type?"
     Options: Create table / Add column / Remove column / Add index / Modify column / Rename / Seed data / Custom
   - Tab "Details" — "Describe the change"
     Free text input

3. **Generate migration** based on tool:

   **Prisma**:
   - Update schema.prisma with new model/field
   - Run `prisma migrate dev --name <name>`
   - Generate client types

   **Drizzle**:
   - Update schema file (schema.ts)
   - Run `drizzle-kit generate`
   - Migration SQL file

   **Knex**:
   - Migration file with up() and down()
   - Schema builder calls
   - Rollback support

   **Alembic (Python)**:
   - Migration script with upgrade() and downgrade()
   - Auto-generated from SQLAlchemy model changes

   **Rails**:
   - Migration class with change method
   - Reversible migrations

   **Raw SQL**:
   - Up migration SQL
   - Down migration SQL (rollback)

4. **Migration safety checks**:
   - Will this lock the table? (large table warnings)
   - Is this backward compatible? (deploy before code change)
   - Data migration needed? (backfill strategy)
   - Nullable vs default for new columns (avoid NOT NULL without default on existing table)

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /create-migration — [YYYY-MM-DD HH:MM]
     - Action: generated migration [name]
     - Recommended next: /create-model
     ```
   - Render the handoff block with:
     - `/create-model` — update application models to match *(recommended)*
     - `/create-endpoint` — build endpoints on top of the new schema
     - `/design-database` — re-check full schema for consistency
     - `/write-tests` — add data-layer tests
     - `@database-lead` — review migration for safety (large tables, locks)
