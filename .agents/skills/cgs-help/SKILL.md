---
name: cgs-help
description: Use when the user asks what to do next in Codex Game Studios, is stuck, wants project-stage guidance, or needs a Codex-native replacement for the original Claude Code `/help` workflow.
metadata:
  short-description: Find the next game-dev workflow step
---

# Codex Game Studios Help

This skill is read-only. It inspects the current project state and tells the
user the next required step in the game-development pipeline.

## Inputs To Read

- `.claude/docs/workflow-catalog.yaml`: authoritative phase and step catalog.
- `production/stage.txt`: explicit current phase, if present.
- `production/session-state/active.md`: current task or handoff context.
- `production/sprint-status.yaml`: production story status, if present.
- Artifact paths referenced by the workflow catalog.
- `.agents/skills/*/SKILL.md` and `.claude/skills/*/SKILL.md` when the user
  asks what workflows are available.

## Determine Current Phase

Use this order:

1. `production/stage.txt` if it exists and has content.
2. Otherwise infer from artifacts, checking most advanced state first:
   - 10+ source files in `src/`: Production
   - `production/stories/*.md` or `production/epics/**/*.md`: Pre-Production
   - `docs/architecture/adr-*.md`: Technical Setup
   - `design/gdd/systems-index.md`: Systems Design
   - `design/gdd/game-concept.md`: Concept
   - Otherwise: Concept

## Check Completion

For each step in the current phase from `workflow-catalog.yaml`:

- If the step has `artifact.glob`, check for matching files.
- If it has `min_count`, verify the minimum count.
- If it has `artifact.pattern`, check the pattern in matching files.
- If it has `artifact.note`, mark it as manual/unknown and ask only if it
  blocks the next recommendation.
- Treat repeatable steps as "started" unless the catalog or project state
  proves all required items are complete.

For Production, prefer `production/sprint-status.yaml` over markdown scanning:

- `in-progress`: current work.
- `ready-for-dev`: next implementable story.
- `blocked`: surface blocker.
- `done`: completed.

## Output Format

Keep output short and decision-oriented:

```text
Where you are: [Phase]

Done:
- [confirmed completed item]

Next required:
[Step] - [why it matters]
Ask Codex to: "[natural-language request]"

Optional now:
- [optional step]

Coming up:
- [next required step]
```

Use original `/command` names only as references, for example:
`original workflow: /design-system`. Prefer natural-language Codex requests as
the actionable instruction.

If the user is confused, add the two escalation paths:

- Full gap audit: ask Codex to detect the project stage and missing artifacts.
- Phase gate: ask Codex to run a gate check for the current phase.

## Constraints

- Do not write files.
- Do not advance phase state.
- Do not run long test suites unless the user explicitly asks for verification.
