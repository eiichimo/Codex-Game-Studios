# Design Directory Instructions

Follow these standards when authoring or editing design files.

## GDD Files

Files in `design/gdd/` must include these sections in order:

1. Overview
2. Player Fantasy
3. Detailed Rules
4. Formulas
5. Edge Cases
6. Dependencies
7. Tuning Knobs
8. Acceptance Criteria

Use `[system-slug].md` filenames such as `movement-system.md` or
`combat-system.md`.

Update `design/gdd/systems-index.md` when adding a system GDD. Design in this
order unless the user explicitly chooses otherwise: Foundation, Core, Feature,
Presentation, Polish.

## Quick Specs

Use `design/quick-specs/` for tuning changes, minor mechanics, and small
additions that do not need a full GDD.

## UX Specs

- Per-screen specs: `design/ux/[screen-name].md`
- HUD design: `design/ux/hud.md`
- Interaction patterns: `design/ux/interaction-patterns.md`
- Accessibility requirements: `design/ux/accessibility-requirements.md`

Before passing UX work to implementation, check alignment with the relevant GDDs
and accessibility requirements.

## Narrative Docs

For `design/narrative/**`:

- Cross-reference new lore against existing lore for contradictions.
- Every lore entry needs a canon level: Established, Provisional, or Under
  Review.
- Dialogue must match the relevant character voice profile.
- World rules must state what is possible and impossible.
- Mysteries need documented true answers even if players never learn them.
- Faction motivations, relationships, and power structures must be internally
  logical.
- Player-facing text must be localization-ready with named placeholders.
- Dialogue lines should stay under 120 characters unless the UI spec allows
  longer text.
