---
name: cgs-tech-debt
description: Use to scan, add, prioritize, or report Codex Game Studios technical debt by categorizing debt indicators, maintaining `docs/tech-debt-register.md`, scoring priority, and recommending repayment scheduling. This is the Codex-native replacement for the original Claude Code `/tech-debt` workflow.
metadata:
  short-description: Track technical debt
---

# Codex Game Studios Tech Debt

This skill tracks conscious technical debt decisions and helps schedule
repayment.

## Modes

- `scan`: scan the codebase for debt indicators.
- `add`: add a manual debt entry.
- `prioritize`: re-score and re-order the debt register.
- `report`: summarize the current debt state.

If no mode is provided, show usage and ask which mode to run.

## Inputs To Read

- Existing `docs/tech-debt-register.md`, if present.
- Source, tests, docs, config, and build files relevant to the chosen mode.
- Sprint plans and retrospectives for age/trend context.
- Original source workflow, only if more detail is needed:
  `.claude/skills/tech-debt/SKILL.md`.

## Scan Mode

Search for:

- `TODO`, `FIXME`, `HACK`, and `@deprecated`.
- large files or likely god objects.
- long functions.
- duplicated patterns.
- missing tests around risky code.
- outdated docs or undocumented public APIs.
- deprecated or risky dependencies.
- known slow paths.

Categorize:

- Architecture Debt.
- Code Quality Debt.
- Test Debt.
- Documentation Debt.
- Dependency Debt.
- Performance Debt.

Treat `FIXME` as likely bug debt and recommend bug reports for severe cases.

## Add Mode

Collect or infer:

- description.
- category.
- affected files.
- accepted reason.
- estimated fix effort: S/M/L/XL.
- impact if left unfixed.
- suggested sprint or backlog.

Every entry must explain why the debt is acceptable for now.

## Prioritize Mode

Read the register and score each item by:

`(impact_if_unfixed * frequency_of_encounter) / fix_effort`

Use the score as a recommendation, not an automatic mandate. Flag items older
than three sprints for explicit fix or accepted-risk review.

## Report Mode

Generate read-only summary:

- total items by category.
- total estimated fix effort.
- added vs resolved since last report when known.
- trend: growing, stable, or shrinking.
- aged items older than three sprints.
- recommended next sprint candidates.

## Write Output

For `scan`, `add`, and `prioritize`, present the proposed register changes
first. After approval or explicit write request, create or update
`docs/tech-debt-register.md`.

For `report`, do not write unless explicitly requested.

## Register Format

Use:

| ID | Category | Description | Files | Effort | Impact | Priority | Added | Sprint |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |

## Completion

Finish with:

- mode result.
- register path if written.
- highest priority debt.
- aged debt requiring a decision.
- next recommended Codex request: sprint plan, bug report, perf profile, or
  architecture decision.
