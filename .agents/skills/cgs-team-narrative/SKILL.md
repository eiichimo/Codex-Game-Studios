---
name: cgs-team-narrative
description: Use to coordinate Codex Game Studios narrative content through story direction, lore, dialogue, visual storytelling, level integration, localization readiness, and consistency review. This is the Codex-native replacement for the original Claude Code `/team-narrative` workflow.
metadata:
  short-description: Coordinate narrative content
---

# Codex Game Studios Team Narrative

This skill coordinates narrative content. Do not spawn subagents unless the user
explicitly asks for delegation or parallel agent work; otherwise synthesize the
role perspectives locally.

## Required Input

Require a narrative content description, such as `boss encounter cutscene`,
`faction intro dialogue`, or `tutorial narrative`. If missing, ask for the
target.

## Roles To Simulate Or Delegate

- Narrative director: story beat, character motivation, arc, tone, pacing.
- Writer: dialogue, lore entries, item text, in-game copy.
- World builder: canon, factions, history, geography, world rules.
- Art director: character visual profiles and environmental storytelling.
- Level designer: narrative triggers, discovery points, pacing in space.
- Localization lead: string keys, expansion headroom, cultural review.

## Inputs To Read

- `design/gdd/game-concept.md`.
- Existing `design/narrative/`, character, lore, and world docs.
- Relevant level docs and GDDs.
- Localization standards or `design/localization/`, if present.
- Art bible or visual direction docs.
- Original source workflow, only if more detail is needed:
  `.claude/skills/team-narrative/SKILL.md`.

## Pipeline

1. Narrative direction: define purpose, story beat, characters, motivations,
   emotional tone, pacing, dependencies, and new lore introduced.
2. World foundation: check lore consistency, define factions/locations/history,
   and set canon level for new entries.
3. Writing: draft dialogue and text with string keys, named placeholders,
   dialogue-box limits, and localization headroom.
4. Visual storytelling: define character silhouettes, environment props,
   lighting/cinematic tone, and spatial story clues.
5. Level integration: place triggers, dialogue zones, discovery points, and
   environmental storytelling beats without breaking gameplay pacing.
6. Consistency review: verify voice profiles, lore contradictions, unresolved
   mysteries, and documented true answers.
7. Localization readiness: check string keys, formatting, expansion budget,
   cultural assumptions, and translation-risk notes.
8. Documentation: ask before writing narrative, dialogue, or lore files.

## Blocking Rules

Stop and ask when:

- Existing canon contradicts the new content.
- Character voice or lore source is missing.
- New player-facing text lacks localization path.
- The narrative change alters major game direction or level structure.

Always produce a partial report if blocked.

## Completion

Finish with:

- Narrative brief status.
- Lore entries created or needed.
- Dialogue/text status.
- Level integration points.
- Localization readiness.
- Unresolved contradictions or canon decisions.
- Recommended next request: design review, localize extract, or dev story.
