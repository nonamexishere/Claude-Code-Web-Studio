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

6. **Suggest**: Start with the highest-priority task that has no dependencies.
