---
name: ue-data-and-save-systems
description: Use when designing item, enemy, ability, or balance data, inventory or progression systems, save and load, settings, checkpoints, or any data-driven design in Unreal Engine Blueprints.
---

# Data and Save Systems

Put numbers and content in data, not in graphs. Decide what persists before you build.

## Choosing the data container

| Need | Use |
|---|---|
| A unique thing with several fields and assets (an item, enemy, ability, level config) | Data Asset (Primary Data Asset if you need Asset Manager/async loading) |
| Many rows of the same shape (balance sheets, loot tables, dialogue lines), spreadsheet/CSV import | Data Table (with a Struct row type) |
| A small fixed group of fields | Struct |
| A fixed set of choices | Enum |
| Open-ended labels (states, damage types, interactions) | Gameplay Tags |
| Global tunables | Data Asset of settings (or Developer Settings) |

Reference big assets through **soft references** and load asynchronously. Validate data (missing icon, zero health) in editor with Data Validation or a checker.

## Save game design

1. **List what persists** (progress, inventory, unlocked content, settings, checkpoint, world state). Persist the minimum; derive the rest.
2. Use a **SaveGame object** with a **save version number** from day one; write migration for old versions.
3. Store IDs (tags, asset names, GUIDs), not object references.
4. Separate **settings** (graphics, audio, controls) from **progress**; use multiple slots if needed.
5. Save at safe moments (checkpoints, menus), and async or lightweight enough to avoid hitches; consider autosave plus manual save.
6. Create clear Save/Load functions in one owner (GameInstance or a Subsystem); other systems provide/consume data via an interface (`BPI_Saveable`).
7. Handle missing/corrupt saves gracefully with a clear UI message and a new-game fallback.

## Test checklist

New game · save → quit → load → state identical · load in a different level · old save version · delete save · low disk or write failure · loading during gameplay.

## Balance data

Keep numbers in tables with a column for notes. Use curves (Curve Float/Curve Table) for scaling. Log or chart outcomes while playtesting to tune, not guess.
