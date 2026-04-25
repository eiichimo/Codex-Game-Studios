---
name: cgs-art-bible
description: Use to author or retrofit a Codex Game Studios art bible from an approved game concept, defining visual identity, mood, shape language, color system, production art direction, asset standards, references, and sign-off status. This is the Codex-native replacement for the original Claude Code `/art-bible` workflow.
metadata:
  short-description: Author an art bible
---

# Codex Game Studios Art Bible

This skill creates `design/art/art-bible.md`, the visual identity constraint
document that guides asset production.

## Preconditions

Read `design/gdd/game-concept.md`. If missing, stop and recommend
`cgs-brainstorm` first.

Extract:

- title.
- core fantasy and elevator pitch.
- game pillars.
- visual identity anchor, if present.
- target platform.

Read `.claude/docs/technical-preferences.md` for engine and performance
constraints when available.

## Retrofit Mode

If `design/art/art-bible.md` exists:

- read it.
- classify each section as Complete, Empty, or Placeholder.
- work only on incomplete sections unless the user asks to revise existing
  content.

## Scope

Ask which scope to author when not obvious:

- full bible.
- visual identity core.
- asset standards only.
- resume missing sections.

Ask for reference games, films, artists, or visual examples if none are present.

## Sections

Author the requested sections:

- Visual Identity Statement: one-line rule plus supporting principles.
- Mood and Atmosphere: emotional targets and lighting by game state.
- Shape Language: character, environment, UI, hero/supporting shapes.
- Color System: palette roles, semantic colors, UI divergence, accessibility.
- Character Design Direction.
- Environment Design Language.
- UI/HUD Visual Direction.
- Asset Standards: formats, naming, size/resolution tiers, LOD, engine
  constraints.
- Reference Direction: what to borrow and what to avoid.

Do not assume Claude named agents exist. Use Codex delegation only when the user
explicitly asks for parallel agent work. If no delegation is requested, draft
from the concept, references, and constraints, then ask for approval.

## Write Output

Present drafted sections for approval. After approval or explicit write
request, create `design/art/` and write or update
`design/art/art-bible.md`.

Preserve existing completed sections unless explicitly instructed to revise.

## Completion

Finish with:

- art bible path if written.
- sections authored or updated.
- unresolved visual decisions.
- next recommended Codex request: map systems, setup engine, design system,
  asset spec, consistency check, or create architecture.
