---
description: Scaffold and document a new custom OpenClaw autonomy skill
---

# Create an OpenClaw Skill

Follow this workflow to generate a new capability (skill) for the OpenClaw gateway. 
Every skill requires a `SKILL.md` file located at `openclaw/skills/<skill-name>/SKILL.md`.

## 1. Create the Skill Directory
Replace `<skill-name>` with the appropriate name (kebab-case).

```bash
mkdir -p ~/openclaw/skills/<skill-name>
```

## 2. Scaffold the SKILL.md file
Create the `SKILL.md` file within the new directory and use the template below.

Template:
```markdown
---
name: <skill-name>
description: A short description of what this skill allows the agent to do.
homepage: https://example.com
metadata:
  {
    "openclaw":
      {
        "emoji": "🤖",
        "requires": { "bins": ["<required-cli-tool>"], "env": ["<REQUIRED_ENV_VAR>"] },
        "install":
          [
            {
              "id": "brew",
              "kind": "brew",
              "formula": "<brew/formula>",
              "bins": ["<required-cli-tool>"],
              "label": "Install <skill-name> dependencies",
            },
          ],
      },
  }
---

# <skill-name>

Explain the primary use-case of the skill here.

## Quick start
- Provide 2-3 examples of how the agent or user should invoke the tool from the CLI or via context.

## Notes & Rules
- Provide parsing rules, token limits, or constraints.
- Emphasize edge cases where the skill might fail.
```

## 3. Implement Accompanying Scripts (Optional)
If the skill requires deeper automation scripts rather than just leveraging an existing CLI tool:
1. Create a `scripts` folder inside the skill directory.
2. Add your Node.js/Python or Bash scripts there.
3. Update `SKILL.md` to show how to invoke these scripts.

## 4. Reload OpenClaw
Restart the openclaw service or the development TUI to trigger a reload of local skills so the new one gets synchronized.
