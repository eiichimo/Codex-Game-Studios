---
name: cgs-review-all-gdds
description: Use to run a holistic Codex Game Studios cross-GDD review across all system GDDs, checking consistency, dependency symmetry, rule contradictions, ownership conflicts, formula compatibility, design holism, progression loops, attention budget, economy, pillar alignment, and scenario failures. This is the Codex-native replacement for the original Claude Code `/review-all-gdds` workflow.
metadata:
  short-description: Review all GDDs
---

# Codex Game Studios Review All GDDs

This skill reviews relationships between GDDs. Use it after MVP-tier GDDs are
written and before architecture begins.

## Modes

- `full`: consistency plus design holism.
- `consistency`: cross-document consistency only.
- `design-theory`: design holism only.
- `since-last-review`: only GDDs changed since the last cross-review.

Default to `full`.

## Inputs To Read

- `design/gdd/game-concept.md`.
- `design/gdd/game-pillars.md`, if present.
- `design/gdd/systems-index.md`.
- all in-scope system GDDs under `design/gdd/`.
- `design/registry/entities.yaml`, if present.
- latest `design/gdd/gdd-cross-review-*.md`, for incremental mode.
- Original source workflow, only if more detail is needed:
  `.claude/skills/review-all-gdds/SKILL.md`.

If fewer than two system GDDs exist, stop and recommend writing more GDDs first.

## Consistency Review

Check:

- dependency bidirectionality.
- rule contradictions.
- stale cross-document references.
- data and tuning knob ownership conflicts.
- formula output/input range compatibility.
- acceptance criteria contradictions.
- registry conflicts or stale entries.

Every issue must cite the GDD, section, and conflicting text or value.

## Design Holism Review

Check:

- competing progression loops.
- player attention budget and cognitive overload.
- dominant strategies.
- economic loops, sources, sinks, and runaway feedback.
- difficulty curve consistency.
- pillar and anti-pillar alignment.
- player fantasy coherence.
- 3-5 key cross-system scenario walkthroughs.

Do not decide which GDD is correct. Surface options and required decisions.

## Report

Generate:

- GDDs reviewed and systems covered.
- Consistency Issues: blocking and warnings.
- Game Design Issues: blocking and warnings.
- Cross-System Scenario Issues.
- GDDs Flagged for Revision.
- Verdict: `PASS`, `CONCERNS`, or `FAIL`.
- Required actions if `FAIL`.

## Write Output

Present the report first. After approval or explicit write request, write
`design/gdd/gdd-cross-review-[date].md`.

If GDDs need revision, ask separately before updating
`design/gdd/systems-index.md` statuses to `Needs Revision`.

## Completion

Finish with:

- verdict.
- report path if written.
- blocking issue count.
- GDDs needing revision.
- next recommended Codex request: design review, consistency check, gate check,
  or create architecture.
