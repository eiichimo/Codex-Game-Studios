---
name: cgs-architecture-review
description: Use to review Codex Game Studios architecture for GDD requirement coverage, ADR consistency, engine compatibility, and traceability gaps. This is the Codex-native replacement for the original Claude Code `/architecture-review` workflow.
metadata:
  short-description: Review architecture coverage
---

# Codex Game Studios Architecture Review

This skill validates that architecture and ADRs cover the game's design
requirements and target the pinned engine safely.

## Modes

- Full review: coverage, consistency, and engine checks.
- Coverage: GDD requirements to ADR coverage.
- Consistency: cross-ADR conflicts and dependency cycles.
- Engine: engine version, deprecated APIs, and compatibility risks.
- RTM: requirement to ADR to story to test traceability.

## Inputs To Read

- `design/gdd/*.md` and `design/gdd/systems-index.md`.
- `docs/architecture/architecture.md`.
- `docs/architecture/adr-*.md`.
- `docs/architecture/tr-registry.yaml`, if present.
- `.claude/docs/technical-preferences.md`.
- `docs/engine-reference/<engine>/VERSION.md`, `deprecated-apis.md`,
  `breaking-changes.md`, and relevant module docs.
- Stories under `production/epics/**/*.md` and tests under `tests/` for RTM mode.
- Original source workflow, only if more detail is needed:
  `.claude/skills/architecture-review/SKILL.md`.

## Checks

- Extract technical requirements from GDDs.
- Reuse stable TR IDs from `tr-registry.yaml`; never renumber existing IDs.
- Map each requirement to ADR coverage: Covered, Partial, or Gap.
- Detect ADR conflicts: ownership, integration contracts, performance budgets,
  dependency cycles, state authority, and incompatible patterns.
- Verify all ADRs have Status, ADR Dependencies, Engine Compatibility, and GDD
  Requirements Addressed sections.
- Verify ADR engine versions match the configured engine.
- Flag deprecated or unverified post-cutoff APIs.

## Output

Use verdicts:

- `PASS`: coverage is complete or gaps are low-risk and documented.
- `CONCERNS`: meaningful gaps or risks exist, but work can continue if accepted.
- `FAIL`: missing architecture, blocking ADR gaps, dependency cycles, or unsafe
  engine assumptions.

Report:

- Requirement coverage counts.
- Gap list with recommended ADRs.
- ADR conflicts and cycles.
- Engine compatibility risks.
- RTM coverage if requested.

## Optional Writes

Only after user approval:

- Update `docs/architecture/tr-registry.yaml`.
- Write `docs/architecture/architecture-review-[date].md`.
- Write `docs/architecture/requirements-traceability.md` in RTM mode.

Do not edit ADR decisions during review; recommend follow-up ADR work instead.
