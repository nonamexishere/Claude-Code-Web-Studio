---
name: audit-accessibility
description: "Audit web accessibility: WCAG 2.2 compliance, ARIA usage, keyboard navigation, screen reader support, and color contrast."
argument-hint: "[file-or-page]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, Write, AskUserQuestion
---

When this skill is invoked:

1. **Determine audit scope**:

   - Tab "Scope" — "What to audit?"
     Options: Specific page / Component library / Full application / Forms only

2. **Run accessibility audit** checking for:

   **Semantic HTML**:
   - [ ] Proper heading hierarchy (h1 → h2 → h3, no skips)
   - [ ] Landmark regions (nav, main, aside, footer)
   - [ ] Lists for list content (ul, ol, dl)
   - [ ] Button for actions, a for navigation
   - [ ] No div/span with onClick (use proper elements)

   **ARIA**:
   - [ ] ARIA roles used correctly (not overriding semantic HTML)
   - [ ] aria-label on icon-only buttons
   - [ ] aria-describedby for form field help text
   - [ ] aria-live regions for dynamic content updates
   - [ ] aria-expanded for collapsible sections

   **Keyboard**:
   - [ ] All interactive elements focusable
   - [ ] Visible focus indicator on all elements
   - [ ] Tab order follows visual order
   - [ ] Escape closes modals/dropdowns
   - [ ] No keyboard traps
   - [ ] Skip navigation link

   **Visual**:
   - [ ] Color contrast >= 4.5:1 (text) / 3:1 (large text, UI components)
   - [ ] Information not conveyed by color alone
   - [ ] Text resizable to 200% without loss
   - [ ] No content overflow on zoom
   - [ ] prefers-reduced-motion respected
   - [ ] prefers-color-scheme respected

   **Forms**:
   - [ ] Labels associated with inputs (htmlFor / aria-labelledby)
   - [ ] Error messages linked to fields (aria-describedby)
   - [ ] Required fields marked (aria-required)
   - [ ] Autocomplete attributes on common fields
   - [ ] Form validation errors announced

   **Images & Media**:
   - [ ] Alt text on informative images
   - [ ] Decorative images hidden (alt="" or aria-hidden)
   - [ ] Video captions / audio descriptions

3. **Generate WCAG 2.2 compliance report** with:
   - Level A, AA, AAA assessment
   - Issues by severity (critical, major, minor)
   - Fix code examples
   - Automated testing tool recommendations (axe, pa11y, Lighthouse)

4. **Suggest next steps**:
   1. "Talk to `@accessibility-specialist` for remediation help"
   2. "Test with screen reader (VoiceOver on Mac, NVDA on Windows)"
