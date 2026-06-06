# Antigravity Superpowers & UX Pack 🚀

This repository contains a curated pack of **10 Superpowers (Workflows)** and **110 UI/UX & Product Design Skills** designed to run seamlessly in agentic environments like **Antigravity**, **Claude Code**, **Codex**, and **Cursor**.

It empowers agents to build premium, high-converting, and beautiful interfaces quickly and cost-effectively, combining strict software engineering practices (TDD) with high-end visual aesthetics.

## 📂 Repository Structure

- `workflows/` — 10 Superpowers & workflows (e.g. `/forge`, `/architect`, `/conversion-booster`, `/debug-machine`).
- `skills/` — 110+ Design & UX skills (e.g. `Taste Skill`, `Refactoring UI`, `Hooked UX`, `Design Sprint`, `Interface Design`).
- `install.sh` — The universal bootstrap installer.

## ⚡ Installation

Clone this repo or download the ZIP, then run the installer in the root of your target project:

```bash
# For Antigravity (Default)
./install.sh antigravity

# For Claude Code
./install.sh claude

# For Codex CLI
./install.sh codex

# For Cursor
./install.sh cursor
```

## 🦾 Dynamic Loading Pattern (Base vs. On-Demand)

To keep context window clean and optimize token usage, the pack distinguishes between two tiers:

1. **Base Load (Core CLI + workflows)**: Always active. Handles standard file system operations, terminal commands, and basic task planning.
2. **On-Demand (Task-Specific)**: Advanced design and product skills are marked as lazy-loaded or on-demand. They are only loaded into the agent's context when specific keywords (e.g., "AB-test", "design-system", "retention", "brutalism") are detected in the user's request.
