---
name: cgs-bug-triage
description: Use to triage Codex Game Studios open bugs by severity, priority, sprint assignment, trend, hot spots, regressions, age, and systemic risk, producing a prioritized bug triage report. This is the Codex-native replacement for the original Claude Code `/bug-triage` workflow.
metadata:
  short-description: Triage open bugs
---

# Codex Game Studios Bug Triage

This skill turns the open bug backlog into a prioritized action list. It
separates severity from priority and flags systemic risks.

## Modes

- `sprint`: triage against current sprint scope and capacity.
- `full`: triage all open bugs regardless of sprint scope.
- `trend`: trend analysis only; read-only report with no assignment changes.

If mode is missing, use `sprint` when a current sprint exists; otherwise use
`full`.

## Inputs To Read

- `production/qa/bugs/*.md`.
- `production/qa/bugs.md` as fallback.
- QA plan "Bugs Found" tables as a last resort.
- Latest sprint plan and `production/sprint-status.yaml`, if present.
- Previous bug triage reports.
- Severity/priority guidance from `.claude/docs/coding-standards.md`, if
  present.
- Original source workflow, only if more detail is needed:
  `.claude/skills/bug-triage/SKILL.md`.

If no bug files exist, report that there is nothing to triage and stop.

## Classify Bugs

Severity:

- `S1 Critical`: crash, data loss, complete blocker, severe security issue.
- `S2 High`: major broken feature or significant wrong behavior.
- `S3 Medium`: degraded feature with workaround.
- `S4 Low`: cosmetic, typo, minor polish.

Priority:

- `P1`: fix this sprint; blocks QA/release or is serious regression.
- `P2`: fix soon; needed before next major milestone.
- `P3`: backlog.
- `P4`: deferred or won't-fix candidate.

Priority is a recommendation. Do not mark won't-fix or close bugs without user
approval.

## Assignment And Trend Rules

For sprint mode:

- assign P1/P2 only when sprint scope and capacity allow it.
- flag overflow rather than silently overfilling the sprint.
- identify target story or epic when possible.

Flag systemic issues:

- 3+ bugs in the same system.
- 2+ S1/S2 bugs from the same story.
- bugs against stories marked complete.
- S1/S2 bugs older than two sprints or unassigned.

## Report Output

Generate:

- Triage Summary by priority.
- Critical S1/S2 unfixed count.
- P1 Bugs table.
- P2 Bugs table.
- P3/P4 Bugs table.
- Systemic Issues Flagged.
- Trend Analysis: volume, hot spots, regressions, aged bugs.
- Recommended Actions.

For `trend`, omit assignment changes and focus on metrics and risk patterns.

## Write Output

Present the report first. After approval or explicit write request, create
`production/qa/` and write `production/qa/bug-triage-[date].md`.

Do not edit individual bug files unless explicitly requested.

## Completion

Finish with:

- triage report path if written.
- P1/P2 count.
- unassigned S1/S2 count.
- systemic risks.
- next recommended Codex request: sprint plan, hotfix, smoke check, or
  regression suite update.
