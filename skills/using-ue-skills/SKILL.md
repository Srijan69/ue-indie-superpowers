---
name: using-ue-skills
description: Use at the start of any conversation about Unreal Engine, Blueprints, or game development, before any response, clarifying question, or action. Establishes how to find and apply the UE indie game-dev skill library.
---

# Using the UE Indie Skills

You have a library of skills for building indie games in Unreal Engine 5 with Blueprints. They encode process that professional indie developers learned the hard way. Check them before acting, every time.

## The rule

**If there is even a 1% chance a skill applies to what you are about to do, read it and follow it first.** This applies before clarifying questions, before exploring the project, and before touching a single Blueprint. Skills tell you HOW to explore, ask and build.

## Instruction priority

1. The user's explicit instructions (direct requests, AGENTS.md). If the user says "skip the design phase" or "just do it", follow them.
2. These skills.
3. Your default habits.

## Which skill when

| Situation | Skill |
|---|---|
| New game, feature, mechanic or idea | `game-brainstorming` |
| Writing down a design | `game-design-docs` |
| Idea feels big / adding a feature / planning a milestone | `scope-and-vertical-slice` |
| Any action in the editor through MCP | `ue-mcp-workflow` |
| Turning an approved design into steps | `ue-writing-plans` |
| Carrying out a plan | `ue-executing-plans` |
| Structuring Blueprints, classes, communication | `blueprint-architecture` |
| Bug, crash, "it doesn't work", Accessed None | `blueprint-debugging` |
| About to say "done" / "works" | `ue-verification-and-playtesting` |
| Building or reviewing a level | `level-design-workflow` |
| Controls, camera, impact, "it feels bad" | `game-feel-and-juice` |
| Enemies, NPCs, behaviour | `gameplay-ai-design` |
| HUD, menus, widgets | `ue-ui-umg-workflow` |
| Low FPS, hitches, memory | `ue-performance-optimization` |
| Naming, folders, source control, cleanup | `ue-project-hygiene` |
| Items, stats, saves, settings, balance data | `ue-data-and-save-systems` |
| Schedules, milestones, backlog, cuts | `game-production-planning` |
| Reviewing Blueprints, levels or designs | `ue-review-checklist` |
| Building a release / demo | `ue-packaging-and-release` |
| Everything else game-dev related, or the big picture | `unreal-indie-game-dev` |

## Order

Process skills first (brainstorming, scope, debugging), then implementation skills.
- "Build X" → `game-brainstorming` → `scope-and-vertical-slice` → `ue-writing-plans` → `ue-executing-plans` → `ue-verification-and-playtesting`.
- "Fix X" → `blueprint-debugging` first, then implementation skills.

## Rigid vs flexible

Rigid skills (`blueprint-debugging`, `ue-verification-and-playtesting`, `ue-mcp-workflow`): follow exactly. Flexible skills (design, level, feel): adapt the principles to context.

## Red flags: you are rationalizing

| Thought | Reality |
|---|---|
| "It's just a quick Blueprint" | Small things become systems. Check the skill. |
| "Let me look at the project first" | Skills say how to look. Check first. |
| "I remember how that node works" | Engine versions change. Verify. |
| "No need for a design, it's obvious" | Unexamined assumptions cause the most rework. |
| "The user wants speed" | Skipping design and testing is slower. Keep it short, not absent. |
| "I'll playtest at the end" | Bugs compound. Test each increment. |
| "One more feature won't hurt" | Check scope cost first. |
