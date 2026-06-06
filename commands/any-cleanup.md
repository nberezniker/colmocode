---
description: Find :any patterns and propose replacements with grep + analysis
allowed-tools: Bash(*)
---

# Any Cleanup

Scan codebase for `: any` patterns, group by file, suggest replacements.

```bash
cd /Users/nikiti4/Downloads/Antigravity

echo "## :any cleanup report"
echo ""

TOTAL=$(grep -rh ": any" src/ --include="*.ts" --include="*.tsx" | wc -l | tr -d ' ')
echo "Total :any: $TOTAL (target ≤ 500)"
echo ""

echo "### Top 10 dirtiest files"
grep -rn ": any" src/ --include="*.ts" --include="*.tsx" 2>/dev/null \
  | awk -F: '{print $1}' \
  | sort | uniq -c | sort -rn | head -10 | awk '{printf "  %3d  %s\n", $1, $2}'

echo ""
echo "### Common patterns (with sample line)"
echo ""
echo "**catch (error: any) → catch (error: unknown):**"
grep -rn "catch.*: any" src/ --include="*.ts" --include="*.tsx" 2>/dev/null | head -5 | sed 's/^/  /'
echo ""
echo "**Record<string, any> → Record<string, unknown>:**"
grep -rn "Record<string, any>" src/ --include="*.ts" --include="*.tsx" 2>/dev/null | head -5 | sed 's/^/  /'
echo ""
echo "**any[] → unknown[]:**"
grep -rn ": any\[\]" src/ --include="*.ts" --include="*.tsx" 2>/dev/null | head -5 | sed 's/^/  /'

echo ""
echo "### Suggested fixes"
echo "  1. catch (error: any) → catch (error: unknown), then narrow with instanceof"
echo "  2. Record<string, any> → Record<string, unknown>"
echo "  3. response: any → use Zod schema or define interface"
echo "  4. parameter: any → use generics or specific union type"
```
