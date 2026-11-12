---
name: ue-project-hygiene
description: Use when setting up a new Unreal Engine project, naming or organizing assets, setting up folders, source control, cleaning up a messy project, fixing redirectors, migrating assets, or enforcing conventions.
---

# UE Project Hygiene

A tidy project is faster to build, easier to debug and safe to share.

## Naming (use the project's existing convention first)

`BP_` Blueprint · `BPI_` interface · `BPC_` component · `WBP_` widget · `ABP_` anim BP · `AM_` montage · `BS_` blend space · `BT_`/`BB_` behaviour tree/blackboard · `ST_` StateTree · `DA_` data asset · `DT_` data table · `E_` enum · `S_` struct · `IA_` input action · `IMC_` mapping context · `M_`/`MI_` material/instance · `MF_` material function · `T_` texture (suffix `_D` `_N` `_ORM`) · `SM_`/`SK_` static/skeletal mesh · `NS_` Niagara system · `MS_` MetaSound · `SC_` sound cue · `L_` level.

Variables: PascalCase, booleans start with `b`. Functions: verbs (`ApplyDamage`).

## Folders (feature-based)

```
/Game/<Project>/Core          framework classes
/Game/<Project>/Characters
/Game/<Project>/Weapons
/Game/<Project>/Enemies
/Game/<Project>/UI
/Game/<Project>/Levels
/Game/<Project>/Audio
/Game/<Project>/VFX
/Game/<Project>/Data
/Game/<Project>/Materials
/Game/Sandbox                 throwaway tests, never referenced by real content
/Game/ThirdParty              marketplace/vendor content, kept untouched
```

Keep marketplace content separate; don't edit it in place (copy to your own folder).

## Source control

- Git + Git LFS (or Perforce/Plastic) for binary `.uasset`/`.umap`.
- `.gitignore`: `Binaries/`, `Intermediate/`, `Saved/`, `DerivedDataCache/`, `.vs/`, `*.sln` (as appropriate).
- Commit small and often, with clear messages; branch for risky changes; commit before large MCP-driven changes.
- Enable One File Per Actor for World Partition levels to reduce merge conflicts.
- Binary assets don't merge: coordinate who edits which map/Blueprint.

## Cleanup routine

1. Fix Up Redirectors in folder after moves/renames (move/rename in the Editor, not the file system).
2. Reference Viewer and Size Map to find unused or heavy assets.
3. Delete `/Sandbox` leftovers and unused test actors from levels.
4. Disable unused plugins; keep a note of required plugins.
5. Check Project Settings: default maps, game instance, collision presets, input config.
6. Remove debug Print Strings and unused variables; compile all Blueprints and fix warnings.

## Rules

Don't rename or delete without checking references. Don't move assets via the OS file explorer. Don't leave "Copy of", "New", "Test2" names.
