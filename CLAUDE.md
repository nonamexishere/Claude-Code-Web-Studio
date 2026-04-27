# Claude Web Studio

An AI-powered virtual web development studio that runs entirely inside Claude Code.
Inspired by [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios),
built for full-stack web application development.

## Studio Structure

This project provides a **three-tier agent hierarchy** modeled after a professional
web development agency:

- **Tier 1 — Directors** (Opus): Project Architect, Product Owner, Tech Lead
- **Tier 2 — Department Leads** (Sonnet): Frontend, Backend, UX/UI, DevOps, Database, QA, Security
- **Tier 3 — Specialists** (Sonnet/Haiku): React, Next.js, Vue, Svelte, Astro, Node.js, Go, Java, Python, Ruby, PHP, Rust, GraphQL, Redis, Firebase, Supabase, and more

## Supported Technologies

- **Frontend**: React, Next.js, Vue, Nuxt, Angular, Svelte, SvelteKit, Astro, HTMX
- **Backend**: Node.js, Python (Django, FastAPI), Go, Java (Spring), PHP (Laravel), Ruby (Rails), Rust (Axum)
- **Styling**: Tailwind CSS, CSS Modules, styled-components, Sass
- **Database**: PostgreSQL, MySQL, MongoDB, Redis, SQLite
- **BaaS**: Firebase, Supabase
- **API**: REST, GraphQL, tRPC, gRPC, WebSocket, SSE
- **Infrastructure**: Docker, AWS, GCP, Vercel, Cloudflare Workers, Edge Computing
- **Monorepo**: Turborepo, Nx, pnpm workspaces

## How to Use

### Start a New Project
```
/start
```

### Brainstorm an Idea
```
/brainstorm saas dashboard
```

### Design Your Architecture
```
/create-architecture
/design-api
/design-database
/setup-routing
/setup-theme
```

### Build Features
```
/create-page dashboard
/create-component Button --variants primary,secondary,danger
/create-endpoint POST /api/users
/create-form LoginForm
/create-list users --type table
/create-migration add-users-table
/create-middleware auth
/add-animation fade-in
```

### Backend & Integration
```
/setup-auth
/setup-graphql
/setup-websocket
/setup-redis
/setup-email
/setup-payments
/setup-storage
/setup-i18n
/setup-seo
/setup-analytics
/setup-monitoring
```

### Quality & Deployment
```
/write-tests
/code-review
/audit-security
/audit-performance
/audit-accessibility
/setup-docker
/setup-cicd
/build
/deploy vercel
```

### Vendor MCP Integration
```
/setup-mcp stripe              # Stripe MCP for live products/customers
/setup-mcp sentry              # Sentry MCP for issues and releases
/setup-mcp supabase            # Supabase MCP for DB queries / Edge Functions
/setup-mcp github              # GitHub MCP for PRs, issues, Actions
```
Catalog: `.claude/docs/mcp-servers.md`

### Get Help
```
/help
/help agents
/help skills
/help workflow
```

## Agent Usage

Talk to any agent directly:
```
@project-architect What's the best architecture for a multi-tenant SaaS app?
@frontend-lead Should we use Next.js or Vite+React for this project?
@react-developer Create a data table component with sorting and pagination
@go-developer Build a REST API with Gin and clean architecture
@django-specialist Set up DRF with JWT authentication
@graphql-specialist Design a schema for an e-commerce app
@redis-specialist Set up caching for my API responses
```

## Project Conventions

- All source code goes in `src/`
- Frontend code in `src/client/` or `src/frontend/`
- Backend code in `src/server/` or `src/backend/`
- Shared types/utils in `src/shared/`
- Tests mirror source structure in `tests/`
- Documentation in `docs/`
- Design documents in `design/`
- Infrastructure config in `infra/`

## Commit Convention

Use conventional commits:
- `feat:` new feature
- `fix:` bug fix
- `refactor:` code restructuring
- `docs:` documentation
- `test:` tests
- `chore:` tooling, deps, config
- `style:` formatting, CSS
- `perf:` performance improvement
