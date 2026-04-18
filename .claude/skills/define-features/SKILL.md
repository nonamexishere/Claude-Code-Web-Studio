---
name: define-features
description: "Define and prioritize product features. Creates a structured feature list with MoSCoW prioritization and user stories."
argument-hint: "[feature-area]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, AskUserQuestion
---

When this skill is invoked:

1. **Read existing context** — check for `design/product-spec.md`, `docs/product.md`, or `docs/architecture.md` if they exist.

2. **Ask about scope** using `AskUserQuestion`:

   - Tab "Phase" — "What phase are you planning?"
     Options: MVP / V1.0 / V2.0 / Specific feature area
   - Tab "Priority" — "What matters most?"
     Options: Speed to market / User experience / Feature completeness / Technical excellence

3. **Generate a feature list** organized by:

   - **Must Have (M)**: Core features without which the product has no value
   - **Should Have (S)**: Important features expected by users
   - **Could Have (C)**: Nice-to-have features for differentiation
   - **Won't Have (W)**: Explicitly out of scope for this phase

4. **For each feature**, document:
   - Feature name and one-line description
   - User story: "As a [user], I want [action] so that [benefit]"
   - Acceptance criteria (bullet list)
   - Complexity estimate: S / M / L / XL
   - Dependencies on other features or services

5. **Identify cross-cutting concerns** to flag:
   - Auth / authorization implications
   - Data model impact
   - API contract changes
   - Performance-sensitive paths
   - SEO / accessibility requirements
   - Analytics events to emit
   - Internationalization needs

6. **Write output** to `docs/features.md`.

7. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /define-features — [YYYY-MM-DD HH:MM]
     - Action: wrote docs/features.md with MoSCoW priorities
     - Recommended next: /create-architecture
     ```
   - Render the handoff block with:
     - `/create-architecture` — design the technical foundation for Must-Have features *(recommended)*
     - `/wireframe` — sketch the UI for the top-priority flows
     - `/design-api` — define API contracts implied by the feature list
     - `/sprint-plan` — break features into sprint tasks
     - `@product-owner` — review prioritization choices
