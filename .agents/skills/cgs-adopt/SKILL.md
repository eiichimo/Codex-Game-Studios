---
name: cgs-adopt
description: Use to audit an existing or brownfield Codex Game Studios project for template artifact format compliance and produce a prioritized migration plan. This is the Codex-native replacement for the original Claude Code `/adopt` workflow.
metadata:
  short-description: Audit brownfield adoption
---

# Codex Game Studios Adopt

This skill checks whether existing artifacts will work with the template's
skills. It is different from stage detection: stage detection asks what exists;
adoption asks whether the artifacts have the required internal format.

## Modes

- `full`: complete audit. Default.
- `gdds`: GDD format only.
- `adrs`: ADR format only.
- `stories`: story format only.
- `infra`: registry, manifest, sprint/status, stage, engine reference.

## Inputs To Read

- `production/stage.txt`.
- `design/gdd/game-concept.md`, `systems-index.md`, and system GDDs.
- `docs/architecture/adr-*.md`.
- `production/epics/**/*.md`.
- `.claude/docs/technical-preferences.md`.
- `docs/engine-reference/`, `docs/adoption-plan-*.md`.
- Original source workflow, only if more detail is needed:
  `.claude/skills/adopt/SKILL.md`.

## Audit Checks

- GDDs: required sections, non-placeholder content, valid status field.
- ADRs: `Status`, dependencies, engine compatibility, requirements addressed,
  performance implications.
- Systems index: valid status values, no parenthetical status text, required
  columns.
- Stories: status, acceptance checkboxes, ADR references, TR-ID references,
  manifest version.
- Infrastructure: TR registry, control manifest, manifest version,
  `production/sprint-status.yaml`, `production/stage.txt`, engine reference,
  architecture traceability.
- Technical preferences: unconfigured engine/language/rendering/physics and
  missing budgets or standards.

## Severity

- `BLOCKING`: template skills will likely produce wrong results now.
- `HIGH`: unsafe or incomplete story/architecture generation.
- `MEDIUM`: degraded quality or tracking.
- `LOW`: useful retroactive improvements.

Order migration steps by severity, with infrastructure bootstrapping after
format blockers.

## Fresh Project Handling

If no meaningful artifacts exist, explain that this is not a brownfield
adoption case and recommend `cgs-start`. If artifacts may be elsewhere, ask for
their location.

## Optional Writes

Show the audit summary and gap preview before writing. After approval, create:

```text
docs/adoption-plan-[date].md
```

If `production/review-mode.txt` is missing, ask whether to set `full`, `lean`,
or `solo`; write it only after the user's choice.

## Completion

Finish with:

- Detected phase and engine status.
- GDD, ADR, story, and infrastructure counts.
- Gap counts by severity.
- Highest-priority blocking items.
- Estimated remediation.
- One recommended first action.
