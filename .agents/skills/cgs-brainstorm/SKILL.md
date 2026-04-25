---
name: cgs-brainstorm
description: Use to guide Codex Game Studios concept ideation from no idea, a vague theme, or a rough pitch into a structured game concept document. This is the Codex-native replacement for the original Claude Code `/brainstorm` workflow.
metadata:
  short-description: Create a game concept
---

# Codex Game Studios Brainstorm

This skill turns a seed idea into `design/gdd/game-concept.md`. It is
collaborative: Codex facilitates options and structure, but the user owns the
creative direction.

## Inputs To Read

- `production/review-mode.txt`, if present.
- `design/gdd/game-concept.md`, if resuming.
- `design/gdd/game-pillars.md`, if present.
- `.claude/docs/templates/game-concept.md` for the output shape.
- Original source workflow, only if more detail is needed:
  `.claude/skills/brainstorm/SKILL.md`.

## Discovery

If no concept exists, ask only the highest-signal questions needed to start:

- What games, moments, or fantasies should this project capture?
- What genres or themes are attractive or off-limits?
- What player experience is primary: challenge, story, expression, discovery,
  relaxation, or social play?
- What are the realistic constraints: timeline, team size, skill level, target
  platform, and desired scope?

If the user provides a seed, use it. If not, run open ideation.

## Generate Concepts

Produce three distinct concepts using different angles:

- Verb-first design: start from the dominant player action.
- Mashup method: combine genre, theme, or emotion in a non-obvious way.
- Experience-first/MDA: start from the intended emotion and work backward.

For each concept, include:

- Working title.
- Elevator pitch.
- Core verb.
- Core fantasy.
- Unique hook.
- Primary MDA aesthetic.
- Estimated scope.
- Biggest promise.
- Biggest risk.

Ask the user to choose one, combine elements, or request fresh directions.

## Build The Chosen Concept

After selection, define:

- 30-second loop: moment-to-moment action.
- 5-minute loop: short-term goals and choices.
- Session loop: 30-120 minute play structure and stopping points.
- Long-term progression: growth, mastery, story, or unlocks.
- Player motivation: autonomy, competence, relatedness.
- Target audience and comparable games.
- Visual Identity Anchor: 2-4 sentences describing the art/style direction that
  should later feed the art bible.

## Pillars

Collaboratively define:

- 3-5 game pillars, each with a one-sentence definition and a design test.
- At least 3 anti-pillars that clearly block scope creep.

Do not lock pillars until the user agrees they express the intended game.

## Write Output

Before editing, summarize the intended document and ask whether to write it.
After approval:

- Create `design/gdd/` if needed.
- Write or update `design/gdd/game-concept.md`.
- Preserve existing useful content if resuming; do not overwrite the user's
  prior concept without explicit approval.

Minimum document sections:

- Elevator Pitch
- Core Fantasy
- Target Audience
- Game Pillars
- Anti-Pillars
- Core Loop
- MDA Analysis
- Player Motivation
- Visual Identity Anchor
- Scope Tiers
- Engine Recommendation, if enough context exists
- Open Questions

## Completion

Finish with:

- The concept path written or updated.
- The next recommended Codex request: configure the engine, define the art
  bible, or map systems.
