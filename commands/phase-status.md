---
description: Dashboard with current Week 2 sprint progress (tests, :any, console, ADR compliance)
allowed-tools: Bash(*)
---

# Phase Status

Run a one-shot status check across all critical Week 2 metrics.

```bash
cd /Users/nikiti4/Downloads/Antigravity

echo "## Week 2 Sprint Status"
echo ""
echo "### ADR compliance"
[ ! -f src/app/api/auth/trial/route.ts ] && echo "  ✓ A-1: /api/auth/trial deleted (ADR-001)" || echo "  ✗ A-1: /api/auth/trial still exists"
[ ! -f src/lib/db/schema.sql ] && echo "  ✓ A-2: schema.sql deleted (ADR-002)" || echo "  ✗ A-2: schema.sql still exists"
[ -f src/lib/db/migrations/006_add_device_columns.sql ] && echo "  ✓ A-3a: migration 006 created" || echo "  ✗ A-3a: missing migration 006"
[ -f src/lib/db/migrations/007_email_verification_tokens.sql ] && echo "  ✓ A-3b: migration 007 created" || echo "  ✗ A-3b: missing migration 007"
[ -f src/app/api/health/ready/route.ts ] && echo "  ✓ A-8: deep health endpoint created" || echo "  ✗ A-8: missing /api/health/ready"

echo ""
echo "### Code quality"
ANY_COUNT=$(grep -rh ": any" src/ --include="*.ts" --include="*.tsx" 2>/dev/null | wc -l | tr -d ' ')
CONSOLE_AUTH=$(grep -c "console\." src/modules/auth/auth.service.ts 2>/dev/null || echo 0)
echo "  :any count: $ANY_COUNT (target ≤ 500)"
echo "  console.* in auth.service.ts: $CONSOLE_AUTH (target 0)"

echo ""
echo "### Tests"
npm run test 2>&1 | grep -E "Tests|Test Files" | tail -2 | sed 's/^/  /'

echo ""
echo "### Type check"
npm run type-check 2>&1 | grep -c "error TS" | xargs -I{} echo "  TS errors: {}"

echo ""
echo "### Branch"
echo "  $(git branch --show-current) | $(git log --oneline -1)"
```
