---
name: cgs-design-review
description: Use to review a Codex Game Studios design document or system GDD for completeness, consistency, implementability, dependencies, and readiness for implementation. This is the Codex-native replacement for the original Claude Code `/design-review` workflow.
metadata:
  short-description: Review a design document
---

# Codex Game Studios Design Review

This skill reviews a design document before it is handed to implementation.
Default behavior is read-only unless the user explicitly asks to revise or log
the review.

## Inputs To Read

- Target design document path.
- `AGENTS.md`, `design/AGENTS.md`, and relevant directory instructions.
- `design/gdd/game-concept.md`, if present.
- Related GDDs under `design/gdd/`.
- `design/registry/entities.yaml`, if present.
- Prior review log at `design/gdd/reviews/[doc-name]-review-log.md`, if present.
- Original source workflow, only if more detail is needed:
  `.claude/skills/design-review/SKILL.md`.

If no path is provided, ask for one or infer the most recently edited GDD only
if that is unambiguous.

## Completeness Checklist

For system GDDs, verify these 8 sections:

1. Overview
2. Player Fantasy
3. Detailed Rules
4. Formulas
5. Edge Cases
6. Dependencies
7. Tuning Knobs
8. Acceptance Criteria

Accept equivalent headings such as "Detailed Design" only if the content is
specific enough for implementation.

## Review Areas

Assess:

- Completeness: missing or placeholder sections.
- Internal consistency: rules, formulas, edge cases, and tuning ranges agree.
- Implementability: a programmer can build it without guessing.
- Testability: acceptance criteria are measurable.
- Dependency graph: listed dependencies exist or are explicitly provisional.
- Cross-system consistency: no contradictions with existing GDDs or registry
  facts.
- Pillar alignment: mechanics support the stated game pillars and fantasy.
- Scope signal: S, M, L, or XL based on dependencies, formulas, systems touched,
  and likely ADR needs.

## Optional Depth

If the user asks for a full/adversarial review, simulate domain lenses locally:

- Game design: fantasy, fun, dominant strategies, cognitive load.
- Systems design: formula bounds, data ownership, tuning surfaces.
- QA: acceptance criteria and edge cases.
- Technical: architecture or engine risks.
- UX/narrative/economy only when the document touches those domains.

Do not spawn subagents unless the user explicitly asks for delegated review.

## Output

Use this format:

```text
Design Review: [Document]
Verdict: APPROVED | NEEDS REVISION | MAJOR REVISION NEEDED
Scope signal: S | M | L | XL

Completeness:
- [X/8] required sections present

Required before implementation:
- [blocking issue]

Recommended revisions:
- [important but not blocking]

Dependency graph:
- [dependency] - exists / missing / provisional

Residual risks:
- [risk or none]
```

## Verdict Rules

- `APPROVED`: complete enough to implement; only minor improvements remain.
- `NEEDS REVISION`: implementation would require guessing or risk, but fixes are
  localized.
- `MAJOR REVISION NEEDED`: concept, rules, dependencies, or acceptance criteria
  are too incomplete or contradictory to implement safely.

## Optional Writes

Only if the user approves:

- Append review summary to `design/gdd/reviews/[doc-name]-review-log.md`.
- Update `design/gdd/systems-index.md` status.
- Revise the GDD to address blockers.

Preserve existing design content and avoid overwriting authored sections without
explicit approval.
