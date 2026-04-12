---
name: help
description: "Show project status, available commands, where you left off, and what to do next. Your guide through the studio."
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

   **`/help agents`** — List all 28 agents grouped by tier with one-line descriptions.
   Show how to talk to them: `@agent-name your question here`

   **`/help skills`** — List all skills grouped by category with descriptions.
   Show how to run them: `/skill-name [arguments]`

   **`/help workflow`** — Show the recommended full workflow from idea to deployment:
   ```
   Idea → /brainstorm → /start → /create-architecture → /design-api →
   /design-database → /create-page → /create-endpoint → /create-model →
   /setup-auth → /write-tests → /code-review → /audit-security →
   /setup-docker → /setup-cicd → /deploy
   ```

7. **Always end with a reminder**:
   ```
   Type /help anytime to see this again.
   Type / to see all available commands.
   ```
