---
name: setup-redis
description: "Set up Redis: caching layer, session storage, rate limiting, pub/sub, and job queues with Upstash or self-hosted Redis."
argument-hint: "[use-case: cache|session|queue|pubsub|rate-limit]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project framework** from config files.

2. **Ask about Redis needs** using `AskUserQuestion`:

   - Tab "Provider" — "Redis provider?"
     Options: Upstash (serverless) / Redis Cloud / Self-hosted / Docker (local dev)
   - Tab "Use Cases" — "What to use Redis for?"
     Options (multi): Caching / Session storage / Rate limiting / Job queue / Pub/Sub (real-time) / Leaderboard

3. **Generate Redis setup**:

   - **Client configuration**: ioredis / @upstash/redis / redis (Node) / go-redis
   - **Caching layer**:
     - Cache service with get/set/del/invalidate
     - Cache-aside pattern implementation
     - TTL strategy per data type
     - Cache key naming convention
   - **Session storage**:
     - Express session with Redis store
     - Next.js/Nuxt session with Redis
     - Sliding expiration
   - **Rate limiting**:
     - Sliding window rate limiter
     - Per-user and per-IP limits
     - Rate limit middleware
   - **Job queue** (if selected):
     - BullMQ setup with worker
     - Job types and processors
     - Retry and backoff configuration
     - Dashboard (Bull Board / Arena)
   - **Pub/Sub** (if selected):
     - Publisher and subscriber setup
     - Channel patterns
     - Socket.IO Redis adapter

4. **Docker Compose** for local Redis development.

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-redis — [YYYY-MM-DD HH:MM]
     - Action: configured Redis on [provider] for [use cases]
     - Recommended next: /create-middleware
     ```
   - Render the handoff block with:
     - `/create-middleware rate-limit` — add a rate-limit middleware backed by Redis *(recommended)*
     - `/setup-websocket` — wire real-time messaging with pub/sub
     - `/setup-auth` — move sessions to Redis
     - `/write-tests` — cover cache invalidation logic
     - `@redis-specialist` — discuss advanced patterns (Lua scripts, streams)
