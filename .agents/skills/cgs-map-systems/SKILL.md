---
name: cgs-map-systems
description: Use to decompose a Codex Game Studios game concept into systems, dependencies, priorities, and design order, creating or updating `design/gdd/systems-index.md`. This is the Codex-native replacement for the original Claude Code `/map-systems` workflow.
metadata:
  short-description: Map game systems and dependencies
---

# Codex Game Studios Map Systems

This skill creates or updates the systems index. It turns the game concept into
a dependency-ordered list of systems to design and implement.

## Modes

- Full map: no systems index exists or the user asks to map the project.
- Next system: the user asks what system to design next.
- Revision: a systems index exists and the user wants to add, split, combine, or
  reprioritize systems.

## Inputs To Read

- `design/gdd/game-concept.md`; required for a full map.
- `design/gdd/game-pillars.md`, if present.
- `design/gdd/systems-index.md`, if present.
- Existing `design/gdd/*.md` files to detect designed systems.
- `.claude/docs/templates/systems-index.md` for the output shape.
- Original source workflow, only if more detail is needed:
  `.claude/skills/map-systems/SKILL.md`.

If the concept is missing, stop and recommend running the concept brainstorm
workflow first.

## Enumerate Systems

Extract explicit systems from:

- Core mechanics.
- Core loop.
- MVP/scope sections.
- Technical considerations.
- UX, narrative, economy, progression, or content requirements.

Infer implicit systems. Examples:

- Combat implies health, damage, hit detection, enemy behavior, feedback, and
  combat UI.
- Crafting implies recipes, ingredients, item data, crafting UI, discovery, and
  persistence.
- Dialogue implies dialogue graph, UI, choice tracking, localization, and NPC
  state.
- Multiplayer implies networking, lobby, state sync, authority, security, and
  network UX.

Present systems by category with one-sentence descriptions and whether each was
explicit or inferred. Ask the user to confirm missing, merged, split, or
unwanted systems before writing.

## Map Dependencies

For each system, identify dependencies:

- Input/output dependency: consumes data from another system.
- Structural dependency: plugs into a foundation system.
- UX dependency: interface depends on gameplay behavior.
- Persistence dependency: save/load or state ownership.

Assign each system to a layer:

- Foundation
- Core
- Feature
- Presentation
- Polish

Flag cycles and propose a resolution: interface contract, split ownership, or
temporary provisional dependency.

## Assign Priority

Assign tiers:

- MVP: required for the smallest playable core loop.
- Vertical Slice: needed for a representative complete experience.
- Alpha: broader content and system coverage.
- Full Vision: optional expansion, polish, meta, or post-launch systems.

Explain priority with player-experience reasoning, not only technical
dependency.

## Write Output

Before editing, summarize:

- Total system count.
- MVP count.
- First 3 systems in design order.
- High-risk or bottleneck systems.
- Dependency cycles or provisional assumptions.

Ask whether to write `design/gdd/systems-index.md`. After approval, create or
update the file using the systems-index template. Preserve existing progress
statuses where possible.

## Next-System Mode

If asked for the next system:

1. Read `design/gdd/systems-index.md`.
2. Find the highest-priority undesigned system whose required dependencies are
   designed or can be explicitly treated as provisional.
3. Report the recommended system and why.
4. Recommend asking Codex to design that system with the `cgs-design-system`
   workflow.

## Completion

Finish with:

- The systems index path written or updated, or the next system recommendation.
- The next recommended Codex request.
