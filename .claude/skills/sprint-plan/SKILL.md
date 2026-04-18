---
name: sprint-plan
description: "Plan development sprint with task breakdown, priorities, and time estimates."
argument-hint: "[sprint-number or 'new']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, AskUserQuestion
---

When this skill is invoked:

1. **Read existing context**:
   - `design/product-spec.md` for features
   - `production/sprints/` for previous sprints
   - Current git log for recent work

2. **If new sprint**:
   - Review what's been built so far
   - Identify next priority features from product spec
   - Ask user to confirm priorities

3. **Break down into tasks**:

   For each feature, create tasks with:
   - **ID**: SPRINT-001, SPRINT-002, etc.
   - **Title**: Clear, actionable description
   - **Type**: Feature / Bug / Chore / Refactor
   - **Priority**: P0 (blocker) / P1 (high) / P2 (medium) / P3 (low)
   - **Estimate**: S (< 2h) / M (2-4h) / L (4-8h) / XL (> 8h)
   - **Agent**: Which studio agent handles this
   - **Depends on**: Other task IDs

4. **Sprint summary**:
   - Sprint goal (one sentence)
   - Total tasks by priority
   - Estimated effort
   - Risk items

5. **Write to** `production/sprints/sprint-[N].md`

6. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /sprint-plan — [YYYY-MM-DD HH:MM]
     - Action: planned sprint-[N] with [X] tasks ([Y] P0/P1)
     - Progress: 0/[X] tasks done
     - Recommended next: [first task]
     ```
   - Render the handoff block. The recommended option is the highest-priority task with no dependencies — phrase it as the concrete skill (`/create-endpoint`, `/create-page`, etc.) pointing at that task.
   - Include alternatives: next 2–3 highest-priority tasks, plus `@project-architect` for review of the plan.
