---
description: Scout codebase issues, identify problem locations, and suggest resolutions.
---

This workflow is used for deep, read-only analysis of the codebase to identify root causes and suggest plans before implementation.

### Steps:

1. **Scout Phase**:
   - Use `find_by_name` or `glob_search` to find relevant files.
   - Use `grep_search` to find patterns or error signatures.
   - Use `list_dir` to understand the directory structure.

2. **Analysis Phase**:
   - Read relevant files using `view_file` or `mcp_filesystem_read_text_file`.
   - Track line numbers and code snippets.
   - Analyze logic errors, bottlenecks, or architectural mismatches.

3. **Report Generation**:
   Generate a **SCOUT REPORT** with the following sections:
   - **Problem Statement**: Clear summary of the issue.
   - **Findings**: List of affected files and lines.
   - **Root Cause Analysis**: Technical explanation of the issue.
   - **Suggested Resolution**: Step-by-step strategy for fixing, including specific code changes suggested.

4. **Tone Check**:
   Maintain the **Senior Software Architect** persona. Direct, precise, no fluff.
