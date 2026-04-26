---
name: cgs-team-ui
description: Use to coordinate a Codex Game Studios UI feature through UX spec, visual design, engine implementation, accessibility review, and polish. This is the Codex-native replacement for the original Claude Code `/team-ui` workflow.
metadata:
  short-description: Coordinate UI feature work
---

# Codex Game Studios Team UI

This skill runs a full UI feature pipeline. In Codex, do not spawn subagents
unless the user explicitly asks for delegation or parallel agent work. Otherwise
coordinate the role perspectives locally.

## Required Input

Require a UI feature description, screen, flow, HUD area, or interaction
pattern. If missing, ask for the target.

## Roles To Simulate Or Delegate

- UX design: flow, wireframe, accessibility, input behavior.
- UI programming: screen/widget structure, data binding, events.
- Art direction: visual treatment, consistency, asset requirements.
- Engine UI specialist: engine-native UI framework and pitfalls.
- Accessibility specialist: committed tier compliance and blockers.

## Inputs To Read

- `design/gdd/game-concept.md`.
- `design/player-journey.md`, if present.
- Relevant GDD UI Requirements sections.
- `design/ux/interaction-patterns.md`, if present.
- `design/accessibility-requirements.md`, if present.
- `design/art/` or art bible files.
- `.claude/docs/technical-preferences.md`.
- Existing UI source and tests.
- Original source workflow, only if more detail is needed:
  `.claude/skills/team-ui/SKILL.md`.

## Pipeline

1. Context: summarize player state, supported platforms, existing patterns,
   accessibility tier, and UI constraints.
2. UX spec: run or follow `cgs-ux-design` for the target. If designing HUD, use
   HUD-specific structure. Ask before writing new UX files.
3. UX review: run or follow `cgs-ux-review`; do not proceed past major blockers
   unless the user explicitly accepts the risk.
4. Visual design: derive style, layout, motion, and asset needs from the art
   bible while preserving accessibility.
5. Engine implementation: choose engine-native UI patterns. UI must display
   state and emit events; it must not own gameplay state.
6. Review: verify wireframe match, input navigation, visual consistency,
   localization readiness, and accessibility.
7. Polish: handle motion reduction, aspect ratios, UI audio routing, and update
   interaction patterns if new ones were introduced.

## Missing Pattern Library

If `design/ux/interaction-patterns.md` is missing, surface the gap and ask
whether to create it first or proceed while documenting any new patterns.

## Completion

Finish with:

- UX spec status and review verdict.
- Visual design and asset status.
- Implementation status.
- Accessibility and input method status.
- Interaction pattern library status.
- Open blockers and recommended next request: UX review, code review, or team
  polish.
