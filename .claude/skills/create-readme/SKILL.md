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
