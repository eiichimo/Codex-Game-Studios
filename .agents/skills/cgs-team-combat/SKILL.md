---
name: cgs-team-combat
description: Use to coordinate a Codex Game Studios combat feature from mechanic design through architecture, implementation, feedback, QA, and sign-off. This is the Codex-native replacement for the original Claude Code `/team-combat` workflow.
metadata:
  short-description: Coordinate combat feature work
---

# Codex Game Studios Team Combat

This skill coordinates combat feature delivery. In Codex, do not spawn
subagents unless the user explicitly asks for delegation or parallel agent work.
Without that request, perform the orchestration locally and present role-based
analysis, plans, and checkpoints.

## Required Input

Require a combat feature description. If missing, ask for the feature or area,
for example `melee parry system` or `ranged weapon spread`.

## Roles To Simulate Or Delegate

- Game design: mechanic rules, formulas, player fantasy, edge cases.
- Gameplay programming: core implementation, data flow, tuning knobs.
- AI programming: NPC reactions and behavior changes, if relevant.
- Technical art: VFX, shaders, camera feedback, visual readability.
- Sound design: audio events, impact feedback, mix notes.
- Engine specialist: idiomatic engine architecture and version constraints.
- QA: acceptance tests, edge cases, performance checks.

If subagents are explicitly requested, delegate only bounded, independent
subtasks and keep file ownership disjoint.

## Inputs To Read

- `design/gdd/game-concept.md`.
- Relevant combat/system GDDs under `design/gdd/`.
- `docs/architecture/`, ADRs, and `docs/architecture/control-manifest.md`.
- `.claude/docs/technical-preferences.md`.
- Existing combat source, assets, audio, and tests.
- Original source workflow, only if more detail is needed:
  `.claude/skills/team-combat/SKILL.md`.

## Pipeline

1. Design: create or update the mechanic spec with rules, formulas, edge cases,
   dependencies, tuning knobs, and acceptance criteria. Ask before locking major
   design direction or writing GDD files.
2. Architecture: propose class/node/component structure, data files, events, and
   integration points. Validate against ADRs and engine preferences.
3. Implementation: implement core gameplay first, then AI, VFX, and audio
   integration. Keep tuning data-driven.
4. Integration: wire systems together and verify events, data ownership, and
   player feedback.
5. Validation: add or identify tests, manual QA steps, performance checks, and
   balance follow-up.
6. Sign-off: report `COMPLETE`, `NEEDS WORK`, or `BLOCKED`.

## Blocking Rules

Stop and ask before proceeding when:

- Required GDD or story context is missing.
- An ADR needed for implementation is only Proposed.
- The feature is too large for one pass and should be split into stories.
- Design, ADR, and story requirements conflict.
- A phase depends on unfinished output from a prior phase.

Always produce a partial report if blocked.

## Completion

Finish with:

- Design status.
- Architecture status.
- Implementation and asset/audio status.
- Test and QA evidence status.
- Open issues with owners or suggested follow-up.
- Recommended next request: code review, balance check, or team polish.
