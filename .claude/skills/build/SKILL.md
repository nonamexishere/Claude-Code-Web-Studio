---
name: build
description: "Build the web application for production. Analyzes bundle size, optimizes assets, and verifies the build output."
argument-hint: "[target: dev|staging|production]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion, Task
---

When this skill is invoked:

1. **Detect the project framework** from config files.

2. **Ask about build target** using `AskUserQuestion`:

   - Tab "Target" — "Build target?"
     Options: Development / Staging / Production
   - Tab "Analysis" — "Include bundle analysis?"
     Options: Yes / No

3. **Run the build** based on framework:

   - Next.js: `next build` (+ `next analyze` if requested)
   - Nuxt: `nuxt build` / `nuxt generate`
   - Vite (React/Vue/Svelte): `vite build`
   - Astro: `astro build`
   - Angular: `ng build --configuration production`
   - SvelteKit: `vite build`
   - Custom: detect from package.json scripts

4. **Pre-build checks**:
   - TypeScript compilation (no errors)
   - Environment variables present
   - Lint check
   - Dependency audit (no critical vulnerabilities)

5. **Post-build analysis**:
   - Total bundle size and per-chunk breakdown
   - Largest dependencies by size
   - Image assets optimization status
   - Unused exports / dead code warnings
   - Build time report

6. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /build — [YYYY-MM-DD HH:MM]
     - Action: built [target], bundle [size], [X warnings]
     - Recommended next: /deploy or /audit-performance
     ```
   - Render the handoff block. Pick the recommended based on results:
     - If bundle is healthy and build is clean: `/deploy` *(recommended)*
     - If bundle is concerning: `/audit-performance` first
     - If warnings present: `/code-review` before deploying
   - Always include: `/deploy`, `/audit-performance`, `/setup-cicd`, `@devops-lead`
