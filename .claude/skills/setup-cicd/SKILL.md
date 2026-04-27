---
name: setup-cicd
description: "Set up CI/CD pipeline for the web app: GitHub Actions, GitLab CI, or platform-native (Vercel, Netlify) with tests, build, and deploy stages."
argument-hint: "[provider: github-actions|gitlab|circleci|vercel|netlify]"
user-invocable: true
disable-model-invocation: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project** — framework, package manager, test runner, deployment target from `package.json`, lockfiles, and any existing infra config.

2. **Ask about pipeline needs** using `AskUserQuestion`:

   - Tab "Provider" — "CI/CD provider?"
     Options: GitHub Actions / GitLab CI / CircleCI / Vercel (native) / Netlify (native) / Cloudflare Pages / Custom
   - Tab "Stages" — "Pipeline stages?"
     Options (multi): Lint / Typecheck / Unit tests / E2E tests / Build / Deploy preview / Deploy production
   - Tab "Trigger" — "When to run?"
     Options: Every PR + main / Main only / Tag-based releases / Manual dispatch
   - Tab "Env" — "How many environments?"
     Options: Preview + production / Staging + production / Dev + staging + production / Just production

3. **Generate pipeline config**:

   **GitHub Actions** (`.github/workflows/ci.yml` + `deploy.yml`):
   - Matrix over Node versions if library; single version if app
   - Cache package manager store (npm/pnpm/yarn/bun)
   - Steps: install → lint → typecheck → test → build → upload artifact
   - Separate deploy workflow gated on main branch + manual dispatch

   **GitLab CI** (`.gitlab-ci.yml`):
   - Stages: lint, test, build, deploy
   - Cache `node_modules` and package-manager store
   - Environments with URL for preview / production

   **Vercel / Netlify / Cloudflare Pages**:
   - `vercel.json` / `netlify.toml` / `wrangler.toml`
   - Build command and output directory
   - Environment variable list (secrets go through provider UI, not in repo)
   - Preview deployments on PR

4. **Cross-cutting pipeline concerns**:
   - **Secrets**: list the env vars needed; document where to add them (never in config files)
   - **Caching**: dependency cache + build cache (Next.js `.next/cache`, Turbo cache, etc.)
   - **Artifacts**: upload coverage, Lighthouse reports, build output
   - **Notifications**: PR status checks, Slack / Discord on prod deploy
   - **Rollback**: how to revert a bad deploy (previous deployment promote, git revert + redeploy)

5. **Generate supporting files**:
   - `.github/dependabot.yml` or Renovate config (optional)
   - `CODEOWNERS` stub for review routing (optional)
   - Pre-commit hook config (husky + lint-staged) if not present

6. **Write configuration files** and note required provider-side setup steps.

7. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-cicd — [YYYY-MM-DD HH:MM]
     - Action: wired [provider] pipeline with [stages]
     - Recommended next: /build
     ```
   - Render the handoff block with:
     - `/build` — validate the pipeline locally with a real build *(recommended)*
     - `/deploy` — trigger the first production deploy once CI is green
     - `/setup-monitoring` — wire alerts on failed deploys and error spikes
     - `/write-tests` — close any coverage gaps the pipeline will now enforce
     - `@devops-lead` — review secrets management and rollback strategy
