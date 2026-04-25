---
name: cgs-localize
description: Use to run Codex Game Studios localization workflows including hardcoded string scan, extraction, validation, status, translator briefs, cultural review, VO pipeline, RTL check, string freeze, and localization QA. This is the Codex-native replacement for the original Claude Code `/localize` workflow.
metadata:
  short-description: Manage localization
---

# Codex Game Studios Localize

This skill manages localization from string extraction through QA. It treats
English (`en`) as the source locale unless the project documents otherwise.

## Modes

- `scan`: find hardcoded strings and localization anti-patterns.
- `extract`: generate new string-table entries.
- `validate`: check translations for completeness, placeholders, length, stale
  entries, and encoding risks.
- `status`: localization coverage matrix.
- `brief`: translator context briefing.
- `cultural-review`: cultural and sensitivity risk review.
- `vo-pipeline`: scan, script, validate, or integrate localized VO.
- `rtl-check`: right-to-left layout and font readiness.
- `freeze`: call, check, or lift string freeze.
- `qa`: localization QA plan and verdict.

If no mode is provided, show the modes and ask which to run.

## Inputs To Read

- source and translation tables under `assets/data/strings/`.
- UI/source files under `src/`.
- narrative, lore, and GDD files under `design/`.
- audio under `assets/audio/vo/`, for VO modes.
- localization reports under `production/localization/`.
- `.claude/docs/technical-preferences.md`.
- Original source workflow, only if more detail is needed:
  `.claude/skills/localize/SKILL.md`.

## Core Rules

- every string-table entry needs translator context.
- prefer named placeholders over positional placeholders.
- avoid string concatenation for localized sentences.
- do not modify translation files directly; generate diffs or reports first.
- call string freeze before sending text to translators.
- RTL and cultural review are required for relevant commercial locales.

## Mode Behavior

Read-only by default:

- `scan`, `validate`, `status`, `rtl-check`, and most QA checks report findings.

Writes after approval:

- `extract`: append new entries to source table.
- `brief`: write `production/localization/translator-brief-[locale]-[date].md`.
- `cultural-review`: write cultural review report.
- `vo-pipeline script`: write VO scripts.
- `freeze`: write or update freeze status.
- `qa`: write localization QA report.

Use Codex delegation only when the user explicitly asks for parallel agent work.

## Reports

Include:

- mode and locale(s).
- files scanned.
- blocking findings.
- advisory findings.
- coverage or readiness summary.
- exact files/keys affected.
- next required action before release.

## Completion

Finish with:

- mode result.
- files written, if any.
- blocking localization issues.
- coverage or QA verdict when applicable.
- next recommended Codex request: extract, validate, cultural review,
  RTL check, VO pipeline, or release gate check.
