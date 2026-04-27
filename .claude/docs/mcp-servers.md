# MCP Server Reference (Web Studio)

**Last verified:** 2026-04-27

[Model Context Protocol](https://modelcontextprotocol.io) servers extend Claude Code with vendor-published tools — querying live data, deploying, debugging, etc. This studio doesn't pre-wire any MCPs; install only the ones for services you actually use, via `/setup-mcp` or by editing `~/.claude.json` / `.mcp.json` directly.

## How to Install

Three patterns:

1. **Hosted (OAuth)** — easiest, zero secrets. Just point Claude Code at a URL.
   ```bash
   claude mcp add --transport http <name> <url>
   ```
2. **Local stdio (token)** — runs a subprocess, needs an env var or arg.
   ```bash
   claude mcp add <name> -- <command> [args...]
   ```
3. **Manual edit** — add to `.mcp.json` (project-shared) or `~/.claude.json` (user).

After install, restart Claude Code or run `/mcp` to verify the server is connected.

---

## Recommended MCPs by Category

### Database & Backend Services

| Tech | Type | Install / URL | Notes |
|------|------|---------------|-------|
| **Supabase** | Hosted (OAuth) | `https://mcp.supabase.com` | DB queries, schema, Edge Functions, branches. Append `?read_only=true` for safety. |
| **Firebase** | Built into CLI | `firebase experimental:mcp` | Firestore, Auth, Storage, FCM, Crashlytics, Remote Config |
| **MongoDB** | Local stdio | `npx -y mongodb-mcp-server` | Query, aggregate, schema, Atlas mgmt. Connection string required |
| **Redis** | Local stdio | github.com/redis/mcp-redis | Strings, hashes, JSON, streams, vectors |
| **Prisma** | Built into CLI | `npx prisma mcp` | Migrate status, schema introspection |

### Auth

| Tech | Type | Install / URL | Notes |
|------|------|---------------|-------|
| **Clerk** | Hosted (OAuth) | `https://mcp.clerk.com/mcp` | SDK snippets, user/org/session mgmt |
| **Auth0** | Local stdio | `npx -y @auth0/auth0-mcp-server init` | Apps, APIs, Actions, users, logs |

### Payments & Finance

| Tech | Type | Install / URL | Notes |
|------|------|---------------|-------|
| **Stripe** | Hosted (OAuth) | `https://mcp.stripe.com` | Customers, payments, products, refunds, docs search |
| **Plaid** | Hosted | `https://api.dashboard.plaid.com/mcp` | Link analytics, item health (diagnostics-focused) |

### Email, SMS, Notifications

| Tech | Type | Install / URL | Notes |
|------|------|---------------|-------|
| **Resend** | Local stdio | `npx -y @resend/mcp-send-email` | Send/list emails, contacts, broadcasts, domains |
| **Twilio** | Local stdio | `npm i @twilio-alpha/mcp` | 1,400+ Twilio API endpoints (Alpha) |

### Analytics & Monitoring

| Tech | Type | Install / URL | Notes |
|------|------|---------------|-------|
| **Sentry** | Hosted (OAuth) | `https://mcp.sentry.dev/mcp` | Issues, errors, releases, AI debugging |
| **PostHog** | Hosted | `https://mcp.posthog.com/sse` | Analytics queries, feature flags, experiments |

### Frontend / Design

| Tech | Type | Install / URL | Notes |
|------|------|---------------|-------|
| **Figma** | Local (Desktop) | Enable in Figma Desktop preferences | Selected-frame to code, variables, components. **Paid Dev/Full seat required** |
| **shadcn/ui** | Built into CLI | `npx shadcn@latest mcp` | Component discovery, install from registry |
| **Next.js DevTools** | Local stdio | `npx -y next-devtools-mcp@latest` | Build/runtime/type errors from running dev server (Next.js 16+) |

### Infra & Deploy

| Tech | Type | Install / URL | Notes |
|------|------|---------------|-------|
| **Vercel** | Hosted (OAuth) | `https://mcp.vercel.com` | Projects, deployments, teams, docs |
| **Cloudflare** | Hosted (OAuth) | `https://bindings.mcp.cloudflare.com/sse` (+ others) | Workers, R2, KV, D1, observability — 13+ servers |
| **AWS** | Local stdio | `uvx awslabs.<name>-mcp-server@latest` | 30+ servers — API, docs, Cloud Control, IaC, RDS, Lambda |

### Dev / Collaboration

| Tech | Type | Install / URL | Notes |
|------|------|---------------|-------|
| **GitHub** | Hosted (OAuth) | `https://api.githubcopilot.com/mcp/` | Repos, issues, PRs, code search, Actions, Dependabot |
| **Linear** | Hosted (OAuth) | `https://mcp.linear.app/mcp` | Issues, projects, teams, comments |
| **Notion** | Hosted (OAuth) | `https://mcp.notion.com/mcp` | DB CRUD, search, pages, blocks |
| **Slack** | Hosted (OAuth) | docs.slack.dev/ai/slack-mcp-server | Search, send/read messages, canvases |

---

## Recommended Bundles

**Solo SaaS builder (Next.js + Supabase + Stripe):**
GitHub · Vercel · Supabase · Stripe · Sentry · Resend · Linear · shadcn

**Enterprise team:**
GitHub · Sentry · Linear · Notion · Slack · Cloudflare · AWS · PostHog

**Startup MVP (Firebase stack):**
GitHub · Firebase · Stripe · Sentry · PostHog · Vercel

---

## Skip (No Official MCP)

Tailwind, Drizzle ORM, most CSS/styling tools — agent prompts + docs context are enough. Don't waste a slot on community MCPs unless you've vetted them.

## When to Reference This Doc

Agents should suggest the relevant MCP **only if it's likely already installed** — e.g., `@stripe-specialist` can hint "if you have the Stripe MCP wired (`/setup-mcp stripe`), I can query live products directly." Don't pretend tools exist that aren't connected; check via `/mcp` first.
