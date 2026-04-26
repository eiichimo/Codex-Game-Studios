---
name: cgs-test-flakiness
description: Use to detect, classify, and report flaky tests in Codex Game Studios from CI logs, test history, or the regression registry without deleting tests. This is the Codex-native replacement for the original Claude Code `/test-flakiness` workflow.
metadata:
  short-description: Detect flaky tests
---

# Codex Game Studios Test Flakiness

This skill finds tests with inconsistent outcomes and recommends quarantine,
fix, or monitoring actions. It must never delete tests.

## Modes

- `[ci-log-path]`: parse one CI or local test log.
- `scan`: inspect available test result files and recent logs.
- `registry`: inspect `tests/regression-suite.md` and related QA notes.

If no mode is provided, start with `scan` using local artifacts only.

## Inputs To Read

- User-provided CI log path.
- `test-results/`, `coverage/`, `production/qa/`, and recent test logs if
  present.
- `tests/regression-suite.md`.
- Existing test files for named failures.
- Original source workflow, only if more detail is needed:
  `.claude/skills/test-flakiness/SKILL.md`.

## Detection

Look for:

- Same test name with both pass and fail outcomes.
- Retry success after initial failure.
- Timeout or order-dependent failures.
- Random seed, clock, async, scene-load, resource, network, or external-state
  clues.
- Floating-point threshold failures or performance budget variance.

Classify likely cause as one of:

- Timing/async race.
- Order dependency.
- Random seed or nondeterministic data.
- Resource leak or shared state.
- External service or file-system dependency.
- Floating-point tolerance.
- Scene or asset load race.
- Unknown, needs reproduction.

## Recommendations

For each flaky candidate, recommend:

- `FIX`: clear root cause and safe fix path.
- `QUARANTINE`: high noise or blocking CI, with owner and exit criteria.
- `MONITOR`: weak evidence or low impact.

Quarantine is a temporary risk-control action, not a replacement for fixing the
test.

## Write Output

Default output is a report in the response. Ask before editing:

- `tests/regression-suite.md` quarantine or notes section.
- `production/qa/flakiness-report-[date].md`.

Never remove or skip a test without explicit user approval and a documented
reason.

## Completion

Finish with:

- Flaky tests found.
- Evidence source.
- Likely cause.
- Recommended action and owner placeholder.
- Follow-up command or Codex request to fix the highest-priority flaky test.
