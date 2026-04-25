---
name: cgs-playtest-report
description: Use to create or analyze Codex Game Studios playtest reports, structure raw notes, categorize findings into design, balance, bugs, and polish, and route follow-up work. This is the Codex-native replacement for the original Claude Code `/playtest-report` workflow.
metadata:
  short-description: Structure playtest feedback
---

# Codex Game Studios Playtest Report

This skill standardizes playtest evidence and turns raw observations into
actionable follow-up work.

## Modes And Review

- `new`: create a blank playtest report template.
- `analyze [path]`: turn raw notes into a structured report.

Review modes:

- `solo`: no delegated player-experience review.
- `lean`: default; no director gate.
- `full`: include a creative-director-style assessment, but use Codex
  delegation only if the user explicitly asks for parallel agent work.

Read `production/review-mode.txt` if review mode is not specified.

## Inputs To Read

- Raw playtest notes for analyze mode.
- `design/gdd/game-concept.md` for pillars and core fantasy.
- Relevant GDDs for tested systems.
- QA bug reports and known issues, if relevant.
- Balance docs, if relevant.
- Original source workflow, only if more detail is needed:
  `.claude/skills/playtest-report/SKILL.md`.

## Report Template

Generate or fill:

- Session Info: date, build, duration, tester, platform, input method, session
  type.
- Test Focus.
- First Impressions: goal understanding, controls, emotional response, notes.
- Gameplay Flow: worked well, pain points, confusion, delight.
- Bugs Encountered table.
- Feature-Specific Feedback.
- Quantitative Data if available.
- Overall Assessment.
- Top 3 Priorities.

For analyze mode, label observations that conflict with design intent.

## Action Routing

Categorize findings:

- Design changes needed: fun issues, confusion, mechanics not matching intent.
- Balance adjustments: difficulty, pacing, economy, numbers, spikes.
- Bug reports: reproducible implementation defects.
- Polish items: friction or feel issues that are not immediate blockers.

Route follow-up:

- Design changes: review downstream impact before changing GDDs.
- Balance adjustments: run balance analysis before tuning.
- Bugs: file structured bug reports.
- Polish: add to a polish backlog when appropriate.

## Full Review Mode

For `full`, add a `Player Experience Assessment` section using game pillars,
core fantasy, and the playtest hypothesis. Mark it as Codex-inferred unless the
user explicitly requested delegated review.

## Write Output

Show the report, categorized findings, and top three priorities first. After
approval or explicit write request, create `production/qa/playtests/` and write
`production/qa/playtests/playtest-[date]-[tester].md`.

## Completion

Finish with:

- report path if written.
- top three priorities.
- bug reports that should be filed.
- design/balance/polish follow-up recommendations.
