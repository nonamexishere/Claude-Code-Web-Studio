---
name: setup-state
description: "Set up state management for the web app: global store, server state, form state, and persistence strategy."
argument-hint: "[library: zustand|redux|jotai|pinia|vuex|signals]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project framework** from `package.json` (React, Next.js, Vue, Nuxt, Svelte, Angular).

2. **Ask about state needs** using `AskUserQuestion`:

   - Tab "Global store" — "Client state library?"
     Options (by stack):
     - React / Next.js: Zustand / Redux Toolkit / Jotai / Valtio / React Context only
     - Vue / Nuxt: Pinia / Vuex / Composition-only
     - Svelte: Svelte stores / Runes
     - Angular: NgRx / Signal Store / Services
   - Tab "Server state" — "Data-fetching lib?"
     Options: TanStack Query / SWR / RTK Query / Apollo Client / urql / Native fetch
   - Tab "Form state" — "Form library?"
     Options: React Hook Form / Formik / Final Form / VeeValidate / Native form / None
   - Tab "Persistence" — "What persists across reloads?"
     Options (multi): Auth tokens / User preferences / Draft forms / Feature flags / Nothing

3. **Generate state setup**:

   - **Global store scaffold**: slices/atoms/stores for auth, UI, session, feature flags
   - **Server state client**: configured with default cache time, retry, error handler
   - **Form state patterns**: example form with validation + submission flow
   - **Persistence layer**: localStorage / sessionStorage / IndexedDB / cookies per concern, with hydration guards for SSR
   - **Devtools wiring**: Redux DevTools / Zustand devtools / TanStack Query devtools in dev mode only
   - **TypeScript types** for store shape, actions, selectors

4. **SSR / hydration notes** (Next.js / Nuxt / Remix):
   - Avoid client-only state in server components
   - Dehydrate / hydrate pattern for server state
   - Guard `window` / `localStorage` access

5. **Write files** to `src/stores/`, `src/client/stores/`, or framework-equivalent location.

6. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-state — [YYYY-MM-DD HH:MM]
     - Action: wired [global lib] + [server lib] with [persistence scope]
     - Recommended next: /create-page
     ```
   - Render the handoff block with:
     - `/create-page` — build a page that consumes the store *(recommended)*
     - `/create-form` — build a form on the chosen form library
     - `/setup-auth` — wire auth state into the global store
     - `/write-tests` — cover reducers / selectors / mutations
     - `@frontend-lead` — review store boundaries and server/client split
