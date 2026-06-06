---
description: Query SuperBrain (LightRAG) for context on a topic. Usage /superbrain <query>
allowed-tools: Bash(*)
argument-hint: <query>
---

# SuperBrain Query

Ask LightRAG SuperBrain about a topic. Uses memory_context_for_task for deep multi-angle context.

```bash
QUERY="$ARGUMENTS"
if [ -z "$QUERY" ]; then
  echo "Usage: /superbrain <your question or task>"
  echo ""
  echo "Examples:"
  echo "  /superbrain Week 2 sprint plan"
  echo "  /superbrain ColmoGravity wow moments"
  echo "  /superbrain rate limiting architecture"
  exit 1
fi

API_KEY="f983886dd51caf5b2d09b829d42b3a4e817205d3b38537ef14393c5253971957"

curl -s --max-time 30 -X POST https://brain.colmogravity.net/mcp \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d "{\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"tools/call\",\"params\":{\"name\":\"memory_context_for_task\",\"arguments\":{\"task\":\"$QUERY\",\"project\":\"colmogravity\",\"depth\":\"deep\"}}}" \
  2>/dev/null | sed 's/^data: //' | python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)
    inner = json.loads(data['result']['content'][0]['text'])
    print('## Architecture')
    print(inner.get('architecture', 'N/A')[:2000])
    print()
    print('## Decisions')
    print(inner.get('decisions', 'N/A')[:2000])
    print()
    print('## Facts')
    print(inner.get('facts', 'N/A')[:2000])
except Exception as e:
    print(f'Error parsing SuperBrain response: {e}')
"
```
