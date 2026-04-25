---
name: cgs-ux-design
description: Use to collaboratively author Codex Game Studios UX specs for screens, flows, HUDs, or interaction patterns using game concept, player journey, GDD UI requirements, existing UX docs, art bible, accessibility, and input/platform context. This is the Codex-native replacement for the original Claude Code `/ux-design` workflow.
metadata:
  short-description: Author UX specs
---

# Codex Game Studios UX Design

This skill authors UX documents collaboratively. Do not auto-generate a full
spec as a fait accompli; UX decisions require user approval.

## Modes

- `hud`: write `design/ux/hud.md`.
- `patterns`: write `design/ux/interaction-patterns.md`.
- screen or flow name: write `design/ux/[name].md`.

If no mode is provided, ask what to design.

## Inputs To Read

- `design/gdd/game-concept.md`.
- `design/player-journey.md`, if present.
- GDD UI Requirements sections under `design/gdd/`.
- Existing UX specs under `design/ux/`.
- `design/ux/interaction-patterns.md`, if present.
- `design/art/art-bible.md`, if present.
- `design/accessibility-requirements.md`, if present.
- Input/platform section from `.claude/docs/technical-preferences.md`.
- Original source workflow, only if more detail is needed:
  `.claude/skills/ux-design/SKILL.md`.

## Context Summary

Before authoring, summarize:

- target document and mode.
- journey phase and player context.
- GDD requirements found.
- related UX specs.
- pattern library status.
- accessibility tier.
- input methods and target platforms.

Ask if additional context should be read before starting.

## Retrofit Mode

If the output file already exists:

- read it.
- classify sections as Complete, Empty, or Placeholder.
- work only on incomplete sections unless the user requests revisions.

Do not overwrite completed sections silently.

## Authoring Flow

For each section:

1. Explain purpose and relevant constraints.
2. Ask focused design questions.
3. Offer options with tradeoffs when choices exist.
4. Draft the section in conversation.
5. Ask for approval.
6. Write only after approval or explicit request.

Create the skeleton first only after approval.

## UX Spec Sections

Use these sections for screen/flow specs:

- Purpose & Player Need.
- Player Context on Arrival.
- Navigation Position.
- Entry & Exit Points.
- Layout Specification.
- States & Variants.
- Interaction Map.
- Events Fired.
- Transitions & Animations.
- Data Requirements.
- Accessibility.
- Localization Considerations.
- Acceptance Criteria.
- Open Questions.

HUD and pattern-library modes use the matching structures from the original
workflow, adapted to project needs.

## Cross-Reference Check

Before handoff, check:

- GDD UI requirement coverage.
- pattern library alignment.
- navigation consistency.
- accessibility coverage.
- empty/error/loading states.

## Completion

Finish with:

- UX file path if written.
- sections completed.
- unresolved design questions.
- cross-reference gaps.
- next recommended Codex request: UX review, another UX spec, pattern library
  update, or pre-production gate check.
