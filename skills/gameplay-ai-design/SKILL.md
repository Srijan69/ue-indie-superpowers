---
name: gameplay-ai-design
description: Use when designing, building, or debugging enemy AI, NPCs, companions, or any autonomous behaviour in Unreal Engine, including Behavior Trees, StateTree, Blackboards, EQS, perception, navigation, and difficulty tuning.
---

# Gameplay AI Design

Game AI exists to create fun, readable challenges, not to be smart.

## Process

1. **Role:** what does this enemy make the player do? (flank, dodge, prioritize, use cover?)
2. **Behaviours:** idle → notice → chase/approach → attack → recover → flee/reposition. Write them in the enemy spec (`game-design-docs`).
3. **Pick the simplest tool:**
   - Simple loop or 3 to 5 states → Blueprint state machine or enum + timers.
   - Classic reactive AI with priorities and services → Behavior Tree + Blackboard (+ EQS for positioning).
   - Clear state-based logic with transitions → StateTree (check engine version/plugin availability).
4. **Perception:** AI Perception (sight/hearing/damage) with sensible ranges and delays; add reaction time.
5. **Navigation:** NavMesh coverage, nav modifiers, jump/link proxies where needed.
6. **Tune for fairness**, then variety.

## Design rules

- **Telegraph attacks:** windup long enough to read; a visible cue plus audio.
- **Limit aggression:** attack tokens or a manager so only 1 to 3 enemies attack at once.
- **Give counterplay:** every attack can be avoided, blocked or punished.
- **Recoverable mistakes:** brief recovery windows after attacks; no instant unavoidable damage.
- **Predictable first, surprising later:** introduce simple behaviour, then twist it.
- **Don't cheat invisibly** in ways that feel unfair (aim, perfect tracking).
- **Debuggable:** Blackboard values, debug draw, `showdebug AI`, Visual Logger, logging state changes.

## Common AI bugs

No NavMesh or wrong agent size · AI Controller class not assigned/Auto Possess AI wrong · Blackboard key never set or wrong type · Behavior Tree not running · perception not registering the player (stimuli source missing) · Move To aborted by task priority · character movement mode not Walking · animation not driven by velocity.

## Difficulty

Tune with data: reaction time, damage, health, attack frequency, aggression slots. Keep the numbers in a Data Asset per enemy type.
