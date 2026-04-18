---
name: design-components
description: "Design a reusable component system: inventory, API conventions, composition patterns, and accessibility baseline."
argument-hint: "[component-name or 'system']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, AskUserQuestion, Task
---

When this skill is invoked:

1. **Read existing context** — check `design/wireframes.md`, `docs/features.md`, existing `src/components/` tree, and any theme setup.

2. **Ask about scope** using `AskUserQuestion`:

   - Tab "Scope" — "What to design?"
     Options: Full component system / A single component / Just the inventory / Compound pattern for a flow
   - Tab "Foundation" — "Building on?"
     Options: shadcn/ui / Radix primitives / Headless UI / MUI / Chakra / Ant Design / From scratch
   - Tab "Variants" — "Variant strategy?"
     Options: CVA (class-variance-authority) / Tailwind variants / styled-system tokens / Plain props

3. **Produce the system design** as `design/component-system.md`:

   - **Inventory**: list every reusable component (Button, Input, Card, Dialog, Table, Toast, etc.) with one-line purpose
   - **API conventions**: how props are named, how variants are exposed, how sizing/spacing follows the theme scale
   - **Composition patterns**: compound components (e.g. `<Tabs.Root><Tabs.List>…`), slot vs children, controlled vs uncontrolled
   - **State ownership**: which components own state, which delegate to parent, form integration
   - **Accessibility baseline**: focus management, keyboard traversal, ARIA roles, color contrast minimum
   - **Theming hooks**: how each component reads design tokens (colors, spacing, radius, shadow)
   - **Docs format**: where stories / examples live (Storybook, Ladle, or inline `*.docs.md`)

4. **For each component** (if full system scope), define:
   - Props table (name, type, default, description)
   - Required variants (size, intent, state)
   - A usage example snippet
   - Edge cases (long text, RTL, reduced motion)

5. **Write output** to `design/component-system.md` and optionally per-component stubs under `design/components/`.

6. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /design-components — [YYYY-MM-DD HH:MM]
     - Action: designed [scope] built on [foundation]
     - Recommended next: /create-component
     ```
   - Render the handoff block with:
     - `/create-component` — implement the first component from the system *(recommended)*
     - `/setup-theme` — align tokens so components can consume them
     - `/audit-accessibility` — verify the baseline on the first built component
     - `/generate-docs` — generate a component catalog from the system
     - `@ui-ux-lead` — review API conventions and variant coverage
