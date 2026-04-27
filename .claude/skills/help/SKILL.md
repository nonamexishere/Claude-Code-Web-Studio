---
name: help
description: |
  Show project status, available commands, where the user left off, and
  what to do next. The studio's guide.
when_to_use: |
  USE WHEN the user is lost, asks "what can I do / what commands exist /
  where am I / I forgot what we were doing / what's next", or wants a tour
  of agents/skills/workflows. Always preferred over generic chat answers
  about studio capabilities.
argument-hint: "[topic: agents|skills|workflow]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash
---

When this skill is invoked:

1. **Detect project state** by checking what exists in the current directory.
   Run all these checks in parallel:

   - Check if `package.json` exists (project initialized?)
   - Check if `design/product-spec.md` exists (product defined?)
   - Check if `design/api-spec.md` exists (API designed?)
   - Check if `design/database-schema.md` exists (database designed?)
   - Check if `docs/architecture.md` exists (architecture planned?)
   - Check if `src/` directory exists and has files (code written?)
   - Check if `tests/` directory exists and has files (tests written?)
   - Check if `Dockerfile` or `docker-compose.yml` exists (containerized?)
   - Check if `.github/workflows/` exists (CI/CD set up?)
   - Check `git log --oneline -5` for recent activity
   - Glob for `src/**/*.{ts,tsx,js,jsx,vue,py}` to estimate codebase size
   - Glob for `src/**/test*` or `src/**/*.test.*` or `tests/**/*` for test count

2. **Determine the project phase** based on what exists:

   - **No project yet**: Nothing exists — suggest `/start`
   - **Just started**: Only package.json, no design docs — suggest `/brainstorm`
   - **Planning phase**: Product spec exists but no architecture — suggest `/create-architecture`
   - **Design phase**: Architecture exists but minimal code — suggest `/design-api`, `/design-database`
   - **Building phase**: Source code exists, actively developing — suggest feature skills
   - **Testing phase**: Code exists but few/no tests — suggest `/write-tests`, `/code-review`
   - **Deployment phase**: Tests pass, no Docker/CI — suggest `/setup-docker`, `/setup-cicd`
   - **Production ready**: Everything in place — suggest `/deploy`, `/audit-security`

3. **Display a status dashboard** like this:

   ```
   ╔══════════════════════════════════════════╗
   ║        Claude Web Studio — Status        ║
   ╠══════════════════════════════════════════╣
   ║                                          ║
   ║  Project: [name from package.json]       ║
   ║  Phase:   [detected phase]               ║
   ║  Stack:   [detected frameworks]          ║
   ║                                          ║
   ║  Progress:                               ║
   ║  [✓] Project initialized                 ║
   ║  [✓] Product spec defined                ║
   ║  [✓] Architecture planned                ║
   ║  [ ] API designed                        ║
   ║  [ ] Database modeled                    ║
   ║  [~] Building features (3 files)         ║
   ║  [ ] Tests written                       ║
   ║  [ ] Docker configured                   ║
   ║  [ ] CI/CD pipeline                      ║
   ║  [ ] Deployed                            ║
   ║                                          ║
   ╚══════════════════════════════════════════╝
   ```

   Use `[✓]` for completed, `[~]` for in-progress, `[ ]` for not started.

4. **Show recent activity** from git log (last 3-5 commits) if available.

5. **Suggest next steps** — this is the most important part.
   Based on the detected phase, give **3 concrete suggestions** in priority order:

   Format each suggestion as:
   ```
   → Run `/command-name` — [why this is the next logical step]
   ```

   Or for agent conversations:
   ```
   → Talk to @agent-name — [what to ask them about]
   ```

   Make suggestions contextual. Examples:

   - If no project exists:
     ```
     → Run `/start` — scaffold your project with framework, database, and tooling
     → Run `/brainstorm` — if you're not sure what to build yet
     → Talk to @project-architect — get advice on tech stack before starting
     ```

   - If building features but no tests:
     ```
     → Run `/write-tests src/` — you have 12 source files but 0 tests
     → Run `/code-review src/` — review what you've built so far
     → Run `/create-endpoint` — if you need more API endpoints
     ```

   - If tests exist but no Docker:
     ```
     → Run `/setup-docker` — containerize for consistent environments
     → Run `/audit-security` — check for vulnerabilities before deploying
     → Run `/deploy vercel` — ship it!
     ```

6. **If a topic argument is provided**, show focused help:

   **`/help agents`** — List all 51 agents grouped by tier with one-line descriptions.
   Show how to talk to them: `@agent-name your question here`

   **`/help skills`** — List all 49 skills grouped by category with descriptions:
   - **Setup & Planning**: /start, /brainstorm, /help, /define-features, /wireframe, /sprint-plan
   - **Architecture**: /create-architecture, /design-api, /design-database, /design-components, /setup-routing, /setup-theme
   - **Frontend**: /create-page, /create-component, /create-form, /create-list, /setup-state, /add-animation
   - **Backend**: /create-endpoint, /create-model, /create-migration, /create-middleware, /setup-auth, /setup-graphql, /setup-websocket, /setup-redis, /setup-email, /setup-payments, /setup-storage
   - **Testing & Quality**: /write-tests, /code-review, /audit-security, /audit-performance, /audit-accessibility
   - **SEO & i18n**: /setup-seo, /setup-i18n, /setup-analytics, /setup-monitoring
   - **Infrastructure**: /setup-docker, /setup-cicd, /setup-monorepo, /setup-edge, /deploy, /build
   - **Docs & Team**: /generate-docs, /create-readme, /create-changelog, /team-feature, /team-fullstack

   **`/help workflow`** — Show the recommended full workflow from idea to deployment:
   ```
   1. PLAN       /brainstorm → /define-features → /create-architecture
   2. DESIGN     /wireframe → /setup-theme → /design-api → /design-database
   3. BUILD      /create-page → /create-component → /create-endpoint
   4. INTEGRATE  /setup-auth → /setup-email → /setup-payments → /setup-i18n
   5. TEST       /write-tests → /audit-performance → /audit-accessibility
   6. RELEASE    /setup-cicd → /build → /deploy
   ```

7. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   Render the handoff block using the 3 contextual suggestions from step 5 as numbered options (option 1 = recommended). Append escape hatches (Stop, Chat). No breadcrumb write for `/help` — it's a read-only dashboard.

   Example block for "building features but no tests":
   ```
   ### Status
   - Current MVP: {{from .claude/session/mvp.md or "not set"}}
   - Progress: 12 source files / 0 tests

   ### What's next?
   1. **/write-tests src/** — you have 12 source files but 0 tests *(recommended)*
   2. **/code-review src/** — review what you've built so far
   3. **/create-endpoint** — if you need more API endpoints
   4. **Stop here** — end session
   5. **Chat about this** — ask a question or discuss tradeoffs
   ```

8. **Always end with a reminder**:
   ```
   Type /help anytime to see this again.
   Type / to see all available commands.
   ```
