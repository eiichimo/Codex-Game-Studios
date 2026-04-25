---
name: cgs-code-review
description: Use to perform a Codex Game Studios code review for implementation files, checking ADR compliance, standards, architecture, testability, performance, and game-specific risks. This is the Codex-native replacement for the original Claude Code `/code-review` workflow.
metadata:
  short-description: Review implementation code
---

# Codex Game Studios Code Review

This skill is read-only. It prioritizes bugs, behavioral regressions,
architecture violations, missing tests, and implementation risks.

## Inputs To Read

- Target files or directories.
- `AGENTS.md` and relevant directory `AGENTS.md`.
- `.claude/docs/technical-preferences.md`.
- Relevant `.claude/rules/*.md` based on path.
- Referenced story file, if provided or inferable.
- Referenced ADRs.
- Relevant GDDs.
- Existing tests.
- Original source workflow, only if more detail is needed:
  `.claude/skills/code-review/SKILL.md`.

## Review Areas

- ADR compliance: forbidden patterns, drift, or missing decision linkage.
- Standards compliance: doc comments, file structure, data-driven values,
  dependency injection, no hidden singletons for game state.
- Architecture: layer separation, dependency direction, no circular ownership,
  UI does not own core state.
- SOLID/testability: seams for tests, no fat interfaces, no untestable hidden
  state.
- Game-specific risks: delta time, hot-path allocations, null/empty states,
  resource cleanup, thread safety, save/load correctness.
- Engine risks: API compatibility against `docs/engine-reference/`.
- Test coverage: acceptance criteria have unit/integration/manual evidence as
  appropriate.

## Output

Follow code review style:

- Findings first, ordered by severity.
- Include file and line references where possible.
- Avoid long summaries before findings.

Verdicts:

- `APPROVED`: no blocking findings.
- `APPROVED WITH SUGGESTIONS`: only non-blocking improvements.
- `CHANGES REQUIRED`: bugs, architecture violations, missing required tests, or
  story acceptance gaps.

If no findings, say so and identify residual risks or testing gaps.

Do not edit files unless the user explicitly asks to fix findings.
