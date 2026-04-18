# Claude Code Web Studio

An AI-powered virtual web development studio that runs entirely inside **[Claude Code](https://claude.ai/claude-code)**.

Inspired by [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) — same concept, but built for **web application development**.

> Clone this repo, open Claude Code, and you have a full dev team in your terminal — architects, frontend/backend leads, framework specialists, QA engineers, and more.

## What Is This?

This is **not** a web application. It's a **configuration layer** for Claude Code — a collection of markdown agent definitions, skill workflows, hooks, and docs that turn Claude Code into a structured web development environment.

When you open Claude Code in this directory, you get access to:

- **51 AI agents** organized in a 3-tier studio hierarchy
- **49 slash commands** (skills) covering the full development lifecycle
- **Automated hooks** for commit validation and code quality checks
- **Docs & templates** for architecture, APIs, databases, and more

## Supported Technologies

| Category | Technologies |
|----------|-------------|
| **Frontend** | React, Next.js, Vue, Nuxt, Angular, Svelte, SvelteKit, Astro, HTMX |
| **Backend** | Node.js, Python (Django, FastAPI), Go, Java (Spring Boot), PHP (Laravel), Ruby (Rails), Rust (Axum) |
| **Styling** | Tailwind CSS, CSS Modules, styled-components, Sass |
| **Database** | PostgreSQL, MySQL, MongoDB, Redis, SQLite |
| **BaaS** | Firebase, Supabase |
| **API** | REST, GraphQL, tRPC, gRPC, WebSocket |
| **Infrastructure** | Docker, AWS, GCP, Vercel, Cloudflare Workers, Edge Computing |
| **Monorepo** | Turborepo, Nx, pnpm workspaces |

## Requirements

- [Claude Code](https://claude.ai/claude-code) installed
- Git

That's it. No npm install, no dependencies, no build step.

## Quick Start

```bash
# 1. Clone the repo
git clone https://github.com/nonamexishere/Claude-Code-Web-Studio.git my-project
cd my-project

# 2. Open Claude Code
claude
```

Once inside Claude Code:

```
/start my-awesome-app          # Scaffold a new project
/brainstorm                     # Develop your product idea
/help                           # See what you can do and where to go next
```

## Studio Hierarchy

### Tier 1 — Directors (Strategic Decisions)

| Agent | Role |
|-------|------|
| `@project-architect` | System architecture, tech stack, scalability |
| `@product-owner` | Product vision, features, user stories |
| `@tech-lead` | Code quality, dev practices, PR reviews |

### Tier 2 — Department Leads (Domain Oversight)

| Agent | Role |
|-------|------|
| `@frontend-lead` | Frontend architecture, components, state management |
| `@backend-lead` | API design, services, server performance |
| `@ux-lead` | UX strategy, design system, accessibility |
| `@devops-lead` | CI/CD, deployment, infrastructure |
| `@database-lead` | Data modeling, queries, migrations |
| `@qa-lead` | Test strategy, quality gates, automation |
| `@security-lead` | Application security, OWASP, auth architecture |

### Tier 3 — Specialists (Execution)

#### Frontend Frameworks
| Agent | Specialty |
|-------|-----------|
| `@react-developer` | React 19+, hooks, Server Components |
| `@vue-developer` | Vue 3, Composition API, Pinia |
| `@angular-developer` | Angular, signals, RxJS |
| `@svelte-developer` | Svelte 5, SvelteKit, runes |
| `@nextjs-specialist` | Next.js App Router, Server Actions |
| `@nuxt-specialist` | Nuxt 3, Nitro, auto-imports |
| `@astro-developer` | Astro, islands, content collections |
| `@htmx-specialist` | HTMX, Alpine.js, hypermedia |

#### Frontend Tooling
| Agent | Specialty |
|-------|-----------|
| `@css-specialist` | CSS, responsive, grid, flexbox |
| `@tailwind-specialist` | Tailwind CSS, design systems, shadcn/ui |
| `@typescript-specialist` | Advanced TypeScript, generics |
| `@ui-developer` | Design systems, Storybook |
| `@animation-specialist` | Framer Motion, GSAP, View Transitions |

#### Backend Languages & Frameworks
| Agent | Specialty |
|-------|-----------|
| `@nodejs-developer` | Express, Fastify, NestJS, Hono |
| `@python-developer` | Django, FastAPI, Flask |
| `@go-developer` | Gin, Echo, Fiber, gRPC |
| `@java-developer` | Spring Boot, JPA/Hibernate |
| `@php-developer` | Laravel, Livewire, Inertia |
| `@ruby-developer` | Rails, Hotwire/Turbo, Sidekiq |
| `@rust-developer` | Axum, Actix Web, Tokio |
| `@django-specialist` | DRF, Channels, Celery |
| `@fastapi-specialist` | Pydantic, SQLAlchemy async |

#### API & Data
| Agent | Specialty |
|-------|-----------|
| `@api-designer` | REST, GraphQL, OpenAPI, tRPC |
| `@graphql-specialist` | Apollo, schema design, federation |
| `@sql-specialist` | PostgreSQL, MySQL, optimization |
| `@nosql-specialist` | MongoDB, DynamoDB |
| `@redis-specialist` | Caching, pub/sub, rate limiting |

#### Backend Services
| Agent | Specialty |
|-------|-----------|
| `@auth-specialist` | OAuth2, JWT, SSO, passkeys |
| `@supabase-specialist` | Postgres, Auth, Realtime, RLS |
| `@firebase-specialist` | Firestore, Auth, Functions |
| `@websocket-specialist` | Socket.IO, SSE, real-time |

#### Infrastructure
| Agent | Specialty |
|-------|-----------|
| `@docker-specialist` | Containers, Compose, builds |
| `@cloud-specialist` | AWS, GCP, Vercel, serverless |
| `@edge-specialist` | Cloudflare Workers, edge compute |
| `@monorepo-specialist` | Turborepo, Nx, workspaces |

#### Quality & SEO
| Agent | Specialty |
|-------|-----------|
| `@test-engineer` | Vitest, Playwright, Cypress, TDD |
| `@performance-engineer` | Core Web Vitals, bundle analysis |
| `@accessibility-specialist` | WCAG 2.2, ARIA, keyboard nav |
| `@seo-specialist` | Technical SEO, structured data |
| `@i18n-specialist` | i18next, ICU format, RTL |

#### Documentation
| Agent | Specialty |
|-------|-----------|
| `@technical-writer` | README, API docs, guides |

## Available Skills (49 Commands)

### Setup & Planning
| Command | Description |
|---------|-------------|
| `/start` | Scaffold a new project with framework and tooling |
| `/brainstorm` | Guided product ideation |
| `/help` | Show status, commands, and next steps |
| `/define-features` | Break ideas into user stories |
| `/wireframe` | Text-based wireframes and layouts |
| `/sprint-plan` | Plan development sprint with tasks |

### Architecture & Design
| Command | Description |
|---------|-------------|
| `/create-architecture` | Full system architecture |
| `/design-api` | REST or GraphQL API design |
| `/design-database` | Database schema design |
| `/design-components` | Component hierarchy and state flow |
| `/setup-routing` | Configure page routing and navigation |
| `/setup-theme` | Design system, colors, typography, dark mode |

### Frontend Development
| Command | Description |
|---------|-------------|
| `/create-page` | New page with layout, data fetching, SEO |
| `/create-component` | Reusable component with variants and tests |
| `/create-form` | Form with validation and error handling |
| `/create-list` | Data table/grid with pagination, sort, filter |
| `/setup-state` | State management setup |
| `/add-animation` | Page transitions, micro-interactions |

### Backend Development
| Command | Description |
|---------|-------------|
| `/create-endpoint` | API endpoint with validation |
| `/create-model` | Database model with ORM config |
| `/create-migration` | Database migration with rollback |
| `/create-middleware` | Server middleware (auth, rate limit, etc.) |
| `/setup-auth` | Authentication (JWT, OAuth, sessions) |
| `/setup-graphql` | GraphQL server and/or client |
| `/setup-websocket` | Real-time with WebSocket/Socket.IO/SSE |
| `/setup-redis` | Caching, sessions, queues, rate limiting |
| `/setup-email` | Transactional emails (Resend, SendGrid) |
| `/setup-payments` | Payments (Stripe, LemonSqueezy) |
| `/setup-storage` | File upload and storage (S3, R2) |

### Testing & Quality
| Command | Description |
|---------|-------------|
| `/write-tests` | Unit, integration, or E2E tests |
| `/code-review` | AI code review |
| `/audit-security` | OWASP Top 10 vulnerability scan |
| `/audit-performance` | Core Web Vitals and bundle analysis |
| `/audit-accessibility` | WCAG 2.2 compliance audit |

### SEO & i18n
| Command | Description |
|---------|-------------|
| `/setup-seo` | Meta tags, structured data, sitemap |
| `/setup-i18n` | Internationalization and localization |
| `/setup-analytics` | Analytics tracking (GA4, PostHog, etc.) |
| `/setup-monitoring` | Error and performance monitoring (Sentry) |

### Infrastructure & DevOps
| Command | Description |
|---------|-------------|
| `/setup-docker` | Dockerfile and docker-compose |
| `/setup-cicd` | CI/CD pipeline (GitHub Actions, etc.) |
| `/setup-monorepo` | Monorepo with Turborepo/Nx |
| `/setup-edge` | Edge computing (Cloudflare, Vercel) |
| `/deploy` | Deploy to Vercel, AWS, Railway, etc. |
| `/build` | Production build with analysis |

### Documentation & Team
| Command | Description |
|---------|-------------|
| `/generate-docs` | Auto-generate project documentation |
| `/create-readme` | Comprehensive README |
| `/create-changelog` | Changelog from git history |
| `/team-feature` | Orchestrate full feature build |
| `/team-fullstack` | Full-stack feature: design → build → test |

## Typical Workflow

```
1. PLAN       /brainstorm → /define-features → /create-architecture
2. DESIGN     /wireframe → /setup-theme → /design-api → /design-database
3. BUILD      /create-page → /create-component → /create-endpoint
4. INTEGRATE  /setup-auth → /setup-email → /setup-payments → /setup-i18n
5. TEST       /write-tests → /audit-performance → /audit-accessibility
6. RELEASE    /setup-cicd → /build → /deploy
```

Or ask `/help` at any point to see where you are and what to do next.

## Guided Workflow (Orchestration Layer)

The studio is designed to feel like a guided game — you're never left staring at a blank prompt wondering what to run next.

- **Handoff menus** — every skill ends with a numbered "what's next?" block so you can pick the next step by number or stay and chat.
- **MVP anchor** — `/start` and `/brainstorm` write a one-line MVP to `.claude/session/mvp.md`. It shows up in every skill's Status block so the north star is always visible.
- **Session breadcrumbs** — each skill appends a timestamped line to `.claude/session/active.md`, giving you a running log of what's been done.
- **SessionStart hook** — every time you open Claude Code in this directory, the hook surfaces your MVP, review mode, and the last 40 lines of breadcrumbs so context is never lost.
- **Review gates** — pick a mode during `/start`:
  - `solo` — no gates, move fast
  - `lean` — directors review at phase boundaries (architecture, build, deploy)
  - `full` — directors review after every meaningful skill

At phase-boundary skills, the designated director (project-architect, tech-lead, or product-owner) is auto-spawned to review before the handoff. See `.claude/docs/review-gates.md` for the full trigger matrix.

## Examples

### Build a SaaS with Next.js + Stripe
```
/start my-saas
@project-architect Design architecture for a multi-tenant SaaS
/setup-auth                    # Auth with NextAuth.js
/setup-payments                # Stripe subscriptions
/setup-email                   # Transactional emails with Resend
/setup-redis                   # Caching and rate limiting
```

### Build a REST API with Go
```
/start my-api
@go-developer Set up a Gin API with clean architecture
/design-api                    # Define endpoints
/design-database               # Design schema
/create-middleware auth         # JWT auth middleware
/setup-redis                   # Response caching
```

### Build a content site with Astro
```
/start my-blog
@astro-developer Set up Astro with content collections
/setup-seo                     # SEO optimization
/setup-i18n en,tr              # Multilingual support
/setup-analytics               # Privacy-friendly analytics
```

## Project Structure

```
.claude/
├── agents/               # 51 AI agent definitions
│   ├── project-architect.md
│   ├── react-developer.md
│   ├── go-developer.md
│   ├── django-specialist.md
│   └── ...47 more
├── skills/               # 49 workflow skills
│   ├── start/SKILL.md
│   ├── brainstorm/SKILL.md
│   ├── setup-payments/SKILL.md
│   └── ...46 more
├── hooks/                # Validation + session hooks
│   ├── validate-commit.sh
│   ├── validate-web-assets.sh
│   └── session-start.sh   # Surfaces MVP + breadcrumbs on load
├── docs/                 # Studio documentation
│   ├── agent-roster.md
│   ├── quick-start.md
│   ├── handoff-template.md  # Canonical end-of-skill format
│   └── review-gates.md      # Trigger matrix for director reviews
├── session/              # Runtime state (auto-managed)
│   ├── mvp.md             # One-line MVP anchor
│   ├── active.md          # Timestamped breadcrumbs
│   └── review-mode.txt    # solo / lean / full
└── settings.json         # Permissions and hook config
CLAUDE.md                 # Studio configuration
README.md                 # This file
```

## How It Works

This project uses Claude Code's built-in features:

- **Agents** (`.claude/agents/*.md`) — Each markdown file defines an AI agent with a specific role, expertise, model tier, and allowed tools. Claude Code loads these automatically.
- **Skills** (`.claude/skills/*/SKILL.md`) — Each skill is a slash command that guides Claude through a structured workflow. Type `/skill-name` to run one.
- **Hooks** (`.claude/hooks/*.sh`) — Bash scripts that run automatically on certain events (before commits, after file edits) to enforce quality standards.
- **Settings** (`.claude/settings.json`) — Permissions, denied commands, and hook configuration.

No custom runtime, no API keys needed, no server to run. It's just configuration that makes Claude Code smarter about web development.

## Contributing

Contributions are welcome:

- Add new agents for frameworks or tools you use
- Create new skills for workflows you need
- Improve existing agent prompts with better expertise
- Add more hooks for quality enforcement
- Report issues or suggest features

## License

MIT

## Acknowledgments

- [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) by Donchitos — the original inspiration
- [Anthropic](https://www.anthropic.com/) — for Claude Code
