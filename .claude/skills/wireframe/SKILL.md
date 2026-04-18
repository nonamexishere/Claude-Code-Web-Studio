---
name: wireframe
description: "Sketch low-fidelity wireframes for key pages. Produces ASCII layouts, component inventory, and responsive breakpoint notes."
argument-hint: "[page-name or 'all']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, AskUserQuestion
---

When this skill is invoked:

1. **Read existing context** — check for `docs/features.md`, `design/product-spec.md`, or `docs/architecture.md`.

2. **Ask about scope** using `AskUserQuestion` if no page argument:

   - Tab "Scope" — "What to wireframe?"
     Options: MVP screens only / All primary pages / A single flow / A single page
   - Tab "Fidelity" — "Detail level?"
     Options: Rough ASCII sketch / Annotated layout / Component-level breakdown

3. **For each page**, produce:

   - **ASCII layout** showing regions (header, sidebar, main, footer, modals)
   - **Component inventory**: reusable pieces implied (Button, Card, Table, Form, Nav)
   - **Responsive notes**: desktop (>1024) / tablet (768–1024) / mobile (<768) behavior per region
   - **Empty / loading / error states**: what the page shows when data is missing, pending, or failed
   - **Entry points**: which routes or actions lead to this page
   - **Primary CTA**: the single most important action on the page

4. **Cross-page concerns** to call out:
   - Shared layout shell (auth-gated vs public)
   - Navigation model (top nav, side nav, hybrid)
   - Theme / token usage from `/setup-theme`
   - Accessibility landmarks (header / nav / main / footer roles)
   - Skeleton strategy for slow data

5. **Write output** to `design/wireframes.md` (or `design/wireframes/<page>.md` if per-page).

6. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /wireframe — [YYYY-MM-DD HH:MM]
     - Action: wireframed [scope] into design/wireframes.md
     - Recommended next: /setup-routing
     ```
   - Render the handoff block with:
     - `/setup-routing` — wire the routes implied by the wireframes *(recommended)*
     - `/setup-theme` — define tokens for the components you sketched
     - `/design-components` — turn the component inventory into a system
     - `/create-page` — build the first page from wireframe to code
     - `@ui-ux-lead` — review flow and interaction gaps
