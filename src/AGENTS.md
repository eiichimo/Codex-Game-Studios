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

## Path-Specific Standards

### `src/gameplay/**`

- Keep all gameplay values in external config/data files.
- Use delta time for all time-dependent calculations.
- Do not reference UI code directly; use events/signals.
- State machines need explicit transition tables and documented states.
- Document which GDD each feature implements.

### `src/core/**` and engine/framework code

- Avoid allocations in hot paths; pre-allocate, pool, and reuse.
- Engine/framework code must not depend on gameplay code.
- Profile before and after optimizations and record measurements.
- Public interface changes need migration guidance.
- Resource cleanup must be deterministic where the engine/language supports it.

### `src/ai/**`

- Keep AI parameters tunable from data.
- Make AI debuggable with state, path, perception, or decision visualization.
- Prefer utility AI or behavior trees over hardcoded if/else chains for complex
  behavior.
- Log state-machine transitions for debugging.
- Keep per-frame AI work within the documented budget when one exists.

### `src/networking/**`

- Server is authoritative for gameplay-critical state.
- Version all network messages.
- Validate packet sizes, field ranges, and client-provided values.
- Document replication strategy, frequency, interpolation, and bandwidth budget.
- Handle disconnects, reconnects, and host migration where applicable.

### `src/ui/**`

- UI displays state and emits commands/events; it must not own game state.
- All player-facing text goes through localization.
- Support keyboard/mouse and gamepad for interactive elements.
- Animations must be skippable and respect motion/accessibility preferences.
- Route UI sounds through the audio event system.
- Test minimum and maximum supported resolutions.

## Architecture

Every new core system should map back to a GDD and, when it changes technical
structure, an ADR in `docs/architecture/`.

## Tests

Tests live in `tests/`, not in `src/`. If no test framework exists yet, propose
or scaffold one based on the selected engine before adding broad production
code.
