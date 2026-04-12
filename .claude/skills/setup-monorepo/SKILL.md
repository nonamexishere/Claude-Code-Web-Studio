---
name: setup-monorepo
description: "Set up a monorepo: Turborepo or Nx with pnpm workspaces, shared packages, and optimized CI/CD pipelines."
argument-hint: "[tool: turborepo|nx]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Ask about monorepo needs** using `AskUserQuestion`:

   - Tab "Tool" — "Monorepo tool?"
     Options: Turborepo / Nx / pnpm workspaces only
   - Tab "Apps" — "What apps in the monorepo?"
     Options (multi): Web app (Next.js/Nuxt/SvelteKit) / API server / Admin dashboard / Marketing site / Mobile (React Native)
   - Tab "Packages" — "Shared packages?"
     Options (multi): UI component library / Config (ESLint, TypeScript, Prettier) / Shared types / Utilities / Database client

2. **Generate monorepo structure**:

   ```
   my-monorepo/
   ├── apps/
   │   ├── web/            # Main web application
   │   ├── api/            # Backend API
   │   └── admin/          # Admin dashboard
   ├── packages/
   │   ├── ui/             # Shared UI components
   │   ├── config-eslint/  # Shared ESLint config
   │   ├── config-ts/      # Shared TypeScript config
   │   ├── types/          # Shared type definitions
   │   └── utils/          # Shared utilities
   ├── turbo.json / nx.json
   ├── pnpm-workspace.yaml
   └── package.json
   ```

3. **Configure build pipeline**:
   - Task dependencies (build order)
   - Remote caching setup
   - Affected-only builds for CI
   - Shared configuration packages

4. **Generate package templates** with proper package.json, tsconfig, exports.

5. **Suggest next steps**:
   1. "Talk to `@monorepo-specialist` for architecture questions"
   2. "Run `/setup-cicd` to configure CI for the monorepo"
