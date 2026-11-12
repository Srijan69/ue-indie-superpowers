---
name: game-feel-and-juice
description: Use when controls, camera, combat, movement, or interactions feel bad, floaty, unresponsive, flat, or unsatisfying, or when adding feedback, polish, hit effects, screen shake, sound, particles, or animation timing to a mechanic.
---

# Game Feel and Juice

Feel is the player's experience of response. Fix responsiveness first, then add feedback.

## Order of work

1. **Responsiveness:** input latency, acceleration/deceleration, turn rate, jump arc, camera lag. If the base feels bad, juice won't save it.
2. **Readability:** can the player see what happened and why?
3. **Feedback layers:** animation → camera → VFX → audio → UI → time (hit stop).
4. **Variation** (pitch/size/rotation randomness) so repetition doesn't feel mechanical.
5. **Accessibility options** for shake, flashes, motion.

## Feedback layers for any action

| Layer | Examples |
|---|---|
| Anticipation | Windup pose, telegraph, charge sound |
| Action | Fast, clear animation; strong silhouette |
| Impact | Hit stop, camera shake, flash, particles, hit sound with layering |
| Reaction | Target flinch/knockback, damage numbers, health bar response |
| Recovery | Settle animation, camera ease-out, UI update |

## Starting values (tune in playtests, these are only starting points)

Coyote time ~0.08 to 0.12 s · input buffer ~0.10 to 0.15 s · hit stop ~0.03 to 0.08 s (heavier hits longer) · camera shake: short, small, decaying · FOV kick on sprint: a few degrees · screen flash: brief and low intensity · UI feedback: under 0.2 s.

## Techniques in UE

Camera shake assets, Timelines/curves for easing, Time Dilation for hit stop (briefly, on the target or globally), Niagara bursts exposed with parameters, Anim Notifies for synced sound/VFX, MetaSounds or Sound Cues with randomization, Camera Modifiers/spring arm lag, Force Feedback for controllers.

## Rules

- Expose feel values as tuning knobs; test by changing numbers live in PIE.
- **Juice serves clarity.** If effects hide gameplay, cut them.
- Every important action gets sound.
- Test with both keyboard and controller.
- Don't add feedback to a mechanic nobody has proven fun.
