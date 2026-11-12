---
name: ue-ui-umg-workflow
description: Use when building or fixing HUDs, menus, inventories, dialogue boxes, pause screens, or any UMG widget in Unreal Engine, including controller navigation, scaling, input modes, and widget architecture.
---

# UE UI / UMG Workflow

UI is the player's interface to the game's rules. Keep it clear, responsive and decoupled from gameplay logic.

## Architecture

- **Presentation only.** Widgets display state and send player intents; gameplay logic stays in components/controllers.
- **Event-driven, not polled.** Bind to Event Dispatchers (`OnHealthChanged`) instead of property bindings that run every frame.
- **One owner.** The PlayerController creates and owns widgets; add to viewport once, show/hide via visibility.
- **Reusable widgets:** build small pieces (`WBP_Button`, `WBP_BarWithLabel`, `WBP_ItemSlot`) and compose screens from them.
- **Widget stack for menus** (or Common UI if available) so back/escape behave consistently.

## Checklist for any screen

1. Layout: anchors, scale box/DPI scaling, safe zones, tested at 16:9, 16:10, ultrawide, and a small resolution.
2. **Input:** keyboard + mouse and controller; set a default focus widget; navigation order; correct Input Mode (Game / UI / Game and UI) and mouse cursor visibility; restore on close.
3. **States:** normal, hover, pressed, disabled, focused; empty, loading, error.
4. **Feedback:** sound and animation on interactions, under about 0.2 s.
5. **Text:** use Text (not String) for localization-ready content; leave room for longer languages; readable sizes.
6. **Pause:** pausing sets game paused and handles input mode; unpausing restores it.
7. **Accessibility:** UI scale option, colour-blind-safe cues (not colour alone), subtitle size, contrast.

## HUD guidance

Show only what the player needs now. Prioritize: health/threat, objective, resources, context prompts. Use diegetic or minimal elements where the game style allows. Test readability during action, not just at rest.

## Common problems

Widget not on screen (never added, wrong Z-order, Visibility hidden/collapsed) · buttons not clickable (another widget on top, Visibility Hit Test Invisible) · controller can't navigate (no focusable widget, focus not set) · input stuck after closing menu (Input Mode not restored) · scaling broken (wrong anchors, no DPI rule) · memory leak (widgets created repeatedly without removing) · Tick-heavy bindings.
