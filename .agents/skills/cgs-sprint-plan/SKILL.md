---
name: cgs-sprint-plan
description: Use to create, update, or summarize a Codex Game Studios sprint plan from epics, stories, milestones, capacity, carryover, and risks. This is the Codex-native replacement for the original Claude Code `/sprint-plan` workflow.
metadata:
  short-description: Plan or update a sprint
---

# Codex Game Studios Sprint Plan

This skill creates or updates `production/sprints/sprint-[N].md` and optionally
`production/sprint-status.yaml`.

## Modes

- `new`: create the next sprint.
- `update`: update the current sprint while preserving story status.
- `status`: produce a read-only sprint status summary.

## Inputs To Read

- `production/milestones/`, if present.
- Existing `production/sprints/`.
- `production/sprint-status.yaml`, if present.
- `production/epics/**/*.md`.
- Story readiness results, if available in docs or session state.
- `production/risk-register/`, if present.
- QA plan files under `production/qa/`, if present.
- Original source workflow, only if more detail is needed:
  `.claude/skills/sprint-plan/SKILL.md`.

## Build A Sprint

For a new sprint:

- Determine sprint number and dates.
- Define one sprint goal.
- Estimate capacity and reserve 20% buffer.
- Select stories by priority and dependency readiness.
- Separate Must Have, Should Have, and Nice to Have.
- Carry over unfinished prior sprint work with reason.
- List risks, mitigations, and external dependencies.
- Include a sprint Definition of Done.

Do not overfill capacity. If estimates exceed available capacity, recommend
de-scoping before writing.

## Sprint Status YAML

When writing a sprint plan, also offer to write
`production/sprint-status.yaml`.

Use statuses:

- backlog
- ready-for-dev
- in-progress
- review
- done
- blocked

For updates, preserve existing statuses unless the story was removed or the user
explicitly changes it.

## QA Plan Gate

Check whether a sprint QA plan exists. If missing, warn that implementation can
start but Production to Polish readiness will be blocked until QA planning and
signoff exist.

## Output

For `new` or `update`, present the draft before writing:

- Sprint goal.
- Capacity.
- Must Have stories.
- Should Have stories.
- Nice to Have stories.
- Carryover.
- Risks.
- QA plan status.

After approval, write files.

For `status`, do not write. Report:

- Completed.
- In progress.
- Blocked.
- Not started.
- Burndown assessment.
- Emerging risks.

## Completion

Finish with:

- Sprint file path if written.
- Sprint status YAML path if written.
- QA plan status.
- First ready story recommendation.
