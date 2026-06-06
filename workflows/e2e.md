---
description: /e2e - Generate and run Playwright end-to-end tests for critical user flows
---

# /e2e (End-to-End Testing with Playwright)

Use this workflow to write, run, and verify Playwright E2E tests for critical user journeys.

## When to Use

- Before deploying to production (pre-deploy gate)
- After changing multi-page user flows (e.g., trial signup, OAuth, checkout)
- When verifying accessibility on real pages

## Workflow Phases

### Phase 1: Identify Critical Flows
1. List the top user flows requiring E2E coverage (e.g., landing → /try → signup → dashboard).
2. Check existing E2E tests in `e2e/` or `tests/e2e/` to avoid duplication.

### Phase 2: Write Tests
1. Create test files using Playwright's `test()` API.
2. Use `page.goto()`, `page.getByRole()`, `page.getByText()`, `expect()`.
3. Avoid hard-coded selectors (class names). Prefer role-based and text-based queries.
4. Name files as `[flow-name].e2e.ts`.

### Phase 3: Run Tests
```bash
npx playwright test
npx playwright test e2e/specific-flow.e2e.ts
```

### Phase 4: Report & Fix
1. Review failing tests. Fix the **code**, not the tests (unless tests are wrong).
2. Re-run until all green.
3. Commit test files alongside the code changes they validate.

## Anti-Patterns
- Do NOT use `page.waitForTimeout()` for flaky waits — use `page.waitForSelector()` or `expect().toBeVisible()`.
- Do NOT test implementation details (internal state, CSS classes) — test user-visible behavior.
