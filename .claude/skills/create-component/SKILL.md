---
name: create-component
description: "Scaffold a reusable frontend component with props, types, styles, and tests."
argument-hint: "<ComponentName> [--variants primary,secondary] [--framework react|vue|angular]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

When this skill is invoked:

1. **Parse the argument** for component name, variants, and framework.
   Auto-detect framework from existing project files if not specified.

2. **Read existing patterns**:
   - Check existing components for naming conventions and file structure
   - Check for design system tokens (colors, spacing, typography)
   - Check for existing test patterns

3. **Generate the component** following project conventions:

   **For React**:
   ```
   src/components/ComponentName/
   ├── ComponentName.tsx        # Component implementation
   ├── ComponentName.test.tsx   # Tests
   ├── ComponentName.css        # Styles (or .module.css)
   └── index.ts                 # Re-export
   ```

   **For Vue**:
   ```
   src/components/ComponentName/
   ├── ComponentName.vue        # SFC
   ├── ComponentName.test.ts    # Tests
   └── index.ts                 # Re-export
   ```

4. **Component must include**:
   - TypeScript props interface with JSDoc comments
   - Default prop values where sensible
   - Variants/sizes if requested (via props, not separate components)
   - Loading and disabled states
   - Keyboard accessibility (tabIndex, aria attributes)
   - Responsive behavior

5. **Generate a basic test** covering:
   - Renders without crashing
   - Renders all variants
   - Handles click/interaction events
   - Accessibility: has proper ARIA roles

6. **Report what was created** and show how to import/use it.

7. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /create-component — [YYYY-MM-DD HH:MM]
     - Action: scaffolded [ComponentName] with variants/tests
     - Recommended next: /write-tests
     ```
   - Render the handoff block with:
     - `/write-tests [ComponentName]` — cover edge cases and interactions *(recommended)*
     - `/create-page` — use this component on a page
     - `/add-animation` — add transitions or micro-interactions
     - `/code-review src/components/[ComponentName]` — review before moving on
     - `@frontend-lead` — discuss reusability or a11y tradeoffs
