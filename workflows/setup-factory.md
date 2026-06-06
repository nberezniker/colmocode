---
description: Set up a new Antigravity factory environment with all MCP servers, CLI tools, and OpenClaw skills
---

# Environment Bootstrap Factory Setup

Follow these steps when moving the Antigravity system to a new machine or when standardizing a fresh environment for development.

## 1. Global MCP Server Dependencies
Install all required Model Context Protocol servers globally.
```bash
// turbo
npm install -g @composio/mcp @modelcontextprotocol/server-filesystem @modelcontextprotocol/server-github @modelcontextprotocol/server-memory @modelcontextprotocol/server-puppeteer @modelcontextprotocol/server-sequential-thinking firecrawl-mcp @steipete/oracle
```

## 2. CLI Tooling and Homebrew Packages
Install the required custom CLI taps for media, communication, and navigation.
```bash
// turbo
brew tap steipete/tap
```

```bash
// turbo
brew install steipete/tap/sag steipete/tap/gifgrep steipete/tap/gogcli steipete/tap/goplaces steipete/tap/camsnap steipete/tap/peekaboo steipete/tap/imsg steipete/tap/wacli steipete/tap/ordercli steipete/tap/songsee steipete/tap/summarize
```

## 3. Core Libraries & Python Setup
Ensure the base environment has Python and uv set up.
```bash
// turbo
brew install python@3.12 uv
```

## 4. Transfer OpenClaw Skills
The autonomy gateway relies on a rich library of skills. Copy them over from your backup.
```bash
# This assumes the backup openclaw skills folder exists in ~/Downloads/openclaw/skills
# Adjust the source path as needed.
rsync -av ~/Downloads/openclaw/skills/ ~/openclaw/skills/
```

## 5. Verify the Installation
Run the following commands to confirm everything is successfully established:
```bash
npm list -g --depth=0
```
```bash
brew leaves
```
