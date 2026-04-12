---
name: create-page
description: "Generate a new page/route with layout, components, and data fetching."
argument-hint: "<page-name> [--layout dashboard|auth|public]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

When this skill is invoked:

1. **Parse the argument** for page name and layout type.
   Auto-detect framework and routing approach from the project.

2. **Read existing patterns**:
   - Check existing pages for layout patterns
   - Check routing configuration
   - Check data fetching patterns (server components, loaders, etc.)

3. **Generate the page** with:
   - Route file in the correct location for the framework
   - Page component with proper data fetching
   - Loading state (Suspense boundary or loading component)
   - Error state (Error boundary or error component)
   - SEO meta tags (title, description, og tags)
   - Breadcrumb data if applicable

4. **Framework-specific patterns**:
   - **Next.js App Router**: `page.tsx`, `layout.tsx`, `loading.tsx`, `error.tsx`
   - **Next.js Pages**: `pages/name.tsx` with `getServerSideProps` or `getStaticProps`
   - **React Router**: Route component + lazy loading
   - **Nuxt**: `pages/name.vue` with `definePageMeta`
   - **Angular**: Component + route config + lazy module

5. **Report what was created** and suggest:
   - `/create-component` for page-specific components
   - `/create-form` if the page needs forms
