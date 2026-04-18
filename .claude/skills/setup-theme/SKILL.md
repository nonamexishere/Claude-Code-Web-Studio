---
name: setup-theme
description: "Set up a design system with colors, typography, spacing, dark mode, and CSS variables or Tailwind configuration."
argument-hint: "[preset: minimal|bold|corporate|custom]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project framework and styling approach** from config files.

2. **Ask about theme preferences** using `AskUserQuestion`:

   - Tab "Style" — "Design style?"
     Options: Minimal-Clean / Bold-Vibrant / Corporate-Professional / Playful / Custom brand
   - Tab "Colors" — "Primary color?"
     Options: Blue / Purple / Green / Orange / Red / Custom hex
   - Tab "Dark Mode" — "Dark mode support?"
     Options: Yes (system automatic) / Yes (user toggle) / Light only / Dark only

3. **Generate theme system** based on styling approach:

   **Tailwind CSS**:
   - tailwind.config with custom theme (colors, fonts, spacing)
   - CSS variables for dynamic theming
   - Dark mode configuration (class or media)
   - shadcn/ui theme customization (if applicable)

   **CSS Modules / Vanilla CSS**:
   - CSS custom properties (--color-primary, --spacing-md, etc.)
   - :root and [data-theme="dark"] definitions
   - Typography scale
   - Spacing scale

   **styled-components / Emotion**:
   - Theme object with TypeScript types
   - ThemeProvider setup
   - Dark/light theme definitions
   - useTheme hook

4. **Include in theme**:
   - **Colors**: Primary, secondary, accent, neutral, semantic (success, warning, error, info)
   - **Typography**: Font families, size scale (xs through 4xl), line heights, font weights
   - **Spacing**: 4px grid (1-16 scale: 4, 8, 12, 16, 20, 24, 32, 40, 48, 64)
   - **Border radius**: none, sm, md, lg, xl, full
   - **Shadows**: none, sm, md, lg, xl
   - **Breakpoints**: sm (640), md (768), lg (1024), xl (1280), 2xl (1536)
   - **Transitions**: duration and easing presets
   - **Z-index scale**: dropdown, sticky, modal, popover, toast

5. **Dark mode toggle component** (if user toggle selected).

6. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-theme — [YYYY-MM-DD HH:MM]
     - Action: configured design system ([style], [colors], dark=[mode])
     - Recommended next: /create-component
     ```
   - Render the handoff block with:
     - `/create-component` — build the first themed component *(recommended)*
     - `/create-page` — build a page using the new theme
     - `/audit-accessibility` — verify contrast and typography ratios
     - `@ui-developer` — expand the design system (tokens, patterns)
     - `@tailwind-specialist` — advanced Tailwind tweaks (if applicable)
