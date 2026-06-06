---
description: /phase-status - Dashboard showing current sprint progress and compliance
---

# /phase-status

Check current compliance with architectural decisions (ADRs) and view key code quality/test metrics for Week 2 Sprint of ColmoGravity.

## Workflow

1. **Check Status**:
   Execute the `/Users/nikiti4/Downloads/Antigravity/scripts/phase-status.sh` script to get immediate status.

   ```bash
   ./scripts/phase-status.sh
   ```

2. **Evaluate Metrics**:
   - **ADR Compliance**: Ensure A-1, A-2, A-3a, A-3b, and A-8 are showing green checks (✓).
   - **Code Quality**: Check the `:any` count. Our target is ≤ 500. Check console.* occurrences in `auth.service.ts` (must be 0).
   - **Tests**: Verify that tests run successfully and there are no new failures.
   - **Type check**: Confirm TS errors count is 0.

3. **Remediation**:
   - If any ADR checks are failing, immediately address them according to the SPRINT_WEEK2_PLAN or CLAUDE.md guidelines.
   - If `:any` is too high, run `/any-cleanup` to identify target files.
