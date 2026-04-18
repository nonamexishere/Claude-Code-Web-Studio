---
name: write-tests
description: "Generate unit, integration, or E2E tests for a module or feature."
argument-hint: "<file-or-feature> [--type unit|integration|e2e]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

When this skill is invoked:

1. **Parse the argument** for the target file/feature and test type.
   If a file path is given, read it to understand what to test.
   Default to unit tests if type not specified.

2. **Read existing test patterns**:
   - Check test framework (Vitest, Jest, Pytest, etc.)
   - Check existing tests for conventions (file naming, structure, utilities)
   - Check for test helpers, fixtures, factories

3. **Generate tests based on type**:

   **Unit tests**: Test individual functions/components in isolation
   - Use mocks for external dependencies
   - Cover happy path, edge cases, and error cases
   - For components: render, interaction, and state tests

   **Integration tests**: Test modules working together
   - Test API endpoints with real middleware chain
   - Test database queries with test database
   - Test component trees with data fetching

   **E2E tests**: Test complete user flows
   - Use Playwright or Cypress
   - Test critical user journeys
   - Include visual assertions where useful

4. **Test structure** (AAA pattern):
   ```
   describe('feature', () => {
     it('should [expected behavior] when [condition]', () => {
       // Arrange — set up test data
       // Act — perform the action
       // Assert — verify the result
     });
   });
   ```

5. **Run the tests** and report results.

6. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /write-tests — [YYYY-MM-DD HH:MM]
     - Action: added [type] tests for [target]
     - Recommended next: /code-review
     ```
   - Render the handoff block with:
     - `/code-review [target]` — review the code you just covered *(recommended)*
     - `/audit-security` — if tests surface untrusted-input paths
     - `/audit-performance` — if tests reveal slow paths
     - `/sprint-plan` — pick the next task now that this is green
     - `@qa-lead` — discuss test strategy or coverage gaps
