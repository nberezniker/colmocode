# Testing & Security Guidelines

This ruleset governs testing practices and security requirements in this repository.

---

## 🧪 Testing Guidelines (TDD & E2E)

1.  **Test-Driven Development (TDD) Workflow**:
    *   **RED**: Write a failing test first that specifies the expected behavior.
    *   **GREEN**: Write the minimal code required to make the test pass.
    *   **REFACTOR**: Clean up the code, improve structure/performance, and ensure tests remain green.

2.  **Test Location & Naming**:
    *   Place component tests next to the components in a `__tests__` folder (e.g., `src/components/gdpr/__tests__/CookieBanner.test.tsx`).
    *   Name test files as `[filename].test.ts` or `[filename].test.tsx`.
    *   Use descriptive test names (e.g., `test('renders fallback when trial is expired', () => {})`).

3.  **Frameworks**:
    *   **Vitest**: Use for unit and integration testing of hooks, utils, and state logic.
    *   **Playwright**: Use for critical end-to-end user flows and multi-page validation.

---

## 🛡️ Security & Prompt Defense

1.  **Secret Management**:
    *   **NEVER** hardcode credentials, tokens, or API keys in code or tests.
    *   Always use `process.env.VAR_NAME` and throw an informative error at runtime if the variable is missing.

2.  **Input Validation & SQL injection**:
    *   Always validate external data inputs using **Zod schemas**.
    *   Use parameterized SQL queries only. Do not concatenate dynamic parameters into raw SQL strings.

3.  **Prompt Injection Shielding**:
    *   Treat user inputs as untrusted data. When inserting user-supplied values into LLM prompts, escape inputs or wrap them with structural tags (e.g., `<user_input>...</user_input>`) to prevent system instruction overrides.
