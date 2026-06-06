# Codex Rules & Agent Guidelines

This file governs Codex CLI behavior when working on this repository.

---

## 🛠️ TypeScript & React 19 Standards

1.  **Strict Typing**: Do not use `: any`. Use `unknown` or proper types. Run `npm run type-check` to verify code correctness.
2.  **Structured Logger**: Do not use `console.log/error/warn`. Import and use structured `logger` from `@/lib/logger` (or `@/core/logger`).
3.  **React 19 & Next.js**: Keep Server Components as the default. Use `"use client"` only for files requiring browser API or hook state. Wrap prone sections in Error Boundaries.

---

## 🧪 Testing (TDD) & Security

1.  **TDD (Test-Driven Development)**:
    *   **RED**: Write a failing test first.
    *   **GREEN**: Write minimal code to pass the test.
    *   **REFACTOR**: Improve design while keeping tests green.
2.  **Security Defense**:
    *   Never hardcode secrets. Always use `process.env.VAR_NAME`.
    *   Validate all external inputs via **Zod schemas**.
    *   Protect against SQL Injection by using parameterized queries.

---

## 🤖 Agent Roles & Delegation

When collaborating, Codex agents should align with these roles:
-   **Planner**: Specializes in creating detailed, structured technical implementation plans before code modification.
-   **Architect**: Specializes in high-level structure, migrations, and ADR alignment.
-   **TDD Guide**: Focuses on writing tests first and guiding the TDD cycle.
