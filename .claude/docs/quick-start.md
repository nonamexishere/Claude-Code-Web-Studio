# Quick Start Guide

## Prerequisites

- [Claude Code](https://claude.ai/code) installed (`npm install -g @anthropic-ai/claude-code`)
- Git installed

## Setup

1. Clone this repository:
   ```bash
   git clone <repo-url> my-project
   cd my-project
   ```

2. Open Claude Code in the project directory:
   ```bash
   claude
   ```

3. Start your first project:
   ```
   /start my-awesome-app
   ```

## Common Workflows

### New Project from Scratch
```
/start                    → Set up project structure
/brainstorm              → Develop product idea
/create-architecture     → Design system architecture
/design-api              → Plan API endpoints
/design-database         → Model your data
```

### Building Features
```
/create-page dashboard   → Create a new page
/create-component Button → Create a reusable component
/create-endpoint POST /api/users → Create API endpoint
/create-model User       → Create database model
/create-form login       → Build a form with validation
```

### Quality & Deployment
```
/code-review src/        → Review code quality
/write-tests src/auth    → Generate tests
/audit-security          → Security vulnerability scan
/audit-performance       → Performance analysis
/setup-docker            → Containerize the app
/deploy vercel           → Deploy to production
```

### Team Coordination
```
/sprint-plan new         → Plan next sprint
/team-fullstack auth     → Build auth feature end-to-end
```

### Talking to Agents
```
@project-architect Should I use microservices or monolith?
@frontend-lead What's the best state management for this?
@react-developer Create a data table with sorting
@security-lead Review our auth implementation
```

## Tips

- Use `/` to see all available skills
- Use `@agent-name` to talk to a specific agent
- Agents remember context within a session
- Skills can be chained: design → implement → test → deploy
