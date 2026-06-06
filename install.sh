#!/bin/bash
# Antigravity UX & Superpowers Pack Installer
# Usage: ./install.sh [target_agent]
# Targets: claude | codex | cursor | antigravity (default)

TARGET_AGENT=${1:-"antigravity"}

echo "🚀 Starting Antigravity Pack Installation for agent: $TARGET_AGENT"

# 1. Determine destination folders
case $TARGET_AGENT in
  "claude")
    SKILLS_DIR=".claude/skills"
    RULES_DIR=".claude/rules"
    AGENTS_DIR=".claude/agents"
    COMMANDS_DIR=".claude/commands"
    ;;
  "codex")
    SKILLS_DIR=".codex/skills"
    RULES_DIR=".codex"
    ;;
  "cursor")
    SKILLS_DIR=".agents/skills"
    RULES_DIR=".cursor/rules"
    ;;
  "antigravity"|*)
    SKILLS_DIR=".agents/skills"
    RULES_DIR=".antigravity"
    ;;
esac

echo "📂 Destination directories:"
echo "   Skills: $SKILLS_DIR"
echo "   Rules: $RULES_DIR"

# Create directories
mkdir -p "$SKILLS_DIR"
mkdir -p "$RULES_DIR"
mkdir -p ".agents/workflows"

# 2. Base Load (Core Skills & Workflows)
echo "📦 Installing Base Load (Core Workflows: planner, forge, debug-machine, etc.)..."

# Copy core workflows
if [ -d "workflows" ]; then
  cp -R workflows/*.md .agents/workflows/ 2>/dev/null
  echo "✅ Core workflows installed."
else
  echo "⚠️ Warning: 'workflows' directory not found in the package."
fi

# 3. Rules & Agents Configuration
echo "⚙️ Setting up agent-specific rules and configurations..."
case $TARGET_AGENT in
  "claude")
    if [ -d "rules/claude" ]; then
      mkdir -p "$RULES_DIR" "$AGENTS_DIR" "$COMMANDS_DIR"
      cp -R rules/claude/* "$RULES_DIR"/ 2>/dev/null || true
      cp -R agents/* "$AGENTS_DIR"/ 2>/dev/null || true
      cp -R commands/* "$COMMANDS_DIR"/ 2>/dev/null || true
      echo "✅ Claude Code custom rules, agents, and commands installed."
    fi
    ;;
  "codex")
    if [ -f "rules/codex/rules.md" ]; then
      cp rules/codex/rules.md "$RULES_DIR/rules.md"
      echo "✅ Codex CLI custom rules installed."
    fi
    ;;
  "cursor")
    if [ -d "rules/cursor" ]; then
      cp -R rules/cursor/* "$RULES_DIR"/ 2>/dev/null || true
      echo "✅ Cursor IDE custom rules (.cursorrules) installed."
    fi
    ;;
  "antigravity")
    if [ -f "rules/antigravity/rules.md" ]; then
      cp rules/antigravity/rules.md "$RULES_DIR/rules.md"
      echo "✅ Antigravity engine custom rules installed."
    fi
    ;;
esac

# 4. UI/UX Pro Max Setup
echo "🎨 Setting up UI/UX Pro Max Design Generator..."
if command -v npm &> /dev/null; then
  echo "⚙️ Installing uipro-cli globally..."
  npm i -g uipro-cli
  uipro init --ai "$TARGET_AGENT"
  echo "✅ UI/UX Pro Max configured."
else
  echo "⚠️ npm not found. Skipping global uipro-cli installation."
fi

# 5. Selective / On-Demand Skills Loader
echo "📥 Copying On-Demand Skills (Hooked UX, Design Sprint, Taste Skill, Refactoring UI, etc.)..."
if [ -d "skills" ]; then
  cp -R skills/* "$SKILLS_DIR"/ 2>/dev/null
  echo "✅ 110+ on-demand skills copied to $SKILLS_DIR"
else
  echo "⚠️ Warning: 'skills' directory not found in the package."
fi

echo "🎉 Antigravity Pack installed successfully!"
echo "------------------------------------------------------------------"
echo "💡 Usage tips for your agent:"
echo "   - To generate a design system, ask the agent to run:"
echo "     uipro init --ai $TARGET_AGENT && uipro search \"[keywords]\" --design-system"
echo "   - Workflows are available in .agents/workflows/ and can be triggered via:"
echo "     /forge, /debug-machine, /conversion-booster"
echo "------------------------------------------------------------------"
