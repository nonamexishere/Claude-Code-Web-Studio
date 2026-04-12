---
name: setup-analytics
description: "Set up web analytics and event tracking: Google Analytics 4, PostHog, Mixpanel, Plausible, or Umami with privacy compliance."
argument-hint: "[provider: ga4|posthog|mixpanel|plausible|umami]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project framework** from config files.

2. **Ask about analytics needs** using `AskUserQuestion`:

   - Tab "Provider" — "Analytics provider?"
     Options: Google Analytics 4 / PostHog / Mixpanel / Plausible / Umami / Segment (multi-provider) / Custom
   - Tab "Privacy" — "Privacy approach?"
     Options: Cookie consent required (GDPR) / Cookieless (Plausible/Umami) / Consent banner with granular control

3. **Generate analytics setup**:

   - **Analytics service** (abstraction layer):
     - initialize() — load SDK with consent check
     - trackPageView(path) — automatic via router
     - trackEvent(name, properties) — custom events
     - setUser(id, traits) — identify user
     - resetUser() — on logout
   - **Standard events**: page_view, sign_up, login, purchase, search, error
   - **Page view tracking**: Auto-track via router integration (Next.js, Nuxt, SvelteKit, etc.)
   - **Cookie consent**: GDPR-compliant consent banner component
   - **Privacy compliance**:
     - Consent management (opt-in before tracking)
     - Cookie policy generation
     - Do Not Track respect
     - Data anonymization options
   - **Framework integration**: Next.js Script, Nuxt plugin, SvelteKit hooks

4. **Write files** to `src/analytics/` or `src/lib/analytics/`.

5. **Suggest next steps**:
   1. "Run `/setup-seo` to optimize search visibility"
   2. "Run `/setup-monitoring` to add error and performance monitoring"
