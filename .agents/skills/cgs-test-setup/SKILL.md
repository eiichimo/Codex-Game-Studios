---
name: cgs-test-setup
description: Use to scaffold Codex Game Studios test infrastructure for the configured engine, including test directories, runner notes, baseline README, and CI workflow guidance. This is the Codex-native replacement for the original Claude Code `/test-setup` workflow.
metadata:
  short-description: Scaffold test infrastructure
---

# Codex Game Studios Test Setup

This skill scaffolds automated and manual testing infrastructure. Run once
during Technical Setup before the first sprint.

## Inputs To Read

- `.claude/docs/technical-preferences.md` for engine, language, and test
  framework.
- Existing `tests/` layout.
- Existing `.github/workflows/`.
- Engine reference `VERSION.md`.
- Original source workflow, only if more detail is needed:
  `.claude/skills/test-setup/SKILL.md`.

Stop if engine is not configured unless the user asks for engine-agnostic
placeholders.

## Plan

Propose files before writing:

- `tests/README.md`.
- `tests/unit/`.
- `tests/integration/`.
- `tests/smoke/`.
- `tests/evidence/`.
- Engine-specific runner notes or placeholders.
- `.github/workflows/tests.yml` when the engine/test runner can be specified
  safely.

Never overwrite existing tests. Use force only if the user explicitly asks and
understands the replacement.

## Engine Defaults

- Godot: GdUnit4 runner notes and `tests/gdunit4_runner.gd` if appropriate.
- Unity: EditMode and PlayMode test folders, Unity Test Framework notes.
- Unreal: Automation Test README and command notes.
- Unknown: generic structure only.

## Write Output

After approval, create missing directories/files. Prefer placeholders and
documentation over brittle CI commands when local engine setup is unknown.

## Completion

Finish with:

- Files created.
- Files skipped because they already existed.
- Manual setup still required.
- Test command or "not configured yet" reason.
