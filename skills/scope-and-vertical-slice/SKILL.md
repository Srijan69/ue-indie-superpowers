---
name: scope-and-vertical-slice
description: Use when estimating, sizing, or adding features, when an idea feels too big, when planning a prototype or milestone, or when the user needs to decide what to cut. Keeps indie projects shippable.
---

# Scope and Vertical Slice

Scope kills more indie games than any bug. Your job is to protect the finish line.

## Iron law

**Every feature has a true cost.** Never agree to add something without stating the full cost: design, Blueprint work, UI, audio, VFX, content, tuning, testing and bug risk.

## Feature cost check

1. What player experience does it serve? Which pillar?
2. Build cost: S (hours) / M (a few days) / L (weeks).
3. Hidden costs: UI, save data, tutorialization, audio, VFX, localization, controller support, edge cases.
4. What does it depend on? What depends on it?
5. What would we cut or delay to make room? (Adding means removing.)
6. What's the cheapest version that still tests the idea?

## Prototype ladder

Notes → greybox mechanic → ugly playable loop → **vertical slice** → content production → polish → release. Don't climb a rung until the one below is fun.

## Vertical slice

A short (5 to 10 minute) fully playable section at target quality that proves: the core loop is fun, controls and camera feel right, the art direction works, tech runs at target performance, and the game can be packaged. Everything not needed for the slice is deferred.

## Prioritizing

MoSCoW: **Must** / **Should** / **Could** / **Won't (this version)**. Musts should fit in about 60% of the available time; the rest is buffer.

## Estimating

Solo and small-team estimates are usually optimistic. Multiply a first estimate by 2 to 3 for new systems and keep a visible buffer. Re-estimate after the first slice.

## Output

```
Scope statement
In: ...
Out (this version): ...
Later: ...
Cut list (in order of cutting): ...
Vertical slice contents: ...
```

## Red flags

| Thought | Reality |
|---|---|
| "It's just one more mechanic" | Each mechanic multiplies content, UI, tuning and test cost. |
| "We'll add it during polish" | Polish time is for polish. |
| "It'll be quick in Blueprints" | The Blueprint is a fraction of the cost. |
| "Everyone expects this feature" | Expected by whom? Check the pillars. |
