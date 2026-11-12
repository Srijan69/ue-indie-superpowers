---
name: game-brainstorming
description: Use before building anything new in a game project, including games, mechanics, systems, levels, enemies, or features. Turns a rough idea into an approved design through collaborative questions before any asset or Blueprint is created.
---

# Game Brainstorming

Turn ideas into clear, scoped designs through conversation, the way a good game designer pitches and pressure-tests an idea with a teammate.

<HARD-GATE>
Do NOT create assets, write Blueprints, place actors or change the project until you have presented a design and the user has approved it. This applies to every request, however simple. A "simple" feature is where unexamined assumptions waste the most time. The design can be a few sentences, but you must present it and get approval.
</HARD-GATE>

## Checklist (do in order)

1. **Explore context (read-only).** Inspect the project via MCP: engine version, maps, existing Blueprints, input setup, plugins. Note what exists so you don't duplicate it.
2. **Ask clarifying questions, one at a time.** Prefer multiple choice. Cover only what changes the design: player fantasy/goal, genre and perspective (2D/3D, first/third person, top-down), core verbs, session length, target platform, solo or team, time budget, art/asset situation, **single-player or multiplayer** (replication changes everything, so settle it now).
3. **Propose 2 to 3 approaches** with trade-offs: a cheapest-playable version, a balanced one, an ambitious one. Lead with your recommendation and why, including build cost.
4. **Present the design in short sections**, scaled to the task (a sentence for a small feature, a few paragraphs for a system). Cover: player experience, rules, controls/feedback, data needed, edge cases, how to test it, what's out of scope. Ask after each section if it looks right.
5. **Write the design** to `Docs/designs/YYYY-MM-DD-<topic>.md` in the project (use `game-design-docs` templates).
6. **Self-review:** no placeholders or TBD, no contradictions, scope matches the stated time budget, every rule is testable.
7. **User reviews the written design.** Wait for approval; apply changes.
8. **Hand off:** invoke `scope-and-vertical-slice`, then `ue-writing-plans`. Do not start building directly.

## Principles

- **One question per message.** Don't interrogate.
- **Fun first.** Ask what the player does moment to moment and why it's satisfying.
- **YAGNI ruthlessly.** Cut features that don't serve the core loop or the pillars.
- **Decompose big requests.** If it spans several independent systems (combat, inventory, crafting, quests), say so and design one at a time in dependency order.
- **Prefer proven patterns** from existing games, then say what's different.
- **Be honest about cost.** If it's a six-month feature for a one-month game, say so kindly and offer the small version.

## Red flags

| Thought | Reality |
|---|---|
| "I'll just prototype it quickly" | Fine only after the intent is agreed, and it should be greybox. |
| "They gave detailed requirements" | Details often hide missing decisions (multiplayer, camera, scope). Confirm. |
| "I'll ask everything now" | One question at a time keeps the conversation usable. |
