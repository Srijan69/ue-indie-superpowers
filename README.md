# UE Indie Superpowers

**21 skills that teach an AI coding agent (like Codex) to work like a professional indie game developer in Unreal Engine 5, using Blueprints.**

Instead of just answering questions, your AI follows the same habits a good indie dev follows: design before building, keep the project small enough to finish, test everything, and never say "it works" without proof.

---

## What is this? (in simple words)

An AI agent is smart, but it does not know *your way of working*. It might jump straight into building, add too many features, or say "done" without testing.

A **skill** is a small instruction file (`SKILL.md`) that tells the AI how to do one kind of job well. This repo is a bundle of skills for **Unreal Engine game development**:

- how to turn an idea into a clear design,
- how to plan and build step by step,
- how to structure Blueprints cleanly,
- how to design levels, enemies, UI and game feel,
- how to find bugs properly,
- how to finish and release the game.

The AI reads the right skill at the right time, so it behaves like an experienced teammate.

## Who is it for?

- Solo developers and small indie teams using **Unreal Engine 5** with **Blueprints**.
- People who connect an AI agent to the editor through an **Unreal MCP server**.
- Anyone who wants the AI to think about *game design and shipping*, not just code.

## What you need

| Requirement | Notes |
|---|---|
| Unreal Engine 5 | Any recent 5.x version |
| An AI agent that supports skills | Made for [OpenAI Codex](https://github.com/openai/codex); the `SKILL.md` format also works with other agents that load skills (for example Claude Code) |
| Git | To download this repo |
| An Unreal MCP server (optional but recommended) | Lets the AI see and edit your project directly. Without it, the skills still guide the AI and it will give you manual editor steps |

---

## Installation

### Step 1: Download

```bash
git clone https://github.com/<your-username>/ue-indie-superpowers.git
cd ue-indie-superpowers
```

(No Git? Click **Code → Download ZIP** on GitHub and unzip it.)

### Step 2: Install the skills (pick one way)

**Windows (PowerShell)**

```powershell
.\scripts\install.ps1
```

**Mac / Linux**

```bash
bash scripts/install.sh
```

**Manual way (works everywhere)**

Copy every folder inside `skills/` into your agent's skills folder:

| Agent | Skills folder |
|---|---|
| Codex | `~/.codex/skills/` (Windows: `C:\Users\<you>\.codex\skills\`) |
| Claude Code | `~/.claude/skills/` |

Only want the skills for one project? Copy them into `.codex/skills/` inside that project instead.

> Folder locations can change between versions of the agent. If your agent can't find the skills, check its documentation for the current skills directory.

### Step 3: Add the instructions to your project

Open your Unreal project folder and create (or edit) a file called `AGENTS.md`. Paste the contents of [`templates/AGENTS.md`](templates/AGENTS.md). This makes the agent read the skills at the start of every game task.

### Step 4: Connect your Unreal MCP server (optional)

Follow the instructions of the Unreal MCP server you use, and add it to your agent's MCP configuration. For Codex this is usually done in `~/.codex/config.toml`, for example:

```toml
[mcp_servers.unreal]
command = "<command that starts your Unreal MCP server>"
args = ["<arguments>"]
```

Use the exact command from your MCP server's own README. Start Unreal Editor first, with the MCP plugin enabled.

### Step 5: Restart the agent and test

Open your agent inside your Unreal project and say:

> I want to add a sprint mechanic to my third-person game.

If it starts **asking you design questions instead of building straight away**, the skills are working.

---

## What's inside

### Process skills (the AI follows these strictly)

| Skill | What it does |
|---|---|
| `using-ue-skills` | The starting point. Tells the AI which skill to use and when |
| `game-brainstorming` | Turns an idea into an approved design. **No building until you approve** |
| `scope-and-vertical-slice` | Checks the real cost of features, protects your deadline, plans the "vertical slice" |
| `ue-writing-plans` | Writes a small-steps plan with exact asset names and tests |
| `ue-executing-plans` | Builds the plan in small batches and stops to check with you |
| `ue-mcp-workflow` | Rules for safely touching your project through MCP |
| `blueprint-debugging` | Finds the real cause of a bug before fixing it |
| `ue-verification-and-playtesting` | No "it works" without proof (compile, log, play test) |

### Craft skills (the AI adapts these to your game)

| Skill | What it does |
|---|---|
| `game-design-docs` | Short templates for pitch, mechanic, system, level, enemy and encounter docs |
| `blueprint-architecture` | Clean Blueprint structure: components, interfaces, dispatchers, data-driven design |
| `level-design-workflow` | Level briefs, greyboxing, pacing, encounters, level review |
| `game-feel-and-juice` | Makes controls and hits feel good |
| `gameplay-ai-design` | Fair, readable enemy and NPC behaviour |
| `ue-ui-umg-workflow` | HUDs and menus that work with keyboard and controller |
| `ue-data-and-save-systems` | Data Assets, Data Tables, save and load |

### Delivery skills

| Skill | What it does |
|---|---|
| `ue-performance-optimization` | Measure first, then fix FPS problems |
| `ue-project-hygiene` | Naming, folders, source control, cleanup |
| `game-production-planning` | Milestones, weekly goals, cut lists |
| `ue-review-checklist` | Honest, prioritized reviews of Blueprints, levels and designs |
| `ue-packaging-and-release` | Packaging builds and getting ready to release |

### The director

| Skill | What it does |
|---|---|
| `unreal-indie-game-dev` | The overall "professional indie dev" mindset and standards |

---

## How the skills work together

**Adding a new feature**

```
game-brainstorming  ->  scope-and-vertical-slice  ->  ue-writing-plans
        ->  ue-executing-plans  ->  ue-verification-and-playtesting
```

**Fixing a bug**

```
blueprint-debugging  ->  ue-verification-and-playtesting
```

**Building a level**

```
game-design-docs (level brief)  ->  level-design-workflow
        ->  playtest  ->  ue-performance-optimization
```

---

## Example prompts to try

- "Design the core loop for a cozy farming roguelite, and tell me the smallest version I can finish in two weeks."
- "Add an interaction system with prompts, using interfaces and Enhanced Input."
- "Block out a 5-minute tutorial level that teaches double jump."
- "Review my level and tell me where players will get lost."
- "My game runs at 35 FPS. Find out why."
- "Make a 4-week plan to reach a vertical slice and tell me what to cut."

## Add your own skill

1. Create a folder: `skills/my-skill/`
2. Add `SKILL.md` with this header:

```markdown
---
name: my-skill
description: Use when <the situation where the AI should use this skill>
---

# My Skill
Instructions here...
```

3. Add a row for it in `skills/using-ue-skills/SKILL.md` so the AI knows when to use it.
4. Run the install script again.

## Troubleshooting

| Problem | Try this |
|---|---|
| The AI ignores the skills | Check the skills folder path for your agent; restart the agent; confirm `AGENTS.md` is in the project folder |
| The AI can't see my Unreal project | Make sure Unreal Editor is open and the MCP plugin/server is running and listed in the agent's MCP config |
| It asks too many questions | Say "use your best judgment and state your assumptions"; your instructions always win over the skills |
| It's slow because of all the process | Tell it "skip the design phase, just prototype it in a sandbox"; you stay in control |

## FAQ

**Do I need to know C++?** No. These skills are Blueprint-first. C++ is only suggested when there is a measured reason.

**Will it change my project without asking?** The skills tell the AI to work in a sandbox folder when possible and to ask before deleting or overwriting anything. Still, use source control (Git/Perforce) and commit before big changes.

**Is this only for Codex?** It was written for Codex, but the `SKILL.md` format is shared by several agents.

## Contributing

Ideas and improvements are welcome. Open an issue or a pull request. Good additions: Niagara/VFX, audio, narrative and quests, multiplayer decisions.

## License

MIT. See [LICENSE](LICENSE).
