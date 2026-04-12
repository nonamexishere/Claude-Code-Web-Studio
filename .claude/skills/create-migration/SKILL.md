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

5. **Suggest next steps**:
   1. "Run `/create-model` to update application models"
   2. "Run `/design-database` to review full schema"
