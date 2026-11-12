---
name: blueprint-architecture
description: Use when designing or restructuring Blueprint classes and systems in Unreal Engine, including deciding where logic lives, how actors communicate, using components, interfaces, dispatchers, Data Assets, Enhanced Input, Gameplay Tags, or choosing between Blueprints and C++.
---

# Blueprint Architecture

Blueprints are production code. Structure them so the project stays understandable at 300 assets, not just 30.

## Where does the logic live?

| Concern | Home |
|---|---|
| Match rules, spawning, win/lose | GameMode (server authority) |
| Shared match state | GameState |
| Input, UI ownership, possession | PlayerController |
| The player's body and abilities | Character / Pawn |
| Per-player persistent stats | PlayerState |
| Cross-level data, save/settings orchestration | GameInstance (or Subsystems) |
| Presentation only | Widgets / HUD (no gameplay logic) |
| Reusable behaviour (health, interaction, inventory) | Actor Components |
| Static data (items, enemies, abilities) | Data Assets / Data Tables |

## Communication patterns

| Need | Use |
|---|---|
| "Can this thing be interacted with / damaged?" | Blueprint Interface (`BPI_`) |
| "Something happened, whoever cares react" | Event Dispatcher |
| Parent → child direct call | Direct reference (cached) |
| Global lookup | Subsystem, not `Get All Actors Of Class` |
| Identify types/states/damage kinds | Gameplay Tags |

Avoid long cast chains and hard references to big assets: they load huge dependency trees. Use soft references and async load for large or optional content.

## Defaults

- **Components over inheritance** for reusable behaviour: `BPC_Health`, `BPC_Interactor`, `BPC_Inventory`.
- **Data-driven:** variety through Data Assets, not copy-pasted Blueprints.
- **Enhanced Input** (Input Action + Mapping Context) for all input; never hard-code keys.
- **Tuning knobs** exposed (Instance Editable / Expose on Spawn, categorized, with defaults).
- **Gameplay Ability System** only if the game truly needs many abilities, buffs, cooldowns and attributes, or multiplayer prediction. For small games a custom component is faster and clearer. State which you recommend and why.
- **Multiplayer** must be decided before building; it changes architecture.

## Blueprint hygiene

Functions for reusable logic, Macros sparingly, Collapsed Graphs and comment boxes for grouping, no wire spaghetti, clear names (`bIsSprinting`, `ApplyDamage`). Prefer Timelines, Timers and events to Tick; if Tick is unavoidable, throttle and disable when idle. Keep Construct Script light. Use `Is Valid` and fail gracefully.

## When to use C++

Only for a measured reason: heavy per-frame math, large-scale simulation, low-level engine access, or Blueprint limits. Move one small piece, keep the rest in Blueprints, expose it as a node.

## Example patterns

**Interaction:** `BPC_Interactor` on the player line-traces/overlaps → finds actor implementing `BPI_Interactable` → calls `Interact(Instigator)`. Interactables decide their own behaviour.

**Health:** `BPC_Health` holds Current/Max, `ApplyDamage`, dispatchers `OnDamaged` and `OnDied`. UI and VFX bind to dispatchers; nobody polls.

## Red flags

| Thought | Reality |
|---|---|
| "I'll cast to the player everywhere" | Use interfaces or dispatchers. |
| "I'll put it on Tick" | Use events/timers. |
| "I'll put game logic in the widget" | Widgets read state and send intents. |
| "I'll copy the Blueprint and tweak it" | Make it data-driven. |
