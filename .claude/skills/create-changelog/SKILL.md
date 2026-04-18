---
name: create-changelog
description: "Generate a changelog from git history. Groups changes by type and formats for release notes."
argument-hint: "[version]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, Write, AskUserQuestion
---

When this skill is invoked:

1. **Determine version range**:
   - If version argument provided, generate changelog for that version
   - Otherwise, generate from last tag to HEAD

2. **Read git history** using conventional commit format:
   - Parse commit messages for type (feat, fix, refactor, etc.)
   - Group by: Features, Bug Fixes, Performance, Breaking Changes, Other

3. **Generate changelog** in Keep a Changelog format:

   ```markdown
   ## [1.2.0] - 2024-01-15

   ### Added
   - Dark mode support with system preference detection
   - GraphQL subscriptions for real-time updates

   ### Fixed
   - Login redirect loop on expired sessions
   - Table sorting not persisting across navigation

   ### Changed
   - Migrated from Express to Hono for 3x faster response times
   - Updated Next.js from 14 to 15

   ### Breaking Changes
   - API response format changed for pagination endpoints
   ```

4. **Write to** `CHANGELOG.md` (append to top).

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /create-changelog — [YYYY-MM-DD HH:MM]
     - Action: appended [version] to CHANGELOG.md
     - Recommended next: /build
     ```
   - Render the handoff block with:
     - `/build` — create the production build for this release *(recommended)*
     - `/deploy` — ship the release to production
     - `/create-readme` — refresh README badges and version
     - `/audit-security` — last security check before release
     - `@tech-lead` — review release notes and breaking changes
