---
name: setup-websocket
description: "Set up real-time communication: WebSocket, Socket.IO, Server-Sent Events, or Supabase Realtime with scaling support."
argument-hint: "[type: websocket|socketio|sse|supabase-realtime]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project framework and backend** from config files.

2. **Ask about real-time needs** using `AskUserQuestion`:

   - Tab "Technology" — "Real-time technology?"
     Options: WebSocket (native) / Socket.IO / Server-Sent Events / Supabase Realtime / Pusher / Ably / PartyKit
   - Tab "Use Case" — "Primary use case?"
     Options: Chat messaging / Live notifications / Collaborative editing / Real-time dashboard / Live feed / Presence (who's online)

3. **Generate real-time setup**:

   **Server-side**:
   - WebSocket server setup (ws, Socket.IO, or framework-specific)
   - Connection handling (auth, heartbeat, cleanup)
   - Room/channel management
   - Broadcasting and targeted messaging
   - Redis adapter for horizontal scaling

   **Client-side**:
   - Connection manager with auto-reconnect
   - Event listeners and emitters
   - React hooks (useSocket, useChannel) / Vue composables / Svelte stores
   - Connection status indicator component
   - Offline message queuing

   **SSE (if selected)**:
   - Server endpoint with text/event-stream
   - EventSource client with reconnection
   - Custom event types

   **Patterns**:
   - Presence tracking (online users)
   - Typing indicators
   - Optimistic UI with server confirmation
   - Message history loading

4. **Write files** to `src/realtime/` or `src/lib/socket/`.

5. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-websocket — [YYYY-MM-DD HH:MM]
     - Action: wired [technology] for [use case]
     - Recommended next: /setup-redis
     ```
   - Render the handoff block with:
     - `/setup-redis` — enable pub/sub scaling across instances *(recommended)*
     - `/create-component` — build connection status and live-update UI
     - `/setup-auth` — authenticate socket connections
     - `/write-tests` — cover reconnection and message handling
     - `@websocket-specialist` — discuss scaling patterns and backpressure
