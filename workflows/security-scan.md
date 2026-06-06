---
description: /security-scan - Run security audit against agent surfaces, secrets, and prompt injection vectors
---

# /security-scan (Security Audit)

Use this workflow to run a comprehensive security review of the codebase before deployment or after modifying authentication, API endpoints, or LLM prompt surfaces.

## When to Use

- Before any production deploy
- After modifying auth, API routes, or user input handling
- After adding new environment variables or secrets
- When integrating third-party MCP servers or LLM tools

## Review Checklist

### Phase 1: Secrets & Credentials
1. Scan for hardcoded secrets (API keys, passwords, tokens) in source files.
   ```bash
   grep -rn "sk-\|password\s*=\|secret\s*=" --include="*.ts" --include="*.tsx" --include="*.js" src/
   ```
2. Verify all secrets are loaded from `process.env` and validated at startup.
3. Check `.gitignore` includes `.env`, `.env.local`, and other sensitive files.

### Phase 2: Input Validation & Injection
1. Verify all API route handlers validate input with **Zod schemas**.
2. Verify all SQL queries use parameterized statements (no string concatenation).
3. Check for XSS vectors — ensure HTML outputs are sanitized.

### Phase 3: Prompt Injection Defense
1. Audit all LLM prompt templates for user-controlled input injection.
2. Ensure user inputs are wrapped in structural tags (e.g., `<user_input>`) or escaped.
3. Verify system prompts cannot be overridden by user-supplied content.

### Phase 4: Permissions & Access Control
1. Verify authentication checks on all protected API routes.
2. Verify rate limiting is configured for sensitive endpoints.
3. Confirm error messages do not leak internal details (stack traces, DB schemas).

## Output
Return a structured report:
- **Security Grade**: A-F
- **Critical Findings**: Must fix before deploy
- **Medium Findings**: Fix within current sprint
- **Low Findings**: Track for future improvement
