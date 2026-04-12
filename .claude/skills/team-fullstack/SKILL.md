---
name: team-fullstack
description: "Orchestrate a full-stack feature implementation: design, frontend, backend, database, and tests end-to-end."
argument-hint: "<feature-name>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, WebSearch, AskUserQuestion, Task
---

When this skill is invoked:

1. **Parse the feature name** from the argument.

2. **Read existing context** to understand the current state of the project.

3. **Plan the implementation** by spawning agents in sequence:

   **Step 1 — Design** (spawn `product-owner` or `project-architect`):
   - Define user stories and acceptance criteria
   - Identify API endpoints needed
   - Identify data model changes

   **Step 2 — Database** (spawn `database-lead`):
   - Create or update data models
   - Run migrations
   - Create seed data

   **Step 3 — Backend** (spawn `backend-lead`):
   - Implement API endpoints
   - Add input validation
   - Add auth middleware if needed

   **Step 4 — Frontend** (spawn `frontend-lead`):
   - Create UI components
   - Implement page/route
   - Connect to API
   - Handle loading, error, empty states

   **Step 5 — Testing** (spawn `qa-lead`):
   - Unit tests for critical business logic
   - Integration tests for API endpoints
   - Component tests for UI

   **Step 6 — Review** (spawn `tech-lead`):
   - Code review across all layers
   - Security check
   - Performance check

4. **Present a summary** of what was built, with file list and next steps.

5. **After completion**, suggest:
   - `/code-review` for a thorough review
   - `/audit-security` for security verification
   - `/sprint-plan` to plan next features
