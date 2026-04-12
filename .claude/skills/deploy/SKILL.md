---
name: deploy
description: "Generate deployment configuration for Vercel, AWS, Railway, Fly.io, or Docker."
argument-hint: "<platform: vercel|aws|railway|fly|docker>"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, WebSearch, AskUserQuestion
---

When this skill is invoked:

1. **Determine platform** from argument or ask via `AskUserQuestion`:
   - Options: Vercel / AWS (ECS/Lambda) / Railway / Fly.io / Render / Self-hosted (Docker)

2. **Generate platform-specific config**:

   **Vercel**: `vercel.json`, environment variables, build settings
   **Railway**: `railway.toml`, Procfile, database provisioning
   **Fly.io**: `fly.toml`, Dockerfile, scaling config
   **AWS**: CDK/Terraform config, ECS task definition or Lambda config
   **Docker**: Production Dockerfile, compose, reverse proxy (nginx/caddy)

3. **Include**:
   - Environment variable management (secrets)
   - Domain and SSL configuration
   - Database connection (production database setup)
   - Build and start commands
   - Health check endpoint

4. **Generate deployment checklist**:
   - [ ] Environment variables set
   - [ ] Database migrated
   - [ ] SSL certificate configured
   - [ ] Domain DNS pointed
   - [ ] Health check passing
   - [ ] Error tracking configured (Sentry)
   - [ ] Monitoring enabled

5. **Suggest**: `/setup-cicd` for automated deployments
