---
name: blueprint-debugging
description: Use when encountering any bug, crash, error, or unexpected behaviour in an Unreal Engine project, including Accessed None, failed casts, input not working, actors not spawning, AI not moving, widgets not showing, or things that work in the editor but not in a build. Use before proposing any fix.
---

# Blueprint Debugging

Random fixes waste time and hide the real problem.

## Iron law

**No fix without a confirmed root cause.**

## Phases

1. **Reproduce.** Find exact, repeatable steps in PIE (and note PIE vs Standalone vs packaged). If you can't reproduce it, gather more data; don't guess.
2. **Gather evidence.** Read the Output Log and Message Log. Use Blueprint breakpoints and watch values, the Blueprint Debugger, temporary Print String, `showdebug`, Visual Logger, debug draw (lines, spheres, traces), `stat` commands. Check recent changes (what changed since it last worked?).
3. **Form one hypothesis:** "X is happening because Y." Write it down.
4. **Test it with the smallest change**, one variable at a time. If wrong, form a new hypothesis; don't stack fixes.
5. **Fix at the root, add a regression check** (a repeatable test step), and **remove debug code**.

If three fixes fail, stop: the architecture or assumption is likely wrong. Discuss it with the user.

## Common UE Blueprint culprits (check these early)

- **Accessed None / invalid reference:** reference never set, destroyed, or set too late; BeginPlay order between actors; spawn not finished.
- **Cast failed:** wrong class, wrong object (Player Controller vs Pawn), or not possessed yet.
- **Wrong class active:** GameMode, Default Pawn, or HUD override missing in World Settings or Project Settings; a level overriding defaults.
- **Input dead:** Mapping Context not added; Enhanced Input plugin/mapping missing; a widget consuming input; Input Mode wrong; priority conflicts; Pawn not possessed.
- **Collision/overlap issues:** collision preset, channels, "Generate Overlap Events" off, object type mismatch.
- **Timing:** timers cleared or re-set, `Delay` in loops or functions, latent actions cancelled when the actor is destroyed, race conditions on BeginPlay.
- **Event dispatcher never fires:** not bound, bound to the wrong instance, or unbound on destroy.
- **Array bugs:** removing while iterating, copy vs reference, index out of range.
- **Construction Script vs runtime:** logic in the wrong phase; editor-only behaviour.
- **AI not moving:** no NavMesh or not covering the area, wrong controller class (Auto Possess AI), blackboard keys unset.
- **Widgets invisible:** not added to viewport, wrong Z-order, hidden visibility, anchors/scale off.
- **Animation:** notifies not firing, wrong slot in the AnimGraph, montage blend settings.
- **Works in PIE, breaks in build:** assets not cooked (soft refs, maps not in the cook list), editor-only nodes, plugin not enabled, packaging settings.
- **Replication (if multiplayer):** running on the wrong machine, variable not replicated, RPC reliability, ownership.

## Output when reporting

```
Symptom: ...
Root cause: ...   (evidence: ...)
Fix: ...
How verified: ...
Regression check: ...
```

## Red flags

"Let me just try this..." · "It's probably X" · adding Delay to fix a timing bug · adding Is Valid everywhere to hide a null · fixing several things at once.
