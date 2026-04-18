---
name: team-feature
description: "Orchestrate a complete feature build using multiple agents. Coordinates design, frontend, backend, testing, and review."
argument-hint: "<feature-description>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Understand the feature** from the argument and existing docs.

2. **Create a feature plan** with phases:

   **Phase 1 — Design**:
   - Ask `@ux-lead` for wireframes and UX flow
   - Ask `@project-architect` for technical approach
   - Define API contract with `@api-designer`
   - Output: Feature spec in `docs/features/<feature-name>.md`

   **Phase 2 — Database & API**:
   - Create data models with `/create-model`
   - Create migration with `/create-migration`
   - Set up API endpoints with `/create-endpoint`
   - Add middleware if needed with `/create-middleware`
   - Output: Database schema + working API

   **Phase 3 — Frontend**:
   - Create pages with `/create-page`
   - Build components with `/create-component`
   - Create forms with `/create-form`
   - Add data lists with `/create-list`
   - Set up routing with `/setup-routing`
   - Output: Working UI connected to API

   **Phase 4 — Integration**:
   - Real-time features (if needed): `/setup-websocket`
   - Email notifications (if needed): `/setup-email`
   - File uploads (if needed): `/setup-storage`
   - Payments (if needed): `/setup-payments`
   - Output: Fully integrated feature

   **Phase 5 — Quality**:
   - Write tests with `/write-tests`
   - Run code review with `/code-review`
   - Audit accessibility with `/audit-accessibility`
   - Audit performance with `/audit-performance`
   - Audit security with `/audit-security`
   - Output: Tested and reviewed feature

3. **Execute each phase**, asking for user confirmation between phases.

4. **Generate feature summary** at the end with what was built and any follow-ups.

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /team-feature — [YYYY-MM-DD HH:MM]
     - Action: built [feature-name] across [N] phases
     - Recommended next: /code-review
     ```
   - Render the handoff block with:
     - `/code-review` — comprehensive review across all layers *(recommended)*
     - `/audit-security` — security check for the new attack surface
     - `/sprint-plan` — plan what ships next
     - `/write-tests` — fill any remaining test gaps
     - `@tech-lead` — sign off on the feature end-to-end
