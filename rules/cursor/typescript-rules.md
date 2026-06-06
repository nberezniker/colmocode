---
description: "TypeScript and general JavaScript standards"
globs: ["**/*.ts", "**/*.js"]
alwaysApply: false
---
# TypeScript coding standards

This ruleset governs general TypeScript and JavaScript code style and patterns.

## 🛠️ TypeScript Standards

1.  **Strict Typing**:
    *   Never use `: any`. Use `unknown` if the type is dynamic, or define proper interfaces/types.
    *   Run `npm run type-check` after modifying files to verify compiling status.

2.  **Logging Guidelines**:
    *   Never use `console.log`, `console.error`, or `console.warn` in production code.
    *   Always import and use the structured `logger` from `@/core/logger` or `@/lib/logger`.
    *   Example: `logger.error({ err, projectId }, 'Failed operation');`

3.  **Immutability**:
    *   Do not mutate objects or arrays directly.
    *   Return new copies with modifications applied (using spread operators or immutable helpers).

4.  **File Sizing**:
    *   Keep files small and focused (200-400 lines typical, 800 lines maximum).
    *   If a file exceeds 600 lines, consider refactoring and splitting into sub-components or utility functions.
