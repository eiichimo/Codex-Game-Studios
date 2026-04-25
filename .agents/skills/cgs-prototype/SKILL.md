---
name: cgs-prototype
description: Use to run a Codex Game Studios rapid prototype workflow for a game concept or mechanic, defining the core question, planning minimal throwaway implementation, isolating prototype code under `prototypes/`, and producing a PROCEED/PIVOT/KILL report. This is the Codex-native replacement for the original Claude Code `/prototype` workflow.
metadata:
  short-description: Run a rapid prototype
---

# Codex Game Studios Prototype

This skill validates a game idea quickly with throwaway code and a structured
report. Prototype code is never production code.

## Define The Question

Read the concept description and identify one core question the prototype must
answer. If the question is vague, ask for clarification before planning.

Review modes:

- `solo`: no delegated review.
- `lean`: default; report with Codex's recommendation.
- `full`: include creative-director-style assessment, but only use Codex
  delegation if the user explicitly asks for parallel agent work.

Read `production/review-mode.txt` if review mode is not specified.

## Inputs To Read

- `AGENTS.md` and `.claude/docs/technical-preferences.md`.
- `design/gdd/game-concept.md`, if present.
- Related GDDs, quick specs, or prior prototypes.
- Original source workflow, only if more detail is needed:
  `.claude/skills/prototype/SKILL.md`.

## Plan

Present a 3-5 bullet prototype plan:

- core question.
- minimum playable/testable slice.
- what is deliberately skipped.
- rough timebox.
- evidence to collect.

Ask for confirmation if scope is unclear or expanding.

## Implementation Rules

After approval or explicit request, create `prototypes/[concept-name]/`.

Every prototype source file should start with:

```text
PROTOTYPE - NOT FOR PRODUCTION
Question: [core question]
Date: [date]
```

Rules:

- hardcode values freely.
- use placeholders.
- skip production architecture and polish.
- avoid importing production source.
- production code must never import prototype files.
- if proceeding, rewrite production implementation from scratch.

## Report

Generate `prototypes/[concept-name]/REPORT.md` with:

- Hypothesis.
- Approach.
- Result.
- Metrics.
- Recommendation: `PROCEED`, `PIVOT`, or `KILL`.
- If Proceeding: production architecture, performance, scope, and estimate
  implications.
- If Pivoting or Killing: rationale and alternative direction.
- Lessons Learned.

## Write Output

Show the report first. After approval or explicit write request, write
`prototypes/[concept-name]/REPORT.md`.

## Completion

Finish with:

- core question.
- report path if written.
- recommendation.
- next recommended Codex request: design system, ADR, revised prototype, or
  playtest report.
