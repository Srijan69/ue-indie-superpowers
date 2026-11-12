---
name: ue-writing-plans
description: Use when you have an approved game design or requirements and need a step-by-step implementation plan for Unreal Engine and Blueprints, before touching the project.
---

# Writing UE Implementation Plans

Write the plan as if the person executing it knows UE but nothing about this project or design. Spell out exactly what to create and how to check it. Small tasks, frequent verification, no guessing.

Save to `Docs/plans/YYYY-MM-DD-<feature>.md`.

## Plan header

```
# <Feature> Implementation Plan
Goal: one sentence
Design doc: path
Approach: 2-3 sentences (architecture)
Assets: new/modified assets with full paths and parent classes
Test procedure: how to confirm it works in PIE
Risks: ...
```

## Task size

Each task: 2 to 15 minutes, one logical change, ends with a verification. Order by dependency and by **playable ASAP**: something testable within the first few tasks.

## Task template

```
### Task N: <name>
Create/Modify: /Game/Project/Path/BP_Name (Parent: Character)
Variables: bIsSprinting (bool, default false, category Movement); SprintSpeed (float, 700)
Logic (pseudo-graph):
  IA_Sprint (Started)   -> Set bIsSprinting true  -> Set Max Walk Speed = SprintSpeed
  IA_Sprint (Completed) -> Set bIsSprinting false -> Set Max Walk Speed = WalkSpeed
Wiring: add IA_Sprint to IMC_Default (Left Shift / Gamepad Left Thumbstick Click)
Verify: compile clean; PIE: hold Shift, speed increases; release, returns to normal
```

## Include

- Exact asset paths, class parents, variable names, types, defaults.
- Input actions and mapping contexts when input is involved.
- Which values are tuning knobs and where they live.
- Placeholder feedback (sound, particle, UI text) so the feature is testable.
- Checkpoint tasks ("playtest the loop with the user").

## Never include

"TBD", "add error handling", "handle edge cases" without saying which, "similar to Task 3" (repeat the details), steps with no verification.

## Self-review

Does every design requirement map to a task? Is the order dependency-safe? Could someone execute it without asking questions? Is any task bigger than 15 minutes? Then hand off to `ue-executing-plans`.
