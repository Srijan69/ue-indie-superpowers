---
name: game-design-docs
description: Use when writing, formalizing, or reviewing game design documents, including pitches, mechanic specs, system specs, level briefs, enemy specs, and encounter specs for an Unreal Engine project.
---

# Game Design Docs

Good design docs are short, concrete and testable. A doc that can't be tested in PIE is not finished.

## Rules

- One page beats ten. Link, don't repeat.
- Every rule is observable and testable.
- Every number has a **starting value** and is marked as a tuning knob.
- No "TBD", "etc.", "as appropriate". Decide, or list it under Open Questions.
- Always include a **cut-down version** for when time runs out.
- Save to `Docs/designs/`; update the doc when the design changes.

## Templates

### Pitch (one page)
Title · one-sentence hook · 3 design pillars · target player · core loop (verb → challenge → reward → growth) · main mechanics · progression · platform, team, timeline · reference games and what differs · biggest risks · minimum shippable version.

### Mechanic spec
Purpose (what experience) · player-facing rules · inputs · feedback (visual / audio / UI / haptic) · numbers and tuning knobs with starting values · edge cases and fail states · interactions with other systems · data needed · how to test · cut-down version.

### System spec (economy, inventory, progression, crafting, combat)
Inputs/outputs · data model (Data Assets vs Data Tables) · formulas with worked examples · balance levers · exploit risks · UI needs · save-data needs · dependencies.

### Level brief
Purpose (learn / feel / do) · duration · entry and exit state · mechanics used or taught · critical path · encounters (space, enemies, player options) · secrets · pacing curve · metrics · art/audio mood · playtest questions.

### Enemy / NPC spec
Role in the game · silhouette and readability · behaviours (idle, detect, chase, attack, flee) · attack telegraphs (windup, active, recovery in seconds) · health/damage numbers · weaknesses · counterplay · spawn rules · difficulty scaling · AI approach (BT, StateTree, or BP state machine).

### Encounter spec
Space layout · enemy mix and spawn timing · player tools · cover/verticality · win and fail conditions · checkpoint · expected duration · difficulty target.

## Review before finalizing
Placeholders? Contradictions? Is each rule testable? Is the scope achievable in the stated time? Is the cut-down version defined?
