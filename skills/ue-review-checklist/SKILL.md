---
name: ue-review-checklist
description: Use when asked to review, audit, critique, or give feedback on Blueprints, levels, game designs, UI, or a project, or when receiving review feedback and deciding what to act on.
---

# UE Review Checklist

Reviews should be specific, prioritized and actionable. Inspect before you judge.

## Process

1. Clarify what the work is meant to do (the design intent) and the target (platform, scope, stage).
2. **Inspect via MCP:** open/read the actual assets; don't review from the description alone.
3. Review against the checklist below.
4. Report by severity with concrete fixes.

## Checklist

**Design:** serves the pillars and core loop · clear goal and feedback · fair difficulty · scope realistic.
**Blueprints:** correct class roles · components/interfaces over casts · no Tick abuse · no unsafe `Get All Actors` loops · exposed tuning values · Is Valid checks where needed · readable graphs · compile clean.
**Data:** numbers in data, not hard-coded · soft references for heavy assets · save data considered.
**Levels:** metrics respected · clear flow · encounter fairness · NavMesh/collision · lighting readability · performance.
**UI:** controller + keyboard · scaling · feedback · decoupled from gameplay.
**Hygiene:** naming and folders · no test leftovers · references clean.
**Performance:** measured against the budget (not guessed).
**Playability:** has it actually been playtested?

## Severity

- **Blocker:** crash, softlock, data loss, can't progress, packaging failure.
- **Important:** unfair or unclear, major bug, serious performance problem, fragile architecture.
- **Nice to have:** polish, small cleanup, future-proofing.

## Output

```
Summary: 2-3 sentences, including what's working well
Blockers: ...
Important: ...
Nice to have: ...
Recommended next step: ...
```

Praise specific strengths; be direct about problems and the reason they matter to the player.

## Receiving review (including the user's feedback on your work)

Verify the feedback against the project before changing things. If it's unclear, ask. If you disagree, explain with evidence. Don't agree performatively; fix what's valid, one item at a time, and re-verify.
