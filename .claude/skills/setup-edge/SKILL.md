---
name: setup-edge
description: "Set up edge computing: Cloudflare Workers, Vercel Edge Functions, or Deno Deploy with edge-compatible database and caching."
argument-hint: "[platform: cloudflare|vercel|deno]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Ask about edge needs** using `AskUserQuestion`:

   - Tab "Platform" — "Edge platform?"
     Options: Cloudflare Workers / Vercel Edge Functions / Deno Deploy / Fastly Compute
   - Tab "Use Case" — "Primary use case?"
     Options: API endpoints / Middleware (auth, redirects) / Full SSR app / Geolocation routing / A/B testing / Rate limiting
   - Tab "Storage" — "Edge storage needed?"
     Options: KV store / Database (Turso, D1, Neon) / Object storage (R2, S3) / None

2. **Generate edge setup**:

   **Cloudflare Workers**:
   - wrangler.toml configuration
   - Worker script with Hono or itty-router
   - KV/D1/R2 binding setup
   - Environment variables and secrets

   **Vercel Edge Functions**:
   - Edge runtime configuration in Next.js/SvelteKit
   - Edge middleware for auth/redirects
   - Edge-compatible data fetching
   - Vercel KV / Edge Config setup

   **Deno Deploy**:
   - Deno project setup
   - Hono or Oak framework
   - Deno KV for storage
   - GitHub integration for deployment

3. **Edge patterns**:
   - Geolocation-based content
   - A/B testing at the edge
   - Rate limiting with KV
   - Auth token verification
   - Edge caching strategies

4. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-edge — [YYYY-MM-DD HH:MM]
     - Action: wired [platform] for [use case], storage=[option]
     - Recommended next: /deploy
     ```
   - Render the handoff block with:
     - `/deploy` — ship the edge function to production *(recommended)*
     - `/setup-redis` — add edge-compatible caching (Upstash)
     - `/create-middleware` — add edge middleware (auth, geo)
     - `/audit-performance` — measure the edge latency benefit
     - `@edge-specialist` — discuss edge architecture and cold start
