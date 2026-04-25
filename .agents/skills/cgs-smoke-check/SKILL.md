---
name: cgs-smoke-check
description: Use to run or document a Codex Game Studios smoke check before QA handoff, combining automated test status, core-path manual verification, coverage warnings, platform checks, and a PASS/FAIL report. This is the Codex-native replacement for the original Claude Code `/smoke-check` workflow.
metadata:
  short-description: Run smoke readiness gate
---

# Codex Game Studios Smoke Check

This skill gates "implementation complete" to "ready for QA handoff". A failed
smoke check means the build is not ready for manual QA.

## Modes

- `sprint`: full smoke check for current sprint.
- `quick`: skip broad coverage scan; use for re-checks.
- Platform variants: pc, console, mobile, all.

## Inputs To Read

- `.claude/docs/technical-preferences.md` for engine/platform.
- `tests/` structure and relevant test results.
- Latest `production/qa/qa-plan-*.md`.
- `production/qa/smoke-tests.md` or `tests/smoke/`, if present.
- Latest sprint plan and `production/sprint-status.yaml`.
- Original source workflow, only if more detail is needed:
  `.claude/skills/smoke-check/SKILL.md`.

## Automated Checks

- Detect test framework and CI workflow.
- Run scoped automated tests only when the command is known and safe in the
  current environment.
- If engine binary or runner is unavailable, record `NOT RUN` with reason rather
  than treating it as automatic failure.
- Parse pass/fail counts when available.

## Coverage And Manual Checks

- Compare sprint stories to expected test/evidence files from QA plan.
- Flag Logic/Integration stories missing test files.
- Verify core stability manually:
  - Launches to main menu.
  - New game/session starts.
  - Main menu responds to input.
  - Sprint's primary mechanic works.
  - Previous sprint features show no obvious regressions.
  - Save/load and performance checked when applicable.
- Add platform-specific batches when requested.

## Verdicts

- `PASS`: automated tests pass or are manually confirmed, core checks pass, no
  critical gaps.
- `PASS WITH WARNINGS`: tests not run locally, minor evidence gaps, or advisory
  coverage drift.
- `FAIL`: crash, failed core path, failing automated tests, or critical mechanic
  broken.

## Write Output

After summarizing, ask before writing `production/qa/smoke-[date].md`.

Report:

- Environment.
- Automated test results.
- Coverage gaps.
- Manual smoke responses.
- Platform results.
- Verdict and blockers.

## Completion

Finish with:

- Smoke report path if written.
- QA handoff readiness.
- Required fixes before QA, if any.
