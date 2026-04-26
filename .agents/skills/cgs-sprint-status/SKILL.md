---
name: cgs-sprint-status
description: Use to produce a fast read-only Codex Game Studios sprint progress snapshot from sprint plans, sprint-status.yaml, story files, dates, blockers, stale work, and burndown risk. This is the Codex-native replacement for the original Claude Code `/sprint-status` workflow.
metadata:
  short-description: Check sprint status
---

# Codex Game Studios Sprint Status

This skill is read-only. It provides situational awareness, not sprint
replanning. It should stay concise and make at most one concrete recommendation.

## Scope

- Blank: use `production/sprint-status.yaml` if present, otherwise the latest
  `production/sprints/*.md`.
- Sprint number/name: find matching sprint markdown or status record.

If no sprint files exist, report that no sprint is active and recommend
`cgs-sprint-plan`.

## Inputs To Read

- `production/sprint-status.yaml`, if present. Treat as authoritative.
- Matching or latest `production/sprints/*.md`.
- Referenced story files under `production/epics/`.
- Source paths only as lightweight implementation-evidence hints.
- Original source workflow, only if more detail is needed:
  `.claude/skills/sprint-status/SKILL.md`.

## Checks

- Sprint goal, start date, end date, owners, priorities, estimates.
- Story/task status: DONE, COMPLETE, IN PROGRESS, BLOCKED, NOT STARTED, MISSING.
- Days elapsed, days remaining, and percent time consumed when dates exist.
- Completion percent.
- Must-have stories at risk.
- Missing story files.
- IN PROGRESS staleness from `Last Updated`, `Updated`, `updated`, or similar
  fields. More than 2 days stale upgrades burndown risk to at least `At Risk`.

## Burndown Verdict

- `On Track`: completion is within 10 points of time consumed, or ahead.
- `At Risk`: completion is 10-25 points behind, or stale in-progress work exists.
- `Behind`: completion is more than 25 points behind.
- `Unknown`: dates are unavailable.

## Output

Keep the response short:

- Sprint header and goal.
- Days remaining.
- Progress count and percentage.
- Compact story/status table.
- Attention needed section only if relevant.
- Burndown verdict.
- Must-haves at risk.
- Emerging risks.
- One recommendation.

Do not write files, update story status, or propose scope cuts. Use
`cgs-sprint-plan` for replanning.
