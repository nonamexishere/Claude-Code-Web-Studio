---
name: setup-mcp
description: "Install an officially-published MCP (Model Context Protocol) server for a service in your stack — Stripe, Sentry, GitHub, Supabase, Vercel, etc."
argument-hint: "[service name, e.g. stripe|sentry|supabase|github|vercel]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Read the catalog** at `.claude/docs/mcp-servers.md` — that doc is the source of truth for which MCPs we recommend, their install command, and what each provides.

2. **Determine which MCP** the user wants:
   - If the argument matches a tech in the catalog (e.g. `stripe`, `supabase`), proceed.
   - Otherwise, use `AskUserQuestion` with categories to narrow down. Show the most relevant options based on the user's project (run `Glob` for `package.json` / lockfiles to detect the stack):
     - **Database/Backend**: Supabase, Firebase, MongoDB, Redis, Prisma
     - **Auth**: Clerk, Auth0
     - **Payments/Email**: Stripe, Plaid, Resend, Twilio
     - **Analytics/Monitoring**: Sentry, PostHog
     - **Frontend/Design**: Figma, shadcn, Next.js DevTools
     - **Infra/Deploy**: Vercel, Cloudflare, AWS
     - **Dev/Collaboration**: GitHub, Linear, Notion, Slack

3. **Show the install plan** before executing. Surface from the catalog:
   - Type (Hosted OAuth / Local stdio / Built into CLI)
   - Exact command
   - What auth/setup the user needs (API key, paid plan, OAuth, etc.)
   - What the MCP provides

4. **Confirm before installing**. Use `AskUserQuestion`:
   - "Run install now?" — Yes / No
   - If the MCP needs an API key the user doesn't have yet, abort and tell them how to get one.

5. **Run the install command** via `Bash`. Common patterns:
   - Hosted OAuth: `claude mcp add --transport http <name> <url>`
   - Local stdio: `claude mcp add <name> -- <command> [args...]`
   - Built-in: just document — don't run, since the CLI already provides it

6. **Verify** by running `claude mcp list` (if available) or instruct user to run `/mcp` in Claude Code to check the connection.

7. **For OAuth-based servers**, tell the user:
   > "Open Claude Code and run `/mcp` to start the OAuth flow for `<name>`. You'll be redirected to the vendor's site to authorize."

8. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-mcp — [YYYY-MM-DD HH:MM]
     - Action: installed [service] MCP — [hosted|local|built-in]
     - Recommended next: complete OAuth flow / set env var, then verify with /mcp
     ```
   - Render the handoff block. Pick the recommended based on what was installed:
     - For Supabase/Firebase: `/setup-auth` or `/design-database` to put it to use
     - For Stripe: `/setup-payments` to wire it into the app
     - For Sentry/PostHog: `/setup-monitoring` or `/setup-analytics`
     - For GitHub/Linear: `/sprint-plan` or `/code-review`
     - For Vercel/Cloudflare: `/deploy` for the next deploy
     - For Figma: `/wireframe` or `/design-components`
   - Always include: `/setup-mcp` (install another), `/help` (what's next), `@tech-lead` (review setup)
