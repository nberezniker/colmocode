---
description: /any-cleanup - Scan codebase for :any patterns and propose type-safety improvements
---

# /any-cleanup

Scan the ColmoGravity codebase to identify TypeScript files containing the `: any` pattern, rank the worst offenders, and propose actions to safely convert them to robust types.

## Workflow

1. **Run the Scanner**:
   Execute the `/Users/nikiti4/Downloads/Antigravity/scripts/any-cleanup.sh` script to see current metrics and common patterns.

   ```bash
   ./scripts/any-cleanup.sh
   ```

2. **Action Plan for Cleanups**:
   - Focus on catch blocks: replace `catch (error: any)` with `catch (error: unknown)`. Use proper TypeScript narrowing.
   - Focus on data definitions: replace `Record<string, any>` with `Record<string, unknown>`.
   - Focus on API responses: replace `any` with Zod schemas or interfaces derived from your types.

3. **Validation**:
   Always run `npm run type-check` after making changes to verify that the replacement did not break typescript safety.
