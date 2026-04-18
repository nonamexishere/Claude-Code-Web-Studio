---
name: create-readme
description: "Generate comprehensive README with project overview, setup, usage, and contribution guide."
argument-hint: ""
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

When this skill is invoked:

1. **Analyze the project**: package.json, tech stack, directory structure, existing docs.

2. **Generate README.md** with sections:
   - Project name and one-line description
   - Badges (build status, license, version)
   - Screenshot/demo placeholder
   - Features list
   - Tech stack table
   - Prerequisites
   - Quick start (clone, install, configure, run)
   - Environment variables reference
   - Project structure overview
   - Available scripts
   - API reference (if applicable)
   - Contributing guide
   - License

3. **Write to project root** as `README.md`.

4. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /create-readme — [YYYY-MM-DD HH:MM]
     - Action: generated README.md
     - Recommended next: /generate-docs
     ```
   - Render the handoff block with:
     - `/generate-docs` — expand into API and architecture docs *(recommended)*
     - `/create-changelog` — add release notes
     - `/build` — verify the setup steps actually work
     - `/deploy` — ship now that docs reflect the project
     - `@technical-writer` — polish README tone and structure
