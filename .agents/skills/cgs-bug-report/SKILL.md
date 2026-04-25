---
name: cgs-bug-report
description: Use to create, analyze, verify, or close Codex Game Studios bug reports, including severity, priority, reproduction steps, technical context, evidence, verification status, and closure records. This is the Codex-native replacement for the original Claude Code `/bug-report` workflow.
metadata:
  short-description: File or verify bugs
---

# Codex Game Studios Bug Report

This skill creates structured bug reports and manages verification/closure
without skipping evidence.

## Modes

- `description`: create a report from a user-provided bug description.
- `analyze [path]`: inspect target files and draft potential bug reports.
- `verify [BUG-ID]`: check whether an existing bug fix is actually resolved.
- `close [BUG-ID]`: close a bug only after it is verified fixed.

If no description or mode is provided, ask for the observed problem before
continuing.

## Inputs To Read

- Existing bug files under `production/qa/bugs/`.
- Target source files for analyze mode.
- Related story, GDD, QA, test, and release docs when identifiable.
- Test files for the affected system.
- Git commit/build context when available.
- Original source workflow, only if more detail is needed:
  `.claude/skills/bug-report/SKILL.md`.

## Description Mode

Extract or ask for:

- title/summary.
- severity and priority.
- category and affected system.
- frequency and regression status.
- environment: build, platform, scene/level, game state.
- exact reproduction steps and preconditions.
- expected and actual result.
- logs, screenshots, videos, or notes.

Search the codebase for likely affected files and related systems, but label
possible root causes as hypotheses unless verified.

## Analyze Mode

Review target files for likely bugs:

- null/empty state failures.
- off-by-one and boundary issues.
- race conditions or bad async ordering.
- resource leaks or missing cleanup.
- incorrect state transitions.
- unhandled save/load, input, platform, or network edge cases.

For each credible issue, draft a bug report with trigger scenario, impact, and
recommended fix direction.

## Verify Mode

Read `production/qa/bugs/[BUG-ID].md`.

Check:

- original reproduction path.
- whether the suspected root-cause code path changed.
- related tests and regression coverage.
- adjacent occurrences of the same bug pattern.

Verdicts:

- `VERIFIED FIXED`
- `STILL PRESENT`
- `CANNOT VERIFY`

Ask before updating the bug file unless the user explicitly requested the
update.

## Close Mode

Only close when status is `Verified Fixed` or equivalent evidence is present.
Append a closure record with date, resolution, fix commit/PR if known, verifier,
closer, regression test or manual evidence, and final status.

Do not close unverified bugs. Recommend `verify` first.

## Write Output

For new reports, present the draft first. After approval or explicit write
request, create `production/qa/bugs/` and write
`production/qa/bugs/BUG-[NNNN].md`.

For verify/close, update the existing file only after approval or explicit
request.

## Completion

Finish with:

- bug path if written or updated.
- severity/priority.
- verification or closure status.
- next recommended Codex request: bug triage, hotfix for S1/S2, or regression
  suite update.
