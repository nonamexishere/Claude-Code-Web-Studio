---
name: setup-monitoring
description: "Set up error monitoring and performance tracking: Sentry, LogRocket, Datadog, or custom monitoring with alerts."
argument-hint: "[provider: sentry|logrocket|datadog]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project framework** from config files.

2. **Ask about monitoring needs** using `AskUserQuestion`:

   - Tab "Provider" — "Monitoring service?"
     Options: Sentry / LogRocket / Datadog / Highlight.io / BetterStack / Custom
   - Tab "Features" — "What to monitor?"
     Options (multi): Errors-Exceptions / Performance (Web Vitals) / Session replay / Logging / Uptime

3. **Generate monitoring setup**:

   - **Error tracking**:
     - Global error boundary (React/Vue/Svelte)
     - Unhandled rejection catching
     - Server-side error capture
     - Source map upload for readable stack traces
     - User context attachment
   - **Performance monitoring**:
     - Core Web Vitals (LCP, INP, CLS)
     - API response times
     - Custom performance marks
     - Transaction tracing
   - **Structured logging**:
     - Log levels (debug, info, warn, error)
     - Request ID propagation
     - JSON structured format
     - Log aggregation integration
   - **Alerting**: Error rate thresholds, performance degradation alerts
   - **Source maps**: Build-time upload script for CI/CD

4. **Write configuration** and integration files.

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-monitoring — [YYYY-MM-DD HH:MM]
     - Action: wired [provider] for [features]
     - Recommended next: /setup-cicd
     ```
   - Render the handoff block with:
     - `/setup-cicd` — automate source map uploads on deploy *(recommended)*
     - `/audit-performance` — establish a performance baseline
     - `/setup-analytics` — pair error data with user event data
     - `/write-tests` — add tests that exercise error paths
     - `@devops-lead` — discuss alerting thresholds and on-call policy
