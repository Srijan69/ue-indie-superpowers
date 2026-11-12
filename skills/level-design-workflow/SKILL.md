---
name: level-design-workflow
description: Use when designing, blocking out, reviewing, or improving levels, maps, encounters, pacing, or player flow in Unreal Engine, including greyboxing, World Partition, lighting for gameplay, and level playtesting.
---

# Level Design Workflow

Design levels for the player's experience first, geometry second.

## Process

1. **Brief:** write a one-line purpose (what the player learns, feels, does) and a level brief (`game-design-docs`).
2. **Metrics first:** record character capsule size, walk/run speed, jump height and distance, camera height, door widths, cover heights, grid size. Build to these and snap to the grid.
3. **Layout:** sketch the critical path, loops, landmarks and encounter spaces (top-down description or ASCII).
4. **Greybox:** block out with BSP/Modeling Mode or simple meshes. No art until it plays well.
5. **Gameplay pass:** encounters, pickups, checkpoints, triggers, tutorials, secrets.
6. **Playtest** (`ue-verification-and-playtesting`); fix flow, readability and difficulty.
7. **Art pass → lighting → audio/VFX → optimization → final playtest.**

## Principles

- **Teach, test, twist** each mechanic.
- **Navigation:** clear critical path, landmarks visible from afar, leading lines, light and colour guiding the eye, loops back to known areas, dead ends only with rewards.
- **Pacing:** alternate tension, release and discovery; vary space size (compression and release); rest beats after intensity.
- **Encounters:** define space, enemy mix, player options, cover/verticality and fail fairness. Checkpoint before a challenge, not after.
- **Telegraph danger**; give players the information to decide.
- **Reward exploration** with meaningful, readable secrets.
- **Lighting is a gameplay tool:** bright attracts, contrast shows interactables, silhouettes read.

## Technical health

World Partition/streaming for large worlds, Data Layers or sublevels for organization, correct collision, NavMesh coverage, LODs and culling, lighting budget (Lumen/shadows), no stray test actors, level Blueprint kept minimal.

## Review checklist (severity: blocker / important / nice)

Can a new player tell where to go? Anything unfair or unreadable? Where might they get stuck or break the route (sequence breaks, falling out of the world)? Does pacing match the plan? Does it hit the frame-rate target? Is everything on NavMesh and collision where intended?

## Output when reviewing via MCP

List actors/settings inspected → compare to metrics → prioritized feedback with concrete fixes.
