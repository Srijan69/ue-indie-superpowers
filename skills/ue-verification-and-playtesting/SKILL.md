---
name: ue-verification-and-playtesting
description: Use before claiming any work is complete, fixed, working, or ready, and when planning or running playtests. Requires fresh evidence (compile, log, PIE, performance) before success claims.
---

# Verification and Playtesting

Claiming something works without checking it is a lie to the user.

## Iron law

**No completion claim without fresh evidence from this session.**

## Gate (before saying "done", "fixed", "works")

1. Identify what proves the claim.
2. Run it now: compile, read the log, run PIE, check the number.
3. Read the actual result.
4. Only then state the claim, with the evidence.

If you cannot run it (no PIE access via MCP), say **"unverified"** and hand the user exact manual steps. Never write "should work" or "looks right".

## Evidence types

| Claim | Evidence |
|---|---|
| Blueprint is correct | Compiles with 0 errors, 0 new warnings |
| Feature works | PIE run, steps and observed result |
| Bug fixed | Original repro steps now pass + regression check |
| No log problems | Output Log read after the test run |
| Performance OK | `stat unit` / profiler numbers vs the budget |
| Build OK | Packaged build launched and tested |
| Save/load OK | Save, quit, reload, compare state |

## Test matrix (cover what applies)

Happy path · edge cases (zero, max, rapid repeat, simultaneous inputs) · fail and retry · pause/resume · restart level · controller and keyboard · low frame rate · first-time player.

## Running a playtest

- **Script it:** 2 to 3 tasks, no hints, observe silently.
- **Watch, don't ask:** where do they hesitate, get lost, die, get bored, or misread something?
- **Measure:** time to complete, deaths per area, where they quit.
- **Ask afterwards:** "What was the goal? What was confusing? What was your favourite moment?"
- **Triage:** blocker / important / nice-to-have; fix the cause of confusion, not just the symptom.

## Report format

```
Tested: <what, how>
Result: pass / fail (details)
Unverified: <list>
Next: <recommended step>
```

## Red flags

"Should work now" · "It compiled, so it's fine" · "I tested the logic mentally" · reporting success before looking at the log.
