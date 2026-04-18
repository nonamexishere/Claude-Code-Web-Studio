---
name: setup-payments
description: "Set up payment processing: Stripe, LemonSqueezy, or Paddle with checkout, subscriptions, webhooks, and billing portal."
argument-hint: "[provider: stripe|lemonsqueezy|paddle]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Ask about payment needs** using `AskUserQuestion`:

   - Tab "Provider" — "Payment provider?"
     Options: Stripe / LemonSqueezy / Paddle / PayPal
   - Tab "Type" — "Payment model?"
     Options: One-time payments / Subscriptions (recurring) / Both / Usage-based / Credits
   - Tab "Features" — "Payment features?"
     Options (multi): Checkout page / Embedded checkout / Billing portal / Invoices / Webhooks / Trial period

2. **Generate payment setup**:

   **Stripe** (if selected):
   - Stripe SDK initialization
   - Checkout Session creation
   - Subscription management (create, update, cancel)
   - Webhook handler with signature verification
   - Customer portal integration
   - Pricing table component
   - Product/price configuration

   **LemonSqueezy** (if selected):
   - LemonSqueezy API client
   - Checkout overlay integration
   - Subscription webhooks
   - License key validation

   **Common patterns**:
   - Pricing page component
   - Plan comparison table
   - Subscription status checking middleware
   - Webhook event processing (payment_succeeded, subscription_updated, etc.)
   - Idempotent webhook handling
   - Database sync (user ↔ subscription status)
   - Trial period logic
   - Grace period for failed payments

3. **Security**:
   - Webhook signature verification
   - Server-side price validation
   - No client-side price manipulation
   - PCI compliance (use hosted checkout)

4. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-payments — [YYYY-MM-DD HH:MM]
     - Action: wired [provider] for [type] with [features]
     - Recommended next: /create-page pricing
     ```
   - Render the handoff block with:
     - `/create-page pricing` — build the pricing/plans page *(recommended)*
     - `/setup-email` — send receipts, invoices, and dunning emails
     - `/audit-security` — verify webhook verification and server-side price checks
     - `/write-tests` — cover subscription state transitions and webhooks
     - `@security-lead` — review PCI surface and webhook idempotency
