# Docs Directory Instructions

Follow these standards when authoring or editing documentation files.

## Architecture Decisions

Use `.claude/docs/templates/architecture-decision-record.md` as the source
template until a Codex-native template exists.

ADR files belong in `docs/architecture/` and must include:

- Title
- Status
- Context
- Decision
- Consequences
- ADR Dependencies
- Engine Compatibility
- GDD Requirements Addressed

Use the lifecycle `Proposed` -> `Accepted` -> `Superseded`. Do not treat a
`Proposed` ADR as implementation-ready unless the user explicitly accepts the
risk.

## Traceability

- `docs/architecture/tr-registry.yaml` stores stable requirement IDs.
- Never renumber existing IDs; append new IDs instead.
- Stories should reference relevant GDD sections, ADRs, and TR IDs.

## Engine Reference

Engine references in `docs/engine-reference/` are version-pinned snapshots.
Check them before suggesting engine APIs, especially for Godot, Unity, and
Unreal versions newer than model training data.
