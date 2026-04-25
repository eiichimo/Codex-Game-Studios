---
name: cgs-consistency-check
description: Use to run a Codex Game Studios cross-GDD consistency check against the entity registry, detecting conflicting entity, item, formula, and constant values, stale registry entries, unverifiable references, and required fixes before architecture. This is the Codex-native replacement for the original Claude Code `/consistency-check` workflow.
metadata:
  short-description: Check GDD consistency
---

# Codex Game Studios Consistency Check

This skill verifies that GDDs and the entity registry agree on shared facts. It
is a safety net before cross-GDD review, architecture, and ADR work.

## Modes

- `full`: check all registered entries.
- `since-last-review`: check GDDs changed since the latest cross review.
- `entity:[name]`: check one entity.
- `item:[name]`: check one item.

Default to `full`.

## Inputs To Read

- `design/registry/entities.yaml`; stop if missing or empty.
- In-scope GDDs under `design/gdd/`, excluding concept/index/pillars docs.
- Latest `design/gdd/gdd-cross-review-*.md`, if using `since-last-review`.
- Git history only when needed to determine stale registry context.
- Original source workflow, only if more detail is needed:
  `.claude/skills/consistency-check/SKILL.md`.

## Grep-First Scan

Build maps from the registry:

- entities.
- items.
- formulas.
- constants.

Search in-scope GDDs for each registered name and inspect local context before
full-reading any document. Full-read only sections involved in suspected
conflicts.

Detect:

- `CONFLICT`: different values for the same named fact.
- `STALE REGISTRY`: source GDD changed but registry is behind.
- `UNVERIFIABLE`: reference exists but has no comparable value.

The source GDD listed in the registry is normally authoritative unless the user
confirms a design change.

## Report

Generate:

- Registry counts by entry type.
- GDDs scanned.
- Conflicts that must resolve before architecture.
- Stale registry entries.
- Unverifiable references.
- Clean entry count.
- Verdict: `PASS` or `CONFLICTS FOUND`.

For each conflict, include source, conflicting document, exact differing value,
and recommended resolution.

## Optional Writes

Ask before any file changes.

Allowed updates after approval:

- update stale registry values in `design/registry/entities.yaml`.
- add new cross-system entries that appear in more than one GDD.
- mark deprecated entries instead of deleting.
- append to `docs/consistency-failures.md` only if it already exists.

Do not silently resolve design conflicts.

## Completion

Finish with:

- verdict.
- unresolved conflict count.
- stale registry count.
- files updated, if any.
- next recommended Codex request: fix GDDs, rerun consistency check,
  review all GDDs, or create architecture.
