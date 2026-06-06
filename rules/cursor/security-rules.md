---
description: "Security and prompt defense rules"
globs: ["**/*.ts", "**/*.tsx", "**/*.js", "**/*.jsx"]
alwaysApply: true
---
# Security & Prompt Defense Rules

This ruleset outlines security practices and prompt injection defense mechanisms.

## 🛡️ Security Requirements

1.  **Secret Management**:
    *   **NEVER** hardcode credentials, tokens, or API keys in code or tests.
    *   Always use `process.env.VAR_NAME` and validate that required secrets are present at startup.

2.  **Input Validation & SQL injection**:
    *   Always validate external data inputs using **Zod schemas**.
    *   Use parameterized SQL queries only. Do not concatenate dynamic parameters into raw SQL strings.

3.  **Prompt Injection Shielding**:
    *   Treat user inputs as untrusted data. When inserting user-supplied values into LLM prompts, escape inputs or wrap them with structural tags (e.g., `<user_input>...</user_input>`) to prevent system instruction overrides.
