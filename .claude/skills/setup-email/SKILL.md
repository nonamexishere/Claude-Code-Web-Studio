---
name: setup-email
description: "Set up email: transactional emails with Resend, SendGrid, or Postmark, React Email templates, and email verification flows."
argument-hint: "[provider: resend|sendgrid|postmark|ses]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Ask about email needs** using `AskUserQuestion`:

   - Tab "Provider" — "Email service?"
     Options: Resend / SendGrid / Postmark / AWS SES / Mailgun / Nodemailer (SMTP)
   - Tab "Templates" — "Email template approach?"
     Options: React Email / MJML / HTML templates / Plain text only
   - Tab "Types" — "Email types needed?"
     Options (multi): Welcome / Email verification / Password reset / Invoice-Receipt / Notification / Marketing newsletter

2. **Generate email setup**:

   - **Email service** with methods:
     - sendEmail(to, template, data)
     - sendBulk(recipients, template, data)
     - Template rendering with data injection
   - **Templates** (React Email or MJML):
     - Welcome email
     - Email verification with magic link
     - Password reset
     - Notification digest
     - Base layout (header, footer, styling)
   - **Email verification flow**:
     - Token generation and storage
     - Verification endpoint
     - Resend logic with rate limiting
   - **Queue integration**: Send emails via job queue (non-blocking)
   - **Preview**: Development email preview route

3. **Write files** to `src/email/` or `src/lib/email/`.

4. **MCP shortcut**: If the Resend MCP is connected (via `/setup-mcp resend`), send test emails, manage domains/contacts, and inspect deliverability directly. See `.claude/docs/mcp-servers.md`.

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-email — [YYYY-MM-DD HH:MM]
     - Action: wired [provider] email with [templates] + [types]
     - Recommended next: /setup-auth
     ```
   - Render the handoff block with:
     - `/setup-auth` — integrate email verification / password reset flows *(recommended)*
     - `/setup-redis` — queue emails for non-blocking send
     - `/create-form` — build email-related forms (subscribe, contact)
     - `/write-tests` — cover template rendering and send logic
     - `@backend-lead` — discuss deliverability and bounce handling
