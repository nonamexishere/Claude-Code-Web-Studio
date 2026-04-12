---
name: start
description: "Project onboarding and setup wizard. Walks through tech stack selection, folder structure creation, and initial configuration."
argument-hint: "[project-name]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Welcome the user** and explain the studio concept briefly.

2. **Gather project information** using `AskUserQuestion`:

   - Tab "Project Type" — "What are you building?"
     Options: SaaS App / E-commerce / Dashboard / Landing Page / API / Blog-CMS / Real-time App / Other
   - Tab "Frontend" — "Frontend framework?"
     Options: React (Vite) / Next.js / Vue (Vite) / Nuxt / Angular / Astro / None (API only)
   - Tab "Backend" — "Backend framework?"
     Options: Express / Fastify / NestJS / Django / FastAPI / Flask / Hono / None (static)
   - Tab "Database" — "Database?"
     Options: PostgreSQL / MySQL / SQLite / MongoDB / Redis / Supabase / None yet

3. **Gather additional context**:
   - Tab "Styling" — "CSS approach?"
     Options: Tailwind CSS / CSS Modules / styled-components / Sass / Vanilla CSS
   - Tab "Language" — "TypeScript or JavaScript?"
     Options: TypeScript (recommended) / JavaScript
   - Tab "Package Manager" — "Package manager?"
     Options: npm / pnpm / yarn / bun

4. **Create the project structure** based on selections:
   - Initialize the project with the chosen package manager
   - Set up folder structure following project conventions from CLAUDE.md
   - Create initial configuration files (tsconfig, eslint, prettier, etc.)
   - Set up the chosen framework with a basic hello-world page
   - Initialize git repository

5. **Generate initial documents**:
   - `docs/architecture.md` — initial architecture overview
   - `docs/tech-stack.md` — chosen technologies with rationale

6. **Suggest next steps**:
   1. "Run `/brainstorm` to flesh out your product idea"
   2. "Run `/design-api` to plan your API endpoints"
   3. "Run `/design-database` to model your data"
   4. "Run `/create-architecture` for a full system architecture"
   5. "Talk to `@project-architect` for architecture guidance"
