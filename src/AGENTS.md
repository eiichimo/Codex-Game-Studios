# Source Directory Instructions

Follow these standards when writing or editing game code.

## Engine APIs

Check `docs/engine-reference/` before using engine APIs. Do not guess signatures
for recently changed Godot, Unity, or Unreal APIs.

## Code Quality

- Public APIs require doc comments.
- Gameplay values must be data-driven and tunable.
- Prefer dependency injection and explicit ownership over global singletons.
- Keep UI code from owning core game state.
- Keep networking server-authoritative when multiplayer is present.
- Add tests for formulas, edge cases, and gameplay rules.

## Architecture

Every new core system should map back to a GDD and, when it changes technical
structure, an ADR in `docs/architecture/`.

## Tests

Tests live in `tests/`, not in `src/`. If no test framework exists yet, propose
or scaffold one based on the selected engine before adding broad production
code.
