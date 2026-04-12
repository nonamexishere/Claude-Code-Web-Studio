---
name: build
description: "Build the web application for production. Analyzes bundle size, optimizes assets, and verifies the build output."
argument-hint: "[target: dev|staging|production]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
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

6. **Suggest next steps**:
   1. "Run `/deploy` to deploy this build"
   2. "Run `/audit-performance` if bundle size is concerning"
   3. "Run `/setup-cicd` to automate builds"
