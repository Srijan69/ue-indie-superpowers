---
name: ue-executing-plans
description: Use when you have a written implementation plan to carry out in an Unreal Engine project through MCP, in batches with checkpoints and verification.
---

# Executing UE Plans

Load the plan, review it critically, execute in small batches, verify each, and stop when blocked.

## Process

1. **Load and review the plan.** Look for gaps, wrong assumptions, or conflicts with the current project state (re-inspect via `ue-mcp-workflow`). Raise concerns before starting.
2. **Create a task list** from the plan and track progress.
3. **Execute a batch** (default: 3 tasks). For each task: do exactly what it says, compile, check the log, run its verification step.
4. **Report after each batch:** what was done, how it was verified, anything unverified, any deviations and why.
5. **Wait for feedback** (playtest results, approval). Apply changes, then the next batch.
6. **Finish:** run `ue-verification-and-playtesting`, clean up `/Game/Sandbox` and temp debug code, produce the change log, propose the next step.

## Stop and ask when

- A dependency is missing or the plan conflicts with the project.
- A verification keeps failing (after two honest attempts, switch to `blueprint-debugging`).
- An instruction is unclear, or a destructive action would be needed.
- You catch yourself guessing.

Don't force through blockers. Asking is cheaper than rebuilding.

## Rules

- Follow plan steps exactly; if you deviate, say so.
- Don't add unplanned features ("while I'm here..."); list ideas as follow-ups.
- Don't skip verification steps.
- Don't work in the user's main level or finished Blueprints without agreement.
