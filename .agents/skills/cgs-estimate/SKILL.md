---
name: cgs-estimate
description: Use to generate a read-only Codex Game Studios effort estimate for a task by analyzing affected systems, likely files, dependencies, test needs, historical sprint data, complexity, risks, and confidence. This is the Codex-native replacement for the original Claude Code `/estimate` workflow.
metadata:
  short-description: Estimate task effort
---

# Codex Game Studios Estimate

This skill is read-only. It produces a scoped effort estimate with assumptions
and confidence instead of a single-point guess.

## Task Input

Read the task description from the user. If it is too vague to estimate, ask
for the missing scope, target system, acceptance criteria, or constraints before
continuing.

## Inputs To Read

- `AGENTS.md` and relevant directory instructions.
- `.claude/docs/technical-preferences.md`.
- Relevant GDDs under `design/gdd/`.
- Relevant architecture docs, ADRs, epics, and stories.
- Existing source and tests likely affected by the task.
- Past sprint plans, retrospectives, and velocity data under `production/`.
- Original source workflow, only if more detail is needed:
  `.claude/skills/estimate/SKILL.md`.

## Analyze

Assess:

- systems affected.
- likely files/modules to modify.
- new code vs modification ratio.
- integration points.
- test coverage needed.
- existing patterns available.
- dependencies and unfinished prerequisite work.
- ambiguity, new technology, platform, engine, or performance risk.

Round estimates to half-day increments. Do not imply false precision with hour
estimates for multi-day work.

## Estimate Output

Generate:

- Task Description.
- Complexity Assessment table.
- Key files likely affected.
- Effort Estimate: optimistic, expected, pessimistic.
- Recommended budget: expected estimate.
- Confidence: High, Medium, or Low.
- Risk Factors table.
- Dependencies table.
- Suggested Breakdown with subtasks.
- Notes and assumptions.

Always give a range. Do not silently pad. Call out risk explicitly so the user
can decide whether to reduce scope or fund a spike.

## Completion

Finish with:

- recommended budget.
- confidence level.
- biggest risk factor.
- next recommended Codex request: prototype/spike, create stories, or sprint
  plan update.
