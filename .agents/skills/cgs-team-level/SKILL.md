---
name: cgs-team-level
description: Use to coordinate a Codex Game Studios level or area design through narrative purpose, world context, layout, encounters, art direction, accessibility, QA, and design document output. This is the Codex-native replacement for the original Claude Code `/team-level` workflow.
metadata:
  short-description: Coordinate level design
---

# Codex Game Studios Team Level

This skill coordinates complete level or area design. Do not spawn subagents
unless the user explicitly asks for delegation or parallel agent work; otherwise
combine the role perspectives locally.

## Required Input

Require a level name or area, such as `tutorial`, `forest dungeon`, `hub town`,
or `final boss arena`. If missing, ask for the target.

## Roles To Simulate Or Delegate

- Narrative director: story purpose, emotional arc, characters, beats.
- World builder: lore, region/faction context, environmental storytelling.
- Art director: visual landmarks, lighting, color, shape language, assets.
- Level designer: layout, critical path, pacing, encounters, navigation.
- Systems designer: enemy composition, rewards, hazards, resource placement.
- Accessibility specialist: wayfinding, contrast, cognitive load, signposting.
- QA tester: softlock, boundary, sequence break, playtest checklist.

## Inputs To Read

- `design/gdd/game-concept.md` and `design/gdd/game-pillars.md`, if present.
- Existing `design/levels/`.
- Relevant `design/narrative/`, world, art bible, and GDD docs.
- Acceptance criteria and system constraints for the area.
- Original source workflow, only if more detail is needed:
  `.claude/skills/team-level/SKILL.md`.

## Pipeline

1. Direction: define narrative purpose, lore context, emotional arc, visual
   targets, and landmarks before layout.
2. Layout: design critical path, optional paths, secrets, entry/exit points,
   adjacent-area references, pacing, and navigation.
3. Adjacent dependency check: if referenced adjacent areas have no
   `design/levels/[area].md`, mark them `UNRESOLVED` or ask whether to design
   them first. Do not invent adjacent area content.
4. Systems: specify encounters, difficulty, loot, hazards, resource placement,
   save/shop/checkpoint needs, and area-specific mechanics.
5. Production concepts: define key-space art specs, shared vs unique assets,
   lighting/sight lines, VFX needs, and visual risks.
6. Accessibility: review signposting, colorblind safety, cognitive load, and
   contrast. Stop before sign-off on blocking concerns unless the user accepts
   the documented risk.
7. QA: define critical-path tests, boundary/softlock cases, playtest checklist,
   and completion acceptance criteria.
8. Documentation: ask before writing `design/levels/[level-name].md`.

## Completion

Finish with:

- Area overview.
- Encounter and asset estimates.
- Narrative beats.
- Adjacent-area dependencies.
- Accessibility concerns and resolution status.
- QA checklist status.
- Verdict: `COMPLETE` or `BLOCKED`.
- Recommended next request: design review, QA plan, or dev story.
