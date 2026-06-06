---
description: /test-only-changed - Run vitest only on test files modified in this branch
---

# /test-only-changed

Runs vitest execution specifically and only for the test files that have modifications compared to the `main` branch. This speeds up the development loop by avoiding running slow global tests.

## Workflow

1. **Run Tests**:
   Execute the `/Users/nikiti4/Downloads/Antigravity/scripts/test-only-changed.sh` script:

   ```bash
   ./scripts/test-only-changed.sh
   ```

2. **Analysis**:
   - If no tests have changed, it will print a list of modified files that are non-test files.
   - If changed test files are found, it will run only those test files in vitest.
