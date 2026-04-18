---
name: create-form
description: "Build a form with validation, error handling, and submission logic."
argument-hint: "<form-name> [--fields name,email,password]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash
---

When this skill is invoked:

1. **Parse the argument** for form name and field definitions.
   Auto-detect framework and form library from existing project.

2. **Generate the form** with:
   - Form component with all specified fields
   - Client-side validation (Zod schema + React Hook Form / VeeValidate / Angular Reactive Forms)
   - Error messages per field
   - Loading state during submission
   - Success/error feedback after submission
   - Accessible labels, error announcements, and focus management

3. **Include field types**: text, email, password, number, select, checkbox, textarea, file upload, date picker.

4. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /create-form — [YYYY-MM-DD HH:MM]
     - Action: scaffolded [form-name] with validation + submission
     - Recommended next: /create-endpoint
     ```
   - Render the handoff block with:
     - `/create-endpoint` — build the API endpoint this form submits to *(recommended)*
     - `/write-tests` — test form validation and submission logic
     - `/create-component` — extract reusable field components
     - `/audit-accessibility` — check a11y of form labels and errors
     - `@frontend-lead` — discuss form UX or state choices
