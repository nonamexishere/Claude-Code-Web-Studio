---
name: setup-docker
description: "Create Dockerfile, docker-compose.yml, and container configuration for development and production."
argument-hint: "[target: dev|prod|both]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

When this skill is invoked:

1. **Analyze the project** to determine:
   - Runtime (Node.js, Python, etc.) and version
   - Package manager (npm, pnpm, yarn, pip)
   - Build steps required
   - Services needed (database, cache, etc.)

2. **Generate Dockerfile** with:
   - Multi-stage build (build stage + runtime stage)
   - Minimal base image (Alpine or distroless)
   - Non-root user
   - Proper layer caching (copy package files first, then source)
   - Health check
   - `.dockerignore` file

3. **Generate docker-compose.yml** with:
   - App service with build context
   - Database service (PostgreSQL/MySQL/MongoDB)
   - Cache service (Redis) if needed
   - Volume mounts for development hot-reload
   - Network configuration
   - Environment variable management
   - Health checks and depends_on

4. **Generate docker-compose.dev.yml** override for development:
   - Volume mounts for source code
   - Debug ports exposed
   - Hot-reload enabled

5. **Add convenience scripts** to package.json:
   - `docker:dev` — start development environment
   - `docker:build` — build production image
   - `docker:prod` — run production locally

6. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-docker — [YYYY-MM-DD HH:MM]
     - Action: generated Dockerfile + docker-compose ([target])
     - Recommended next: /setup-cicd
     ```
   - Render the handoff block with:
     - `/setup-cicd` — automate builds and deployments *(recommended)*
     - `/deploy` — configure cloud deployment
     - `/audit-security` — scan image for vulnerabilities
     - `/setup-monitoring` — add container-aware monitoring
     - `@devops-lead` — discuss image hardening and registry strategy
