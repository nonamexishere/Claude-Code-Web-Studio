---
name: claude-api
description: |
  Build, debug, and optimize features that use the Anthropic Claude API or
  Anthropic SDK in this web app. Sets up SDK install, prompt caching, tool
  use, streaming, and the right model selection. Mirrors Anthropic's
  official claude-api skill.
when_to_use: |
  USE WHEN the user wants to add an AI feature using Claude (chat, summary,
  classification, agent loop), asks "how do I call the Anthropic API / use
  Claude in my app / build a chatbot", imports `@anthropic-ai/sdk`, or asks
  about prompt caching / tool use / streaming.
argument-hint: "[feature: chat|tool-use|caching|streaming|agent]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion, WebFetch
---

When this skill is invoked:

1. **Detect the project framework** (Next.js, Nuxt, Express, etc.) and existing dependencies. Check if `@anthropic-ai/sdk` or `anthropic` (Python) is already installed.

2. **Ask about the feature** with `AskUserQuestion`:
   - Tab "Feature type" — Simple chat / Streaming chat / Tool use (function calling) / Prompt-cached long context / Agent loop / Vision / Files API
   - Tab "Backend" — Server-side (Node/Python) / Edge runtime / Both
   - Tab "Streaming" — Yes (recommended for chat UIs) / No
   - Tab "Caching" — Yes (recommended for repeated long context) / No

3. **Install SDK and set up the client**:
   - Node: `npm install @anthropic-ai/sdk`
   - Python: `pip install anthropic`
   - Edge: SDK works on Vercel Edge / Cloudflare Workers via fetch-based transport
   - Add `ANTHROPIC_API_KEY` to env management (`.env.local`, Vercel env, etc.)

4. **Pick the right model**. Default to the latest, most capable:
   - **Opus 4.7** (`claude-opus-4-7`) — highest reasoning, longest tasks
   - **Sonnet 4.6** (`claude-sonnet-4-6`) — balanced default for most apps
   - **Haiku 4.5** (`claude-haiku-4-5-20251001`) — fastest/cheapest, ok for classification, simple chat

5. **Generate the feature implementation**:

   **Chat (streaming)**:
   - Server route that proxies to Anthropic with `stream: true`
   - SSE / ReadableStream response back to client
   - Client uses EventSource or `useChat`-style hook
   - **Always include `cache_control: { type: "ephemeral" }`** on system prompts >1024 tokens

   **Tool use**:
   - Define tools array with `name`, `description`, `input_schema`
   - Loop: call API → check `stop_reason` → if `tool_use`, execute tool, append `tool_result`, call API again
   - Stop when `stop_reason: end_turn`

   **Prompt caching**:
   - Mark large static context (system prompt, retrieved docs, code base context) with `cache_control: { type: "ephemeral" }`
   - Cache TTL: 5 minutes (default) or 1 hour (set explicitly)
   - Verify with `usage.cache_creation_input_tokens` / `cache_read_input_tokens`

6. **Add error handling**:
   - 429 rate limit: exponential backoff with jitter
   - 529 overloaded: retry with backoff
   - Streaming errors: surface to UI without losing partial response
   - Don't log API keys or full prompts containing PII

7. **Optional integrations**:
   - Sentry for tracking API errors and slow requests
   - PostHog for tracking AI feature usage (cache hit rate, tokens, latency)

8. **MCP shortcut**: If the user has a relevant MCP installed (e.g. PostHog for tracking), suggest using it to monitor the new AI feature's metrics.

9. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /claude-api — [YYYY-MM-DD HH:MM]
     - Action: wired Claude API for [feature] — model [model-id], caching [on/off]
     - Recommended next: /write-tests for the AI feature
     ```
   - Render the handoff block with:
     - `/write-tests` — cover the AI feature with mocked responses *(recommended)*
     - `/setup-monitoring` — track latency, error rate, token usage
     - `/setup-payments` — meter usage if this is a paid feature
     - `/audit-security` — verify API keys aren't exposed and PII isn't logged
     - `@security-lead` — review the AI feature's data handling
