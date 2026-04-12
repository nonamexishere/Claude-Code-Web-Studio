---
name: setup-seo
description: "Set up SEO: meta tags, Open Graph, structured data (JSON-LD), sitemap, robots.txt, and Core Web Vitals optimization."
argument-hint: ""
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project framework** from config files.

2. **Ask about SEO needs** using `AskUserQuestion`:

   - Tab "Type" — "Site type for structured data?"
     Options: SaaS App / E-commerce / Blog-Content / Portfolio / Documentation / Landing Page
   - Tab "Features" — "SEO features?"
     Options (multi): Meta tags / Open Graph / Twitter Cards / JSON-LD structured data / Sitemap / Robots.txt / RSS feed

3. **Generate SEO setup**:

   - **Meta tag management** (framework-specific):
     - Next.js: Metadata API (generateMetadata)
     - Nuxt: useSeoMeta / useHead
     - SvelteKit: +page.ts load with SEO
     - Astro: <head> in Layout
   - **Default meta**: title template, description, canonical URL, viewport
   - **Open Graph**: og:title, og:description, og:image, og:url, og:type
   - **Twitter Card**: twitter:card, twitter:title, twitter:image
   - **Structured data (JSON-LD)**:
     - Organization / WebSite schema
     - Page-specific: Article, Product, FAQ, BreadcrumbList, HowTo
     - Type-safe JSON-LD component
   - **Sitemap**: Dynamic XML sitemap generation
   - **Robots.txt**: Allow/disallow rules, sitemap reference
   - **RSS feed** (for content sites): Atom/RSS feed generation
   - **Canonical URLs**: Prevent duplicate content

4. **Performance for SEO**:
   - Image optimization (next/image, @nuxt/image, etc.)
   - Font loading strategy (display: swap, preload)
   - Core Web Vitals checklist

5. **Suggest next steps**:
   1. "Run `/audit-performance` to check Core Web Vitals"
   2. "Run `/setup-analytics` to track SEO performance"
   3. "Talk to `@seo-specialist` for keyword strategy"
