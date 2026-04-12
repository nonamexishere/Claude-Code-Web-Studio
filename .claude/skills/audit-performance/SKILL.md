---
name: audit-performance
description: "Analyze and optimize Core Web Vitals, bundle size, and load times."
argument-hint: "[focus: bundle|queries|rendering|all]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash
---

When this skill is invoked:

1. **Analyze the project** for performance issues:

   **Frontend**:
   - Bundle size analysis (if build tool available)
   - Unnecessary dependencies
   - Missing code splitting / lazy loading
   - Image optimization opportunities
   - Render-blocking resources
   - Unnecessary re-renders (React-specific)

   **Backend**:
   - N+1 query patterns
   - Missing database indexes
   - Unoptimized queries
   - Missing caching opportunities
   - Large payload responses

   **Infrastructure**:
   - Missing compression (gzip/brotli)
   - Missing cache headers
   - CDN opportunities
   - Missing preload/prefetch hints

2. **Output a performance report** with specific, actionable fixes.

3. **Suggest**: `@performance-engineer` for deep optimization work.
