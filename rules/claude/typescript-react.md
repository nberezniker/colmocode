# TypeScript & React 19 Coding Rules

This ruleset governs all TypeScript, JavaScript, React, and Next.js development in this repository.

---

## 🛠️ TypeScript Standards

1.  **Strict Typing**:
    *   Never use `: any`. Use `unknown` if the type is dynamic, or define proper interfaces/types.
    *   Run `npm run type-check` after modifying files to verify compiling status.

2.  **Logging Guidelines**:
    *   Never use `console.log`, `console.error`, or `console.warn` in production code.
    *   Always import and use the structured `logger` from `@/core/logger`.
    *   Example: `logger.error({ err, projectId }, 'Failed operation');`

3.  **Immutability**:
    *   Do not mutate objects or arrays directly.
    *   Return new copies with modifications applied (using spread operators or immutable helpers).

4.  **File Sizing**:
    *   Keep files small and focused (200-400 lines typical, 800 lines maximum).
    *   If a file exceeds 600 lines, consider refactoring and splitting into sub-components or utility functions.

---

## ⚛️ React 19 & Next.js Rules

1.  **Component Cohesion**:
    *   Organize folders by feature/domain (e.g. `src/components/gdpr/`), not by technical type.
    *   Use PascalCase for React components (e.g. `CookieBanner.tsx`).
    *   Use camelCase prefixed with "use" for custom hooks (e.g. `useTrialStatus.ts`).

2.  **Server vs Client Components**:
    *   Keep Server Components as the default.
    *   Use `"use client"` directive only at the top of files that require browser APIs, state (`useState`), or lifecycle hooks (`useEffect`).
    *   Minimize client-side state. Pass data from Server Components where possible.

3.  **Error Boundaries & Fallbacks**:
    *   Use React 19 Error Boundaries to wrap UI sections prone to runtime exceptions.
    *   Provide friendly fallback interfaces and log technical details to the server-side logger.
