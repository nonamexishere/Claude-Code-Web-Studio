# Quick Start — Claude Web Studio

## What Is This?

Claude Web Studio is an AI-powered virtual web development studio that runs
entirely inside **Claude Code**. It provides specialized agents and skills to help
you build full-stack web applications with any framework and language.

## First Steps

### 1. Start a New Project
```
/start my-awesome-app
```
This walks you through tech stack selection, sets up your project structure, and
configures the development environment.

### 2. Brainstorm Your Idea
```
/brainstorm saas dashboard
```
Generates a product brief with features, target audience, and technical approach.

### 3. Plan Your Features
```
/define-features
```
Creates a prioritized feature list with user stories and complexity estimates.

## Design Phase

```
/wireframe                    # Sketch your pages
/create-architecture          # Design system architecture
/design-api                   # Plan API endpoints
/design-database              # Model your data
/setup-theme                  # Establish design system
/setup-routing                # Configure page routing
```

## Build Phase

```
/create-page dashboard        # Generate a complete page
/create-component Avatar      # Create reusable components
/create-form LoginForm        # Build forms with validation
/create-list users            # Create data tables/lists
/create-endpoint POST /api/users  # Create API endpoint
/create-model User            # Generate database model
/create-migration add-users   # Create database migration
/create-middleware auth        # Create server middleware
/add-animation fade-in        # Add animations
```

## Backend & Integration

```
/setup-auth                   # Implement authentication
/setup-graphql                # Set up GraphQL server/client
/setup-websocket              # Real-time communication
/setup-redis                  # Caching, sessions, queues
/setup-email                  # Transactional emails
/setup-payments               # Stripe/LemonSqueezy payments
/setup-storage                # File upload and storage
/setup-i18n en,tr,de          # Internationalization
/setup-seo                    # SEO optimization
/setup-analytics              # Analytics tracking
/setup-monitoring             # Error and performance monitoring
/setup-docker                 # Containerize the app
```

## Infrastructure

```
/setup-monorepo               # Turborepo/Nx monorepo
/setup-edge                   # Edge computing (Cloudflare/Vercel)
/setup-cicd                   # CI/CD pipeline
/setup-state                  # State management
```

## Quality Assurance

```
/write-tests                  # Write unit, integration, E2E tests
/code-review                  # Review code for best practices
/audit-performance            # Performance audit (Core Web Vitals)
/audit-security               # Security audit (OWASP)
/audit-accessibility          # Accessibility audit (WCAG 2.2)
```

## Release

```
/build                        # Build for production
/deploy vercel                # Deploy to production
/create-changelog             # Generate release notes
/create-readme                # Generate project README
/generate-docs                # Generate documentation
```

## Team Coordination

```
/sprint-plan                  # Plan next sprint
/team-feature auth            # Build complete feature end-to-end
/team-fullstack checkout      # Full-stack feature build
```

## Talking to Agents

You can talk to any agent directly for specialized help:

```
@project-architect Should I use microservices or monolith?
@react-developer Create a data table with sorting and pagination
@go-developer Build a REST API with Gin
@django-specialist Set up Django REST Framework with JWT auth
@graphql-specialist Design a schema for an e-commerce app
@redis-specialist Set up caching for my API responses
@seo-specialist Optimize my Next.js site for search engines
```

## Getting Help

```
/help                         # Overview
/help agents                  # See all agents
/help skills                  # See all skills
/help workflow                # Recommended workflow
```

## Typical Workflow

```
1. PLAN       /brainstorm → /define-features → /create-architecture
2. DESIGN     /wireframe → /setup-theme → /design-api → /design-database
3. BUILD      /create-page → /create-component → /create-endpoint
4. INTEGRATE  /setup-auth → /setup-email → /setup-payments
5. TEST       /write-tests → /audit-performance → /audit-accessibility
6. RELEASE    /setup-cicd → /build → /deploy
```
