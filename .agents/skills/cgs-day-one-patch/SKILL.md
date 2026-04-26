---
name: cgs-day-one-patch
description: Use to plan and gate a Codex Game Studios day-one patch after gold master or near launch, including scope discipline, rollback planning, focused fixes, targeted QA, patch record, and communication follow-up. This is the Codex-native replacement for the original Claude Code `/day-one-patch` workflow.
metadata:
  short-description: Plan a day-one patch
---

# Codex Game Studios Day-One Patch

This skill treats a day-one patch as a constrained mini-sprint. It is not a
feature sprint and not a broad refactor pass.

Do not spawn subagents unless the user explicitly asks for delegation or
parallel agent work. Do not tag, deploy, publish, or merge without explicit
approval.

## Modes

- `known-bugs`: scope from open bugs.
- `cert-feedback`: scope from platform/cert feedback.
- `all`: inspect all available launch patch inputs.

If omitted, use `all`.

## Inputs To Read

- `production/stage.txt`.
- Latest release gate report in `production/gate-checks/`.
- `production/qa/bugs/*.md` with open or pending verification status.
- Latest sprint/milestone/release docs.
- Latest security audit under `production/security/`, if present.
- Build/release tags or release candidate notes.
- Original source workflow, only if more detail is needed:
  `.claude/skills/day-one-patch/SKILL.md`.

## Scope Rules

Include only fixes that are safe and necessary:

- S1/S2 or P1/P2 bugs if the fix is low risk.
- Cert-required fixes.
- Data/config-only fixes.
- Fixes estimated under 4 hours.

Defer:

- New features.
- Refactors.
- Architecture changes.
- Risky new code paths.
- Fixes better suited for patch 1.1.

If total effort exceeds one day, recommend reducing scope.

## Pipeline

1. Load release context and confirm the project is in Polish or Release.
2. Classify open bugs and cert feedback into included and deferred items.
3. Present scope for approval. If no patch is needed, recommend launch checklist.
4. Define rollback plan before implementation work.
5. For approved fixes, keep implementation minimal and targeted.
6. Run targeted smoke or broader regression based on touched systems.
7. Generate a patch record after approval:
   `production/releases/day-one-patch-[version].md`.
8. Recommend player-facing patch notes and post-launch verification.

## Rollback Plan

Before fixes ship, document:

- Base/gold master build.
- Platform rollback constraints.
- Rollback owner.
- Trigger conditions.
- Player communication if rollback occurs.

Suggested path:

```text
production/releases/rollback-plan-[version].md
```

## Completion

Finish with:

- Included and deferred bugs.
- Scope risk and estimated effort.
- Rollback plan status.
- QA gate verdict.
- Patch record path, if written.
- Remaining launch risks.
- Recommended next request: patch notes, bug verification, launch checklist, or
  retrospective.
