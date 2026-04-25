---
name: cgs-retrospective
description: Use to generate or update a Codex Game Studios sprint or milestone retrospective from plans, status, git history, bugs, blockers, velocity, previous action items, and technical debt trends. This is the Codex-native replacement for the original Claude Code `/retrospective` workflow.
metadata:
  short-description: Create a retrospective
---

# Codex Game Studios Retrospective

This skill converts sprint or milestone outcomes into actionable process
improvements for the next iteration.

## Scope

Accept:

- `sprint-N`: sprint retrospective.
- milestone name: milestone retrospective.

If missing, infer from the latest sprint or milestone only when unambiguous;
otherwise ask.

## Existing Retrospective

Before drafting, look for:

- `production/retrospectives/retro-[slug]-*.md`.
- `production/sprints/sprint-[N]-retrospective.md`.
- milestone retrospective files under `production/retrospectives/`.

If one exists, summarize it and ask whether to update it or create a fresh
retrospective. Do not silently overwrite.

## Inputs To Read

- Sprint or milestone plan.
- `production/sprint-status.yaml`, if present.
- Sprint reports, QA plans, bug reports, and playtest reports.
- Previous retrospectives and action items.
- Git history for the covered period, if available.
- TODO/FIXME/HACK counts and previous counts if recorded.
- Original source workflow, only if more detail is needed:
  `.claude/skills/retrospective/SKILL.md`.

If the sprint or milestone source data is missing, ask the user to provide the
period, goals, planned work, and outcomes, or stop as blocked.

## Analyze

Compare plan vs actual:

- completed as planned.
- completed with scope changes.
- carried over.
- added mid-iteration.
- removed or descoped.
- blockers and time lost.
- estimation accuracy and repeated under/over-estimates.
- previous action items completed or ignored.
- technical debt trend.

Focus on system/process causes, not blame.

## Retrospective Output

Generate:

- Metrics table: planned/actual tasks, effort, bugs, unplanned work, commits.
- Velocity Trend.
- What Went Well.
- What Went Poorly.
- Blockers Encountered.
- Estimation Accuracy.
- Carryover Analysis.
- Technical Debt Status.
- Previous Action Items Follow-Up.
- Action Items for Next Iteration.
- Process Improvements.
- Summary.

Limit action items to 3-5, each specific enough to execute.

## Write Output

Present the retrospective and the top findings first. After approval or
explicit write request, write to:

- `production/sprints/sprint-[N]-retrospective.md` for sprint retros.
- `production/retrospectives/retro-[milestone-name]-[date].md` for milestone
  retros.

Create directories as needed.

## Completion

Finish with:

- retrospective path if written.
- completion rate and velocity trend.
- most important blocker.
- action items for the next sprint or phase.
