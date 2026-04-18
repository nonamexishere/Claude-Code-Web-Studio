# Review Gates

Review gates are automatic director-agent reviews that fire before a skill renders its handoff block. They exist so the studio feels like a real team — the user's decisions get a second opinion at the right moments.

The mode is stored in `.claude/session/review-mode.txt`. `/start` asks for it once; users can edit the file anytime.

## Trigger matrix

| Mode | When a gate fires |
|------|-------------------|
| `solo` | Never. Ship fast, no gates. |
| `lean` | Only at phase boundaries (listed below). Balanced default. |
| `full` | Before every skill's handoff, except read-only skills (`/help`, `/start` itself). |

Skills marked as **phase-boundary gates** in `lean` mode:

| Skill | Director | Focus of the review |
|-------|----------|---------------------|
| `/brainstorm` | `product-owner` | Is the product thesis coherent? Scope realistic? |
| `/create-architecture` | `project-architect` | Stack fit, layering, risk flags, simplifications |
| `/design-api` | `tech-lead` | Contract clarity, versioning, error shape |
| `/design-database` | `tech-lead` | Schema, indexes, migration safety |
| `/design-components` | `project-architect` | System coherence, composition patterns |
| `/setup-auth` | `tech-lead` | Token storage, session flow, CSRF/XSS |
| `/audit-security` | `tech-lead` | Severity triage, must-fix-before-deploy items |
| `/audit-performance` | `tech-lead` | Deploy-blocker regressions vs nice-to-haves |
| `/build` | `tech-lead` | Release-readiness: env, bundle size, artifacts |
| `/deploy` | `tech-lead` | Rollback plan, env parity, smoke checks |

In `full` mode, **any** skill not in the read-only list fires a gate. Default director is `tech-lead` unless the skill is product-shaped (brainstorm, define-features) in which case use `product-owner`, or architecture-shaped (create-architecture, design-components, setup-routing) in which case use `project-architect`.

## How to fire a gate from a skill

The handoff template references this document. Before rendering the handoff block, the skill MUST run these steps:

1. **Read mode**: `cat .claude/session/review-mode.txt` (default to `solo` if missing).
2. **Decide**: does this skill fire a gate under the current mode? Use the trigger matrix above.
3. **If yes, spawn a director review via the `Task` tool**:

   ```
   subagent_type: "<director-name>"   # e.g. "tech-lead", "project-architect", "product-owner"
   description: "Review <skill> output before handoff"
   prompt: |
     I just finished running /<skill-name> in Claude Web Studio. Review my work before the user sees the handoff block.

     Focus: <one-line focus from trigger matrix>.
     Mode: <lean | full>.

     Key artifacts I produced:
     - <path 1>
     - <path 2>

     Relevant session state:
     - MVP: <first line of .claude/session/mvp.md, or "not set">
     - Last breadcrumbs: <tail -n 10 of .claude/session/active.md>

     Report:
     1. What's good — 1-2 bullets.
     2. What's risky or unclear — 1-3 bullets with file:line where possible.
     3. One concrete recommendation for the user's next move.

     Keep it under 150 words. Be direct, not encouraging.
   ```

4. **Present the director's report to the user** as a collapsible section above the handoff block:

   ```
   ### Review — @<director> (<mode>)
   <director's report verbatim>
   ```

5. **Append a gate line to the breadcrumb** in `.claude/session/active.md`:

   ```
   - Gate: @<director> reviewed — <1-line verdict>
   ```

6. **Then render the handoff block.** Never skip the handoff because of a gate; the user still steers next.

## When NOT to fire a gate

- Read-only skills: `/help`, `/start` (the hub itself — it can write session files but doesn't produce work to review).
- If `.claude/session/review-mode.txt` is missing or contains `solo`.
- If the same skill already fired a gate in this run (avoid double-reviews when a skill calls sub-skills).

## Failure handling

If the `Task` tool call fails or times out, log one line to the breadcrumb (`- Gate: skipped (spawn failed)`) and proceed to the handoff block. Never block the user's workflow on a broken gate.
