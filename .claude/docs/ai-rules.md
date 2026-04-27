# Vendor AI Rules & `llms.txt` Catalog (Web Studio)

**Last verified:** 2026-04-27

Many frameworks now publish AI-targeted resources — `llms.txt` files, official "AI rules" pages, or installable rule packs. When agents in this studio specialize in one of these, they should **fetch and reference the vendor's guidance** rather than working from training-data assumptions.

Three asset types appear below:

- **`llms.txt` / `llms-full.txt`** — vendor-curated docs in plain markdown for LLM context. Fetch via `WebFetch`.
- **AI rules / Agent Skills** — opinionated, vendor-authored best-practice rule files. Sometimes installable via CLI.
- **`.md` URL convention** — many vendors return raw markdown when `.md` is appended to any docs URL.

---

## Tier 1 — Highest Impact (vendor-authored prescriptive rules)

### Supabase ⭐⭐
- **AI Prompts hub:** https://supabase.com/docs/guides/getting-started/ai-prompts (RLS policies, SQL style, edge functions, Next.js auth — all vendor-curated)
- **Cursor/Windsurf installer:** https://supabase.com/ui/docs/ai-editors-rules/prompts
- **Use:** `@supabase-specialist` should fetch the RLS prompt before writing policies, and the edge-functions prompt before scaffolding functions.

### Stripe ⭐⭐
- **`llms.txt`:** https://docs.stripe.com/llms.txt
- **Building with LLMs guide:** https://docs.stripe.com/building-with-llms
- **`.md` convention:** any docs URL works with `.md` appended (e.g. `docs.stripe.com/payments/checkout.md`)
- **Use:** `setup-payments` and Stripe-specific work should fetch the relevant `.md` page directly.

### Convex ⭐⭐
- **`llms-full.txt`:** https://docs.convex.dev/llms-full.txt
- **CLI rule installer:** `npx convex ai-files install` — drops/maintains `convex_rules.txt` in the project
- **AI hub:** https://docs.convex.dev/ai
- **Use:** When a project uses Convex, the CLI installer is the canonical path; agents should suggest running it.

---

## Tier 2 — Solid Vendor-Published Material

### Next.js / Vercel
- **`llms-full.txt`:** https://nextjs.org/docs/llms-full.txt
- **Vercel docs:** https://vercel.com/docs/llms-full.txt
- **Vercel AI SDK:** https://ai-sdk.dev/llms.txt
- **Agent Skills + react-best-practices:** https://vercel.com/docs/agent-resources/skills (install: `npx skills add vercel-labs/agent-skills`)
- **Use:** `@nextjs-specialist` should fetch react-best-practices for waterfalls / bundle-size / Server-vs-Client guidance.

### Cloudflare
- **`llms-full.txt`:** https://developers.cloudflare.com/llms-full.txt
- **Per-product (preferred for narrow tasks):** `https://developers.cloudflare.com/<product>/llms-full.txt` (e.g. `agents/`, `workers/`, `workers-ai/`)
- **AI tooling style guide:** https://developers.cloudflare.com/style-guide/ai-tooling/
- **Use:** `@edge-specialist` and `@cloud-specialist` should pull the per-product file (Workers, R2, KV, D1) instead of the giant root file.

### Angular
- **`llms-full.txt`:** https://angular.dev/context/llm-files/llms-full.txt
- **AI rules:** https://angular.dev/ai/develop-with-ai (standalone components, signals, lazy routes — explicit do/don't list)
- **Use:** `@angular-developer` should reference the AI rules page before generating components.

### Nuxt
- **`llms.txt`:** https://nuxt.com/llms.txt
- **`llms-full.txt`:** https://nuxt.com/llms-full.txt
- **v4 working-with-AI guide:** https://nuxt.com/docs/4.x/guide/ai/llms-txt
- **Use:** `@nuxt-specialist` follows the v4 AI guide for module/composable patterns.

### Svelte / SvelteKit
- **Size-tiered llms files:** https://svelte.dev/llms.txt, `llms-medium.txt`, `llms-small.txt`, `llms-full.txt`
- **AI hub:** https://svelte.dev/docs/llms
- **Use:** `@svelte-developer` picks the right tier for context budget — `medium` is the sweet spot.

### Astro
- **`llms.txt` + variants:** https://docs.astro.build/llms.txt
- **AI guide:** https://docs.astro.build/en/guides/build-with-ai/

### shadcn/ui
- **`llms.txt`:** https://ui.shadcn.com/llms.txt
- **Registry naming conventions:** https://ui.shadcn.com/docs/registry/getting-started
- **Use:** When generating shadcn registry items, follow the LLM-friendly naming/description rules.

### TanStack (Query/Router/Start)
- **`llms.txt`:** https://tanstack.com/llms.txt
- **LLM support pages:** https://tanstack.com/router/v1/docs/llm-support, https://tanstack.com/start/latest/docs/framework/react/guide/llmo

### Vue / React
- **Vue:** https://vuejs.org/llms-full.txt (doc dump only, no rules)
- **React:** https://react.dev/llms.txt (doc dump only)

### Hono
- **`llms.txt`:** https://hono.dev/llms.txt

### Laravel (via Herd / Boost)
- **Herd llms.txt:** https://herd.laravel.com/docs/llms.txt
- **Laravel Boost installer:** `php artisan boost:install` — drops AI guideline files

### Auth & Backend Services
- **Clerk:** https://clerk.com/docs/llms-full.txt
- **Auth0:** https://auth0.com/ai/docs/llms-full.txt + https://auth0.com/ai/docs/build-with-ai/using-ai-tools
- **Prisma:** https://www.prisma.io/docs/llms-full.txt + https://www.prisma.io/docs/orm/more/ai-tools/cursor
- **Drizzle:** https://orm.drizzle.team/llms-full.txt
- **Firebase:** https://firebase.google.com/docs/ai-assistance/mcp-server (vendor approach is the MCP, not a static rules file)

---

## Skip — No Vendor Material Available

Tailwind (sponsor-only, gated), HTMX (PR pending), Radix UI (PR pending), Remix, SolidJS rules, NestJS, Express/Fastify/Gin/Echo/Axum, Spring Boot, Django, Rails, Sentry rules, Zustand, Redux Toolkit. Use community Cursor rules at your own risk; agent training-data is usually fine.

---

## How to Use This in Agent Prompts

When an agent specializes in a tech with a Tier 1/2 entry above, its prompt should include something like:

> Before generating code, fetch the relevant vendor AI rules:
> - For RLS policies: `WebFetch https://supabase.com/docs/guides/getting-started/ai-prompts` (RLS section)
> - For edge functions: same URL, edge-functions section
> - For general DB work: `WebFetch https://supabase.com/llms.txt`

Don't hardcode the rules into prompts (they evolve). Link them.
