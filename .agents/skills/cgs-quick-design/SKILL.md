---
name: cgs-quick-design
description: Use to create a lightweight Codex Game Studios quick design spec for small tuning, tweak, addition, or new-small-system changes that do not need a full GDD, including context scan, design delta, acceptance criteria, and GDD update guidance. This is the Codex-native replacement for the original Claude Code `/quick-design` workflow.
metadata:
  short-description: Draft a quick design spec
---

# Codex Game Studios Quick Design

This skill is the lightweight design path for changes too small for a full GDD
but too meaningful to implement without written rationale.

## Classification

Classify the requested change:

- `Tuning`: value/balance changes with no behavioral change.
- `Tweak`: small behavior change in an existing system.
- `Addition`: small mechanic added to an existing system.
- `New Small System`: standalone feature small enough to avoid full GDD.

Redirect to `cgs-design-system` if the change adds significant cross-system
dependencies, alters core contracts, changes the game's aesthetic balance, or
is likely to exceed roughly one week of implementation.

If classification is uncertain, ask before drafting.

## Inputs To Read

- Relevant GDD under `design/gdd/`.
- `design/gdd/systems-index.md`, if present.
- Prior quick specs under `design/quick-specs/`.
- Relevant data files under `assets/data/` for tuning changes.
- Original source workflow, only if more detail is needed:
  `.claude/skills/quick-design/SKILL.md`.

## Draft The Spec

For `Tuning`, include:

- changed parameter table with old value, new value, and rationale.
- mapping to the GDD tuning knob and allowed range.
- acceptance criteria proving values are data-driven and observable.

For `Tweak` or `Addition`, include:

- change summary and motivation.
- design delta from the current GDD rule.
- precise new rules, states, values, and edge conditions.
- affected systems table.
- acceptance criteria and regression criterion.
- whether a GDD update is required.

For `New Small System`, include:

- scope boundary.
- overview.
- core rules.
- tuning knobs with defaults/ranges.
- acceptance criteria.
- systems-index recommendation.

## Write Output

Present the draft in full. After approval or explicit write request, create
`design/quick-specs/` and write
`design/quick-specs/[kebab-title]-[date].md`.

If a GDD update is required, show the exact proposed old/new text and ask
before editing the GDD.

## Completion

Finish with:

- quick spec path if written.
- type and system.
- GDD update status.
- next recommended Codex request: story readiness, dev story, or full design
  system if scope has grown.
