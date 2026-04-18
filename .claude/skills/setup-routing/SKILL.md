---
name: setup-routing
description: "Configure application routing: file-based or config-based routes, layouts, guards, dynamic routes, and middleware."
argument-hint: "[pattern: file-based|config-based]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project framework** from config files.

2. **Ask about routing needs** using `AskUserQuestion`:

   - Tab "Pattern" — "Routing pattern?"
     Options: File-based (Next.js, Nuxt, SvelteKit) / Config-based (React Router, Vue Router) / Both
   - Tab "Auth" — "Auth-protected routes?"
     Options: Yes (login required for most) / Partial (some pages gated) / No (all public)
   - Tab "Features" — "Route features?"
     Options (multi): Nested layouts / Route groups / Parallel routes / Intercepting routes / Middleware / Breadcrumbs

3. **Generate routing setup** based on framework:

   **Next.js App Router**:
   - Route groups: (auth), (dashboard), (marketing)
   - Layouts with nested layouts
   - Loading and error boundaries per route
   - Middleware for auth and redirects
   - Dynamic routes with generateStaticParams

   **React Router / TanStack Router**:
   - Router configuration with type-safe routes
   - Layout routes for shared UI
   - Loader functions for data fetching
   - Auth guard wrapper component
   - Lazy loading with React.lazy

   **Nuxt**:
   - pages/ directory structure
   - Nested routes with NuxtPage
   - Route middleware (auth, guest)
   - definePageMeta for route config

   **SvelteKit**:
   - +page.svelte, +layout.svelte structure
   - +page.server.ts for data loading
   - hooks.server.ts for auth middleware
   - Route parameters and optional params

4. **Generate supporting files**:
   - Auth middleware/guard
   - Route constants/types
   - Breadcrumb component
   - 404 page

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-routing — [YYYY-MM-DD HH:MM]
     - Action: configured [pattern] routing with [features]
     - Recommended next: /create-page
     ```
   - Render the handoff block with:
     - `/create-page` — add the first real page to your routes *(recommended)*
     - `/setup-auth` — implement auth-protected routes
     - `/setup-theme` — lock the design system before building pages
     - `/create-component Breadcrumbs` — build shared nav UI
     - `@frontend-lead` — discuss route organization
