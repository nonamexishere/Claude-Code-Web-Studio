---
name: add-animation
description: "Add animations and transitions: page transitions, micro-interactions, scroll-based animations, and loading effects."
argument-hint: "<animation-type> [--target component-name]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project framework** from config files.

2. **Ask about animation needs** using `AskUserQuestion`:

   - Tab "Type" — "Animation type?"
     Options: Page transition / Micro-interaction / Scroll-based / Loading-Skeleton / Layout animation / SVG animation / View Transition
   - Tab "Library" — "Animation approach?"
     Options: CSS only / Framer Motion / GSAP / View Transitions API / Auto-animate / Framework built-in

3. **Generate animation** based on framework:

   **React (Framer Motion)**:
   - motion components with variants
   - AnimatePresence for exit animations
   - Layout animations for list reorder
   - useScroll / useTransform for scroll-based
   - Page transitions with layout animations

   **Vue (built-in + GSAP)**:
   - Transition and TransitionGroup components
   - Enter/leave CSS transitions
   - GSAP ScrollTrigger integration
   - List transition animations

   **Svelte (built-in)**:
   - transition: directives (fade, fly, slide, scale)
   - animate: for list reordering (FLIP)
   - tweened and spring stores
   - Custom transitions

   **CSS (universal)**:
   - @keyframes definitions
   - Scroll-driven animations (animation-timeline)
   - View Transitions API
   - Intersection Observer triggers

4. **Performance**:
   - Animate only transform and opacity
   - Use will-change sparingly
   - Respect prefers-reduced-motion
   - GPU compositing hints
   - 60fps verification

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /add-animation — [YYYY-MM-DD HH:MM]
     - Action: added [type] animation to [target] using [library]
     - Recommended next: /audit-performance
     ```
   - Render the handoff block with:
     - `/audit-performance` — verify 60fps and reduced-motion compliance *(recommended)*
     - `/audit-accessibility` — check reduced-motion and focus handling
     - `/create-component` — extract the animation into a reusable component
     - `/code-review` — review animation code
     - `@animation-specialist` — advanced motion design and choreography
