---
name: create-architecture
description: "Produce full system architecture: frontend, backend, database, infrastructure, and data flow. Generates architecture document with Mermaid diagrams."
argument-hint: "[focus area, e.g. 'microservices' or 'serverless']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, WebSearch, AskUserQuestion, Task
---

When this skill is invoked:

1. **Read existing context**:
   - `design/product-spec.md` for product requirements
   - `docs/tech-stack.md` for technology choices
   - `docs/architecture.md` if updating existing architecture

2. **Gather requirements** via `AskUserQuestion` if not available:
   - Tab "Scale" — Expected users: <100 / <10K / <100K / 100K+
   - Tab "Style" — Architecture style: Monolith / Modular monolith / Microservices / Serverless

3. **Design the architecture** covering:

   **System Overview** — High-level system diagram (Mermaid):
   ```mermaid
   graph TB
     Client[Browser/Mobile] --> CDN[CDN/Edge]
     CDN --> FE[Frontend App]
     FE --> API[API Gateway]
     API --> Auth[Auth Service]
     API --> Core[Core Service]
     Core --> DB[(Database)]
     Core --> Cache[(Redis Cache)]
   ```

   **Frontend Architecture**:
   - Rendering strategy (CSR/SSR/SSG/ISR)
   - Routing and code splitting approach
   - State management architecture
   - Component hierarchy overview

   **Backend Architecture**:
   - API layer design (REST/GraphQL/tRPC)
   - Service layer and business logic organization
   - Middleware chain
   - Error handling strategy

   **Data Architecture**:
   - Database schema overview (ER diagram in Mermaid)
   - Caching strategy
   - Data flow patterns

   **Infrastructure**:
   - Deployment topology
   - CI/CD pipeline overview
   - Environment strategy (dev/staging/prod)
   - Monitoring and logging

   **Security Architecture**:
   - Authentication flow
   - Authorization model
   - Data protection approach

4. **Write `docs/architecture.md`** with all sections and diagrams.

5. **Create ADR template** at `docs/adr/001-initial-architecture.md`.

6. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /create-architecture — [YYYY-MM-DD HH:MM]
     - Action: wrote docs/architecture.md + ADR
     - Recommended next: /design-database
     ```
   - Render the handoff block with:
     - `/design-database` — model the data this architecture implies *(recommended)*
     - `/design-api` — define API contracts between layers
     - `/setup-routing` — wire up the frontend routing
     - `/sprint-plan` — turn the architecture into sprint tasks
     - `@project-architect` — challenge any architectural choice
