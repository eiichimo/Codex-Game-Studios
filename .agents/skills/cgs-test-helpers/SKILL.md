---
name: cgs-test-helpers
description: Use to create Codex Game Studios test helper libraries for the configured engine and systems, including assertion utilities, factories, mocks, and scene/test setup helpers. This is the Codex-native replacement for the original Claude Code `/test-helpers` workflow.
metadata:
  short-description: Generate test helper utilities
---

# Codex Game Studios Test Helpers

This skill creates `tests/helpers/` utilities that reduce boilerplate in
gameplay, integration, and UI tests.

## Modes

- `scaffold`: base helper library only.
- `[system-name]`: helpers for one system.
- `all`: helpers for systems with existing tests.

## Inputs To Read

- `.claude/docs/technical-preferences.md`.
- Existing `tests/**/*_test.*` samples.
- `design/gdd/systems-index.md`.
- In-scope GDDs.
- `docs/architecture/tr-registry.yaml`, if present.
- Original source workflow, only if more detail is needed:
  `.claude/skills/test-helpers/SKILL.md`.

Stop if engine is not configured unless the user requests generic helpers.

## Helper Types

Generate only helpers that match the project:

- Assertions for formula bounds, state, events/signals, and components.
- Factories for minimal test objects, entities, resources, or data configs.
- Mocks/stubs for dependencies.
- Scene or integration test setup utilities.
- Manual evidence templates when UI/Visual stories dominate.

Do not invent project-specific APIs that do not exist. If source code is absent,
create conservative placeholders and TODOs.

## Write Output

Before writing, show proposed helper files. After approval, create
`tests/helpers/` and missing helper files. Do not overwrite existing helpers
without explicit approval.

## Completion

Finish with:

- Helper files created.
- Systems covered.
- Assumptions and TODOs.
- Example import/use line for the configured engine/language.
