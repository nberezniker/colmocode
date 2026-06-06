---
description: Run vitest only on test files that changed since main
allowed-tools: Bash(*)
---

# Test Only Changed

Speeds up dev loop by running tests only for files modified in current branch.

```bash
cd /Users/nikiti4/Downloads/Antigravity

CHANGED=$(git diff main --name-only | grep -E "\.test\.tsx?$" | tr '\n' ' ')

if [ -z "$CHANGED" ]; then
  echo "No test files changed since main."
  echo ""
  echo "Files changed (non-test):"
  git diff main --name-only | head -20
  exit 0
fi

echo "## Running tests for changed files"
echo "$CHANGED" | tr ' ' '\n' | sed '/^$/d' | sed 's/^/  /'
echo ""

npx vitest run $CHANGED
```
