---
name: create-list
description: "Generate a data list/table component with pagination, sorting, filtering, search, and responsive design."
argument-hint: "<list-name> [--type table|cards|grid]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project framework** from config files.

2. **Ask about the list** using `AskUserQuestion`:

   - Tab "Type" — "Display type?"
     Options: Data table / Card grid / Simple list / Kanban board / Timeline
   - Tab "Pagination" — "Pagination strategy?"
     Options: Cursor-based / Offset (page numbers) / Infinite scroll / Load more button / No pagination
   - Tab "Features" — "Include which features?"
     Options (multi): Search / Column sorting / Filters / Row selection / Bulk actions / Export / Inline editing

3. **Generate the list** with:

   - **Data table** (if selected):
     - TanStack Table / AG Grid / custom implementation
     - Column definitions with types
     - Sorting (client or server)
     - Filtering (text, select, date range)
     - Row selection with bulk actions
     - Responsive: horizontal scroll or card view on mobile
   - **Card grid** (if selected):
     - CSS Grid with responsive columns
     - Card component with consistent layout
     - Masonry option for varied heights
   - **Common features**:
     - Server-side pagination with URL state
     - Debounced search with highlighting
     - Loading skeleton
     - Empty state with illustration
     - Error state with retry
     - URL sync (page, sort, filters in query params)
   - **Accessibility**: aria-sort, role="grid", keyboard navigation

4. **Generate supporting files**:
   - Data fetching hook with pagination state
   - Filter/search state management
   - Test file

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /create-list — [YYYY-MM-DD HH:MM]
     - Action: scaffolded [list-name] as [type] with [features]
     - Recommended next: /create-endpoint
     ```
   - Render the handoff block with:
     - `/create-endpoint` — build the paginated API this list consumes *(recommended)*
     - `/create-component` — extract row/card components
     - `/write-tests` — cover pagination, sort, filter edge cases
     - `/audit-performance` — check render perf with large datasets
     - `@frontend-lead` — discuss list UX tradeoffs
