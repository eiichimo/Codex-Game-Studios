---
name: cgs-ux-review
description: Use to run a read-only Codex Game Studios UX review for one UX spec, all UX specs, HUD design, or interaction patterns, validating completeness, accessibility, input coverage, GDD alignment, pattern consistency, localization, and implementation readiness. This is the Codex-native replacement for the original Claude Code `/ux-review` workflow.
metadata:
  short-description: Review UX readiness
---

# Codex Game Studios UX Review

This skill is read-only. It validates UX design documents before implementation
handoff and reports risks without editing files.

## Scope

- file path: review one UX document.
- `all`: review all `design/ux/*.md`.
- `hud`: review `design/ux/hud.md`.
- `patterns`: review `design/ux/interaction-patterns.md`.

If missing, ask which spec to validate.

## Inputs To Read

- Target UX document(s).
- Input/platform section from `.claude/docs/technical-preferences.md`.
- `design/accessibility-requirements.md`, if present.
- `design/ux/interaction-patterns.md`, if present.
- Referenced GDD UI Requirements sections.
- `design/player-journey.md`, if present.
- Original source workflow, only if more detail is needed:
  `.claude/skills/ux-review/SKILL.md`.

## Validate UX Specs

Check:

- required sections present.
- player need stated from player perspective.
- arrival context and navigation position.
- entry and exit points.
- layout zones and component inventory.
- loading, empty, error, and progression states.
- interaction map covers supported input methods.
- data requirements have source systems and no UI-owned game state.
- events fired are specified or intentionally absent.
- transitions and animation behavior.
- accessibility tier coverage.
- localization expansion and character limits.
- acceptance criteria are testable without reading other docs.
- all GDD UI requirements are covered.
- pattern library references are consistent.

## Validate HUD

Check:

- HUD philosophy.
- full information inventory from GDD UI requirements.
- layout zones and safe margins.
- element priority, visibility triggers, data source, and update behavior.
- gameplay context states.
- visual budget and platform adaptation.
- colorblind and accessibility support.

## Validate Pattern Library

Check:

- pattern catalog matches document contents.
- standard control patterns are covered.
- game-specific patterns from UX specs are included.
- each pattern defines states, accessibility, when to use, and when not to use.
- navigation/back behavior is consistent.

## Output

For each reviewed document, generate:

- Completeness score.
- Quality Issues with `BLOCKING` or `ADVISORY`.
- GDD Alignment.
- Accessibility result.
- Pattern Library result.
- Verdict: `APPROVED`, `NEEDS REVISION`, or `MAJOR REVISION NEEDED`.
- Blocking and advisory counts.

For `all`, start with a summary table: file, verdict, primary issue.

## Completion

Finish with:

- verdict.
- blocking issues.
- highest-risk implementation gap.
- next recommended Codex request: fix UX sections, run UX design, team UI, or
  pre-production gate check.
