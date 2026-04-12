---
name: generate-docs
description: "Auto-generate API documentation, architecture docs, or developer guides from the codebase."
argument-hint: "[type: api|architecture|setup|all]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit
---

When this skill is invoked:

1. **Determine doc type** from argument. Default to 'all'.

2. **Generate based on type**:

   **API docs**: Scan route files, extract endpoints, generate markdown with:
   - Endpoint table (method, path, auth, description)
   - Request/response examples
   - Error codes

   **Architecture docs**: Read codebase structure and generate:
   - System overview with Mermaid diagram
   - Directory structure explanation
   - Data flow description
   - Key design decisions

   **Setup docs**: Analyze package.json, config files, generate:
   - Prerequisites
   - Installation steps
   - Environment variable reference
   - Development workflow commands

3. **Write to `docs/`** directory.

4. **Suggest**: `/create-readme` for a polished README.
