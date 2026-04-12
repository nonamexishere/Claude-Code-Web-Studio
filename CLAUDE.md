# Claude Web Studio

An AI-powered virtual web development studio that runs entirely inside Claude Code.
Inspired by [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios),
adapted for full-stack web application development.

## Studio Structure

This project provides a **three-tier agent hierarchy** modeled after a professional
web development agency:

- **Tier 1 — Directors** (Opus): Project Architect, Product Owner, Tech Lead
- **Tier 2 — Department Leads** (Sonnet): Frontend, Backend, UX/UI, DevOps, Database, QA, Security
- **Tier 3 — Specialists** (Sonnet/Haiku): React, Vue, Angular, Node.js, Python, Docker, Testing, etc.

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
```

### Build Features
```
/create-component Button --variants primary,secondary,danger
/create-endpoint POST /api/users
/create-page dashboard
```

### Quality & Deployment
```
/code-review
/write-tests
/audit-security
/setup-docker
/deploy vercel
```

## Agent Usage

Talk to any agent directly:
```
@project-architect What's the best architecture for a multi-tenant SaaS app?
@frontend-lead Should we use Next.js or Vite+React for this project?
@react-developer Create a data table component with sorting and pagination
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
