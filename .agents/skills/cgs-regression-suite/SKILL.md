---
name: cgs-regression-suite
description: Use to audit or update the Codex Game Studios regression suite by mapping GDD critical paths and fixed bugs to existing tests, identifying missing regression coverage, and maintaining `tests/regression-suite.md`. This is the Codex-native replacement for the original Claude Code `/regression-suite` workflow.
metadata:
  short-description: Maintain regression coverage
---

# Codex Game Studios Regression Suite

This skill maintains `tests/regression-suite.md`, a curated index of tests that
must always pass to protect critical paths and fixed bugs.

## Modes

- `update`: check current sprint/fixed bugs and add new regression entries.
- `audit`: full GDD critical-path coverage audit.
- `report`: read-only status report.

## Inputs To Read

- `tests/regression-suite.md`, if present.
- Test inventory under `tests/unit/`, `tests/integration/`, and
  `tests/regression/`.
- `design/gdd/systems-index.md` and MVP system GDDs for audit mode.
- Current sprint plan and stories for update mode.
- Closed/fixed bug files under `production/qa/bugs/`.
- Original source workflow, only if more detail is needed:
  `.claude/skills/regression-suite/SKILL.md`.

## Checks

- Map GDD acceptance criteria, formulas, and edge cases to test files.
- Map closed bugs to tests that would catch the original failure.
- Detect coverage drift from completed stories without tests.
- Flag stale or quarantined tests.

Coverage statuses:

- Covered.
- Partial.
- Missing.
- Exempt for visual/UI/manual-only criteria.

## Write Output

For `report`, do not write.

For `update`, append new entries and gaps; do not remove existing tests without
explicit approval.

For `audit`, ask before rewriting the manifest.

Manifest sections:

- How to run.
- Registered Regression Tests.
- Known Gaps.
- Quarantined Tests.
- Coverage summary.

## Completion

Finish with:

- Coverage rate.
- Bug fixes without regression tests.
- High-priority missing tests.
- Manifest path if written.
