---
name: cgs-team-qa
description: Use to coordinate a Codex Game Studios QA cycle for a sprint or feature, including strategy, smoke gate, test plan, manual QA package, bug routing, and sign-off. This is the Codex-native replacement for the original Claude Code `/team-qa` workflow.
metadata:
  short-description: Coordinate a QA cycle
---

# Codex Game Studios Team QA

This skill coordinates QA strategy and sign-off. Codex may prepare plans,
cases, reports, and bug records, but human-run manual QA must be reported as
evidence; do not claim it was executed unless evidence is provided.

Do not spawn subagents unless the user explicitly asks for delegation or
parallel agent work.

## Scope

- `sprint`: current sprint from `production/sprint-status.yaml`.
- `feature: [system-name]`: stories and tests for one system.
- Explicit sprint or story paths.

If scope is missing, infer from session/sprint state only when unambiguous;
otherwise ask.

## Inputs To Read

- `production/session-state/active.md`, if present.
- `production/sprint-status.yaml` and `production/sprints/*.md`.
- In-scope `production/epics/**/*.md` stories.
- Relevant GDD acceptance criteria.
- Existing QA plans, smoke reports, bugs, and test evidence.
- `tests/smoke/`, `tests/`, and `tests/regression-suite.md`.
- Original source workflow, only if more detail is needed:
  `.claude/skills/team-qa/SKILL.md`.

## Pipeline

1. Load context: identify scope, story count, stage, current build/test status.
2. QA strategy: classify each story as Logic, Integration, Visual/Feel, UI, or
   Config/Data. Identify automated and manual evidence requirements.
3. Smoke gate: produce `PASS`, `PASS WITH WARNINGS`, or `FAIL`. If smoke fails,
   stop and report blockers.
4. Test plan: create a plan covering scope, story table, automation needs,
   manual QA scope, entry criteria, exit criteria, and out-of-scope areas. Ask
   before writing `production/qa/qa-plan-[scope]-[date].md`.
5. Test cases: draft manual cases with preconditions, steps, expected result,
   actual result field, and pass/fail field.
6. Bug routing: when failure evidence is provided, create or update bug reports
   under `production/qa/bugs/` after approval.
7. Sign-off: create `APPROVED`, `APPROVED WITH CONDITIONS`, or `NOT APPROVED`
   verdict. Ask before writing `production/qa/qa-signoff-[scope]-[date].md`.

## Verdict Rules

- `APPROVED`: all in-scope stories have adequate evidence and no open S1/S2
  bugs.
- `APPROVED WITH CONDITIONS`: only S3/S4 issues remain or notes are documented.
- `NOT APPROVED`: any S1/S2 bug remains, key evidence is missing, or stories
  fail without workaround.

## Completion

Finish with:

- Scope and story count.
- Smoke gate result.
- Manual and automated evidence status.
- Bugs filed or required.
- Final QA verdict.
- Next request: gate check, bug triage, evidence review, or targeted QA rerun.
