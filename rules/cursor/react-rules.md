---
description: "React 19 & Next.js components standards"
globs: ["**/*.tsx", "**/*.jsx"]
alwaysApply: false
---
# React 19 & Next.js rules

This ruleset governs React components, hooks, Next.js page structure, and UI coding practices.

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
