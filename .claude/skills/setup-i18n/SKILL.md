---
name: setup-i18n
description: "Set up internationalization: translation framework, locale routing, RTL support, date/number formatting, and content management."
argument-hint: "[languages: en,tr,de,fr,...]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project framework** from config files.

2. **Ask about i18n needs** using `AskUserQuestion`:

   - Tab "Languages" — "Target languages?"
     Options: 2 languages / 3-5 languages / 5+ languages / Custom list
   - Tab "Routing" — "Locale in URL?"
     Options: Path prefix (/en/about) / Subdomain (en.site.com) / Cookie/header only / No URL locale
   - Tab "RTL" — "RTL language support needed?"
     Options: Yes (Arabic, Hebrew, Farsi, Urdu) / No

3. **Generate i18n setup** based on framework:

   **Next.js (next-intl)**:
   - next-intl configuration with middleware
   - Messages directory with JSON locale files
   - useTranslations hook usage
   - generateStaticParams for locale routes
   - Locale switcher component

   **Nuxt (@nuxtjs/i18n)**:
   - Module configuration in nuxt.config
   - Locale files with lazy loading
   - useI18n composable usage
   - LocalePathStrategy routing

   **React (i18next)**:
   - i18next + react-i18next setup
   - Namespace-based translation files
   - Language detector (browser, URL, cookie)
   - useTranslation hook usage

   **SvelteKit (Paraglide)**:
   - Paraglide setup with project.inlang
   - Type-safe message functions
   - Localized routing

4. **Generate supporting files**:
   - Default locale file (en.json) with common translations
   - Locale switcher component
   - RTL CSS setup (if needed, with CSS logical properties)
   - SEO: hreflang meta tags, localized sitemap
   - Date/number formatting utilities using Intl API

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-i18n — [YYYY-MM-DD HH:MM]
     - Action: wired i18n for [languages] with [routing strategy]
     - Recommended next: /setup-seo
     ```
   - Render the handoff block with:
     - `/setup-seo` — add hreflang tags and localized meta *(recommended)*
     - `/create-component LocaleSwitcher` — build the language switcher UI
     - `/audit-accessibility` — verify RTL and screen-reader locale switching
     - `/create-page` — build locale-aware pages
     - `@i18n-specialist` — discuss translation workflow and tooling
