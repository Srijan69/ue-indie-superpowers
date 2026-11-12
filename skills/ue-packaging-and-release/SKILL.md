---
name: ue-packaging-and-release
description: Use when packaging, cooking, building, or releasing an Unreal Engine game or demo, including project settings, Steam setup, versioning, packaged-build bugs, crash logs, and release checklists.
---

# UE Packaging and Release

Package early and often. A build that works only in the editor is not a game.

## First package (do this during the prototype or slice)

1. **Project Settings → Project → Maps & Modes:** set Default Maps and the Game Instance/Game Mode.
2. **Packaging settings:** build configuration (Development while testing, Shipping for release); "List of maps to include"; staging; compression; cook everything vs only referenced content.
3. Ensure **soft-referenced assets and extra folders** are cooked (Additional Asset Directories to Cook / Primary Asset rules).
4. Confirm required **plugins** are enabled and supported on the target platform.
5. Package a **Development** build; launch it on a clean machine/user.

## Test the packaged build

Menus, start game, input (keyboard and controller), save/load, level transitions, audio, UI scaling at different resolutions, quit and relaunch, performance, and logs for errors.

## Common packaged-only failures

Missing assets (not cooked: soft refs, maps not listed) · plugin or editor-only node used · wrong default map · input not working (mapping context added in editor-only path) · shader compile stutter (PSO caching) · file path assumptions · save game path issues · debug features accidentally left on.

## Before release

- **Shipping build** tested (not just Development).
- Version number, build number, and a changelog.
- Crash reporting/log collection plan; know where logs live.
- Settings menu: graphics, audio, controls, language/subtitles.
- Store assets: capsule art, screenshots, trailer, short and long descriptions, tags.
- Steam: Steamworks account and App ID, Steam Online Subsystem/SDK setup as the version requires, depots and build upload, achievements/cloud saves if used. Check current Steamworks docs.
- Demo/playtest branch if useful; collect feedback.
- Release checklist reviewed with the user: legal (licenses, asset rights), age ratings, privacy.

## Output

```
Build: <config> <version>
Packaged OK: yes/no
Tested: <list>
Known issues: ...
Release blockers: ...
```
