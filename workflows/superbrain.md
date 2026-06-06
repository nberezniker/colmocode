---
description: /superbrain - Query unified ColmoBrain LightRAG server for architecture, decisions, and facts
---

# /superbrain

Query the LightRAG ColmoBrain V2 server to retrieve architecture guidelines, historical decisions, and key project facts to ensure perfect alignment across agents and developers.

## Workflow

1. **Invoke Query**:
   Run the `/Users/nikiti4/Downloads/Antigravity/scripts/superbrain.sh` script passing your search term or question as an argument:

   ```bash
   ./scripts/superbrain.sh "<your question or topic>"
   ```

2. **Retrieve Context**:
   - The script will connect to `brain.colmogravity.net` via MCP.
   - It retrieves structured context using LightRAG memory retrieval.
   - It prints clean sections: Architecture, Decisions, and Facts.
