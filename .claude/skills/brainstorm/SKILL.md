---
name: brainstorm
description: |
  Guided product ideation — from a rough idea to a structured product
  specification. Uses professional product thinking frameworks (jobs-to-be-done,
  competitor analysis, MVP scoping).
when_to_use: |
  USE WHEN the user has a vague app/SaaS idea but isn't sure what to build
  first, asks "what should I make / help me think this through / I have an
  idea but...", or wants to validate an idea before architecture. Also use
  when the project has no MVP anchor yet (`.claude/session/mvp.md` empty).
argument-hint: "[idea or topic, or 'open']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, WebSearch, AskUserQuestion, Task
---

When this skill is invoked:

1. **Parse the argument** for an optional idea hint. If `open` or no argument,
   start from scratch.

2. **Check for existing work**:
   - Read `design/product-spec.md` if it exists (resume, don't restart)
   - Read `docs/architecture.md` if it exists (build on existing decisions)

3. **Run through ideation phases** interactively. Do NOT generate everything
   silently — the goal is collaborative exploration.

---

### Phase 1: Discovery

Understand the person and the problem:

- What problem are you solving? Who has this problem?
- What existing solutions have you tried? What's missing?
- Who is your target user? (Developer, business user, consumer, etc.)
- What's your timeline and team size?

Use `AskUserQuestion` for constrained choices:
- Tab "Scale" — "What scale are you targeting?"
  Options: Personal tool / Small team / Startup MVP / Enterprise
- Tab "Monetization" — "Business model?"
  Options: Free/Open source / Freemium / SaaS subscription / One-time purchase / Not decided

Synthesize into a **Product Brief** — 3-5 sentences.

---

### Phase 2: Concept Development

Generate **3 distinct approaches** to solving the problem:

For each approach:
- **Name**: Working title
- **Elevator Pitch**: 1-2 sentences
- **Core Value Prop**: What makes this unique?
- **Target User**: Who specifically benefits most?
- **Key Features**: 3-5 essential features
- **Technical Complexity**: Low / Medium / High
- **Biggest Risk**: What could make this fail?

Present all three, then ask the user to choose or combine.

---

### Phase 3: Feature Definition

For the chosen approach, define:

- **Must-Have Features** (MVP): Without these, the product doesn't work
- **Should-Have Features** (v1.1): Makes the product genuinely useful
- **Nice-to-Have Features** (v2): Delight features for later
- **Anti-Features**: What this product will NOT do (scope guard)

For each must-have feature, write a user story:
"As a [user type], I want [action] so that [value]"

---

### Phase 4: Technical Direction

Based on features, recommend:
- Frontend framework and approach
- Backend framework and approach
- Database type and specific technology
- Key third-party services (auth, payments, email, etc.)
- Hosting and deployment strategy

---

### Phase 5: Write Product Spec

Generate `design/product-spec.md` with all sections filled in.
Ask for write approval before creating the file.

---

### Phase 6: Anchor the MVP

After the spec is written, distill the MVP into a **single sentence** and write it to `.claude/session/mvp.md` (create the directory if missing). Overwrite any prior placeholder. No heading, no frontmatter, just the sentence. Example:

`A dashboard where small teams define tracked metrics and see a live chart per metric — nothing else.`

Then confirm to the user in one line: "MVP anchored: *[sentence]*. Future skills will surface this in their Status block."

---

### Final step — handoff

Follow `.claude/docs/handoff-template.md`.

1. Append a breadcrumb to `.claude/session/active.md`:
   ```
   ## /brainstorm — [YYYY-MM-DD HH:MM]
   - Action: produced product spec for [concept name]
   - Recommended next: /create-architecture
   ```
2. Render the handoff block with these recommendations:
   - `/create-architecture` — design the system now that the product is defined *(recommended)*
   - `/design-database` — model data directly if product is data-heavy
   - `/design-api` — design contracts if API-first
   - `/define-features` — refine feature priorities before coding
   - `@project-architect` — discuss architecture tradeoffs
