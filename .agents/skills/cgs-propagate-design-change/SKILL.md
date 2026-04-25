---
name: cgs-propagate-design-change
description: Use when a Codex Game Studios GDD has changed and architecture or ADR traceability may be stale, producing a design change impact report, affected ADR classifications, traceability updates, and follow-up ADR actions. This is the Codex-native replacement for the original Claude Code `/propagate-design-change` workflow.
metadata:
  short-description: Propagate GDD changes
---

# Codex Game Studios Propagate Design Change

This skill finds architecture decisions that may be stale after a GDD revision.

## Required Input

A changed GDD path is required. If missing or invalid, ask for the path and stop
until it is provided.

## Inputs To Read

- current changed GDD.
- previous committed version from git, if available.
- ADRs under `docs/architecture/`.
- `docs/architecture/architecture-traceability.md`, if present.
- Original source workflow, only if more detail is needed:
  `.claude/skills/propagate-design-change/SKILL.md`.

If there is no previous git version, report that this appears to be a new GDD
and that there may be nothing to propagate.

## Analyze GDD Changes

Compare previous vs current GDD and summarize:

- changed sections.
- unchanged sections.
- new, removed, or modified rules.
- formula changes.
- tuning knob changes.
- acceptance criteria changes.
- changes likely to affect architecture.

## ADR Impact Analysis

For each ADR referencing the changed GDD:

- locate referenced requirements in the current GDD.
- compare what the ADR assumed against what the GDD now says.
- classify as `Still Valid`, `Needs Review`, or `Likely Superseded`.
- recommend `Keep as-is`, `Review and update`, or `Mark Superseded and write
  new ADR`.

Use Codex delegation only if the user explicitly asks for parallel review.

## Report

Generate:

- Design Change Impact Report.
- change summary.
- ADRs not affected.
- ADRs needing review.
- likely superseded ADRs.
- recommended resolution per ADR.
- traceability index update needs.

## Writes

Ask before every write.

Allowed writes after approval:

- mark ADR status as superseded or pending replacement.
- update `docs/architecture/architecture-traceability.md`.
- write `docs/architecture/change-impact-[date]-[system-slug].md`.

Never delete ADR content.

## Completion

Finish with:

- affected ADR counts.
- change impact report path if written.
- ADRs needing replacement or update.
- next recommended Codex request: architecture decision or architecture review.
