---
name: setup-storage
description: "Set up file storage: S3, Cloudflare R2, Supabase Storage, or UploadThing with upload UI, image optimization, and CDN."
argument-hint: "[provider: s3|r2|supabase|uploadthing]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Ask about storage needs** using `AskUserQuestion`:

   - Tab "Provider" — "Storage provider?"
     Options: AWS S3 / Cloudflare R2 / Supabase Storage / UploadThing / Firebase Storage / MinIO (self-hosted)
   - Tab "Files" — "File types?"
     Options (multi): Images / Documents (PDF, etc.) / Videos / User avatars / Attachments / Public assets
   - Tab "Features" — "Features needed?"
     Options (multi): Direct upload (presigned URL) / Image resize-optimization / CDN delivery / Access control / Virus scanning

2. **Generate storage setup**:

   - **Storage service** with methods:
     - upload(file, path) → URL
     - getSignedUploadUrl(path) → presigned URL for direct upload
     - getSignedDownloadUrl(path) → temporary access URL
     - delete(path)
     - list(prefix)
   - **Upload component**:
     - Drag and drop zone
     - File type and size validation
     - Upload progress indicator
     - Preview (image thumbnail)
     - Multi-file support
   - **Image optimization**:
     - Resize on upload (thumbnail, medium, large)
     - WebP/AVIF conversion
     - CDN delivery with cache headers
     - Responsive image URLs (width parameter)
   - **Security**:
     - File type validation (server-side, not just extension)
     - Size limits per file type
     - Presigned URLs for direct client upload
     - Bucket policy / access control

3. **Write files** to `src/storage/` or `src/lib/storage/`.

4. **Final step — handoff.** Follow `.claude/docs/handoff-template.md`.

   - Append breadcrumb to `.claude/session/active.md`:
     ```
     ## /setup-storage — [YYYY-MM-DD HH:MM]
     - Action: wired [provider] storage for [file types]
     - Recommended next: /create-component FileUpload
     ```
   - Render the handoff block with:
     - `/create-component FileUpload` — build the upload UI *(recommended)*
     - `/setup-cicd` — configure CDN and storage deployment
     - `/create-endpoint` — expose signed-URL endpoints
     - `/audit-security` — verify file type validation and access control
     - `@cloud-specialist` — discuss CDN caching and lifecycle policies
