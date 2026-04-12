# Claude Code Web Studio

An AI-powered virtual web development studio that runs entirely inside **[Claude Code](https://claude.ai/code)**.

Inspired by [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) — same concept, but built for **web application development**.

> Clone this repo, open Claude Code, and you have a full dev team in your terminal — architects, frontend/backend leads, framework specialists, QA engineers, and more.

## What Is This?

This is **not** a web application. It's a **configuration layer** for Claude Code — a collection of markdown agent definitions, skill workflows, hooks, and docs that turn Claude Code into a structured web development environment.

When you open Claude Code in this directory, you get access to:

- **28 AI agents** organized in a 3-tier studio hierarchy
- **26 slash commands** (skills) covering the full development lifecycle
- **Automated hooks** for commit validation and code quality checks
- **Docs & templates** for architecture, APIs, databases, and more

## Requirements

- [Claude Code](https://claude.ai/code) installed
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
| `project-architect` | System architecture, tech stack, scalability |
| `product-owner` | Product vision, features, user stories |
| `tech-lead` | Code quality, dev practices, PR reviews |

### Tier 2 — Department Leads (Domain Oversight)

| Agent | Role |
|-------|------|
| `frontend-lead` | Frontend architecture, components, state management |
| `backend-lead` | API design, services, server performance |
| `ux-lead` | UX strategy, design system, accessibility |
| `devops-lead` | CI/CD, deployment, infrastructure |
| `database-lead` | Data modeling, queries, migrations |
| `qa-lead` | Test strategy, quality gates, automation |
| `security-lead` | Application security, OWASP, auth architecture |

### Tier 3 — Specialists (Execution)

| Area | Agents |
|------|--------|
| **Frontend** | `react-developer`, `vue-developer`, `angular-developer`, `css-specialist`, `typescript-specialist`, `ui-developer` |
| **Backend** | `nodejs-developer`, `python-developer`, `api-designer`, `auth-specialist` |
| **Data** | `sql-specialist`, `nosql-specialist` |
| **Infrastructure** | `docker-specialist`, `cloud-specialist` |
| **Quality** | `test-engineer`, `performance-engineer`, `accessibility-specialist` |
| **Docs** | `technical-writer` |

Talk to any agent directly:

```
@project-architect Should I use a monolith or microservices for this?
@frontend-lead Next.js App Router or Vite + React Router?
@react-developer Build a data table component with sorting and pagination
@security-lead Review our authentication flow
```

## Available Skills

### Project Setup
| Command | Description |
|---------|-------------|
| `/start` | Scaffold a new project with framework, tooling, and folder structure |
| `/brainstorm` | Guided product ideation — from rough idea to structured spec |
| `/help` | Show project status, available commands, and next step suggestions |

### Architecture & Design
| Command | Description |
|---------|-------------|
| `/create-architecture` | Full system architecture with Mermaid diagrams |
| `/design-api` | REST or GraphQL API schema with endpoints and types |
| `/design-database` | Database schema with tables, relations, and indexes |
| `/design-components` | Component hierarchy, props, and state flow |
| `/wireframe` | Text-based wireframes and layout descriptions |
| `/define-features` | Break ideas into user stories with acceptance criteria |

### Frontend Development
| Command | Description |
|---------|-------------|
| `/create-page` | New page/route with layout, data fetching, and SEO |
| `/create-component` | Reusable component with props, types, styles, and tests |
| `/create-form` | Form with validation, error handling, and submission |
| `/setup-state` | Configure state management (Context, Zustand, Pinia, etc.) |

### Backend Development
| Command | Description |
|---------|-------------|
| `/create-endpoint` | API endpoint with validation and error handling |
| `/create-model` | Database model with ORM config and migration |
| `/setup-auth` | Authentication setup (JWT, OAuth, sessions, third-party) |

### Testing & Quality
| Command | Description |
|---------|-------------|
| `/write-tests` | Unit, integration, or E2E tests for any module |
| `/code-review` | AI code review for bugs, security, and performance |
| `/audit-security` | OWASP Top 10 vulnerability scan |
| `/audit-performance` | Core Web Vitals and bundle analysis |

### DevOps & Deployment
| Command | Description |
|---------|-------------|
| `/setup-docker` | Dockerfile, docker-compose, and container config |
| `/setup-cicd` | CI/CD pipeline (GitHub Actions, GitLab CI, etc.) |
| `/deploy` | Deployment config for Vercel, AWS, Railway, Fly.io, etc. |

### Documentation
| Command | Description |
|---------|-------------|
| `/generate-docs` | Auto-generate API docs, architecture docs, or setup guides |
| `/create-readme` | Comprehensive README for your project |

### Team & Planning
| Command | Description |
|---------|-------------|
| `/sprint-plan` | Plan development sprint with task breakdown |
| `/team-fullstack` | Orchestrate full-stack feature: design → build → test |

## Typical Workflow

```
/start my-saas-app               # 1. Scaffold project
/brainstorm                       # 2. Define product idea
/create-architecture              # 3. Design system architecture
/design-api                       # 4. Plan API endpoints
/design-database                  # 5. Model your data
/create-page dashboard            # 6. Build pages
/create-endpoint POST /api/users  # 7. Build API
/setup-auth jwt                   # 8. Add authentication
/write-tests src/                 # 9. Write tests
/code-review                      # 10. Review code quality
/setup-docker                     # 11. Containerize
/deploy vercel                    # 12. Ship it
```

Or ask `/help` at any point to see where you are and what to do next.

## Project Structure

```
.claude/
├── agents/          # 28 agent definitions (markdown)
│   ├── project-architect.md
│   ├── frontend-lead.md
│   ├── react-developer.md
│   └── ...
├── skills/          # 26 skill workflows (SKILL.md)
│   ├── start/
│   ├── brainstorm/
│   ├── create-component/
│   └── ...
├── hooks/           # Automated validation scripts
│   ├── validate-commit.sh
│   └── validate-web-assets.sh
├── docs/            # Studio documentation
│   ├── agent-roster.md
│   └── quick-start.md
└── settings.json    # Permissions and hook configuration
```

## How It Works

This project uses Claude Code's built-in features:

- **Agents** (`.claude/agents/*.md`) — Each markdown file defines an AI agent with a specific role, expertise, model tier, and allowed tools. Claude Code loads these automatically.
- **Skills** (`.claude/skills/*/SKILL.md`) — Each skill is a slash command that guides Claude through a structured workflow. Type `/skill-name` to run one.
- **Hooks** (`.claude/hooks/*.sh`) — Bash scripts that run automatically on certain events (before commits, after file edits) to enforce quality standards.
- **Settings** (`.claude/settings.json`) — Permissions, denied commands, and hook configuration.

No custom runtime, no API keys needed, no server to run. It's just configuration that makes Claude Code smarter about web development.

## Contributing

This is an early MVP. Contributions are welcome:

- Add new agents for frameworks or tools you use
- Create new skills for workflows you need
- Improve existing agent prompts with better expertise
- Add more hooks for quality enforcement
- Translate docs to other languages

## License

MIT

## Acknowledgments

- [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) by Donchitos — the original inspiration for the agent/skill/hook architecture pattern
- [Claude Code](https://claude.ai/code) by Anthropic
