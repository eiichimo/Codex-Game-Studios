---
name: cgs-start
description: Use for first-time onboarding in Codex Game Studios when the user wants to start a new game project, re-orient a fresh fork, choose where to begin, or replace the original Claude Code `/start` workflow with a Codex-native onboarding flow.
metadata:
  short-description: Start Codex Game Studios onboarding
---

# Codex Game Studios Start

This is the Codex-native replacement for the original `.claude/skills/start`
workflow. It orients the user and recommends the next workflow without assuming
Claude Code slash commands or `AskUserQuestion`.

## Inspect Project State

Before recommending a path, check:

- Engine configured: read `.claude/docs/technical-preferences.md`; placeholder
  `[TO BE CONFIGURED]` means unset.
- Game concept: `design/gdd/game-concept.md`.
- Source code: source files in `src/` such as `*.gd`, `*.cs`, `*.cpp`, `*.h`,
  `*.rs`, `*.py`, `*.js`, `*.ts`.
- Prototypes: subdirectories under `prototypes/`.
- Design docs: markdown files under `design/gdd/`.
- Production artifacts: files under `production/sprints/` or
  `production/milestones/`.
- Review mode: `production/review-mode.txt`.

Use `rg --files` and focused reads. Do not perform broad rewrites.

## Classify Starting Point

If the user has not already stated their situation, ask one concise question:

```text
Where are you starting from: no idea yet, vague idea, clear concept, or existing work?
```

Map the answer:

- `no idea yet`: recommend brainstorming from open creative discovery.
- `vague idea`: ask for a few words of theme, genre, or feeling, then recommend
  concept brainstorming from that seed.
- `clear concept`: ask for a one-sentence pitch, then recommend either
  formalizing it first or setting up the engine.
- `existing work`: report what the repository contains, then recommend a gap
  audit and adoption/retrofit flow.

If local evidence contradicts the answer, state the mismatch directly and ask
for confirmation before routing.

## Review Mode

If `production/review-mode.txt` exists, preserve it.

If missing, ask the user to choose:

- `full`: director-style review at key workflow steps.
- `lean`: review mainly at phase gates; default for solo/small teams.
- `solo`: fastest path with minimal formal review.

Only write `production/review-mode.txt` after the user chooses. Create
`production/` if needed.

## Recommend Next Workflow

Do not assume `/command` invocation. Phrase handoffs as natural Codex requests:

- Brainstorm: "Ask Codex to brainstorm the game concept."
- Setup engine: "Ask Codex to configure the game engine."
- Map systems: "Ask Codex to map the game systems."
- Existing work: "Ask Codex to detect the project stage and migration gaps."

Recommended paths:

- Fresh/no idea: brainstorm concept, configure engine, define art bible, map
  systems, author system GDDs, cross-review GDDs, then gate check.
- Vague idea: brainstorm with the seed, then same as fresh path.
- Clear concept: formalize concept or configure engine, then art bible, systems
  map, GDDs, architecture, UX, prototype, epics, stories, sprint.
- Existing work: detect project stage, audit artifact format, configure engine
  if needed, retrofit GDDs/ADRs/stories, then gate check.

Keep the response short. The output is a routing decision, not a full report.

## Completion

The start workflow is complete when the user has:

- A classified starting point.
- A review mode selected or confirmed.
- One concrete next Codex request.
