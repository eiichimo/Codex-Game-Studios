---
name: cgs-create-architecture
description: Use to create or update the Codex Game Studios master architecture document from approved GDDs, systems index, technical preferences, engine reference docs, and existing ADRs. This is the Codex-native replacement for the original Claude Code `/create-architecture` workflow.
metadata:
  short-description: Create the architecture blueprint
---

# Codex Game Studios Create Architecture

This skill creates `docs/architecture/architecture.md`: the whole-game technical
blueprint that ties GDD systems to modules, data flow, API boundaries, and ADR
coverage.

## Inputs To Read

- `.claude/docs/technical-preferences.md`; engine must be configured.
- `docs/engine-reference/<engine>/VERSION.md`, `breaking-changes.md`,
  `deprecated-apis.md`, `current-best-practices.md`, and relevant module docs.
- `design/gdd/game-concept.md`.
- `design/gdd/systems-index.md`.
- Approved or in-scope system GDDs under `design/gdd/`.
- Existing `docs/architecture/adr-*.md`.
- `docs/architecture/tr-registry.yaml`, if present.
- `.claude/docs/templates/technical-design-document.md` and related architecture
  templates, if useful.
- Original source workflow, only if deeper detail is needed:
  `.claude/skills/create-architecture/SKILL.md`.

Stop if no engine is configured. Architecture decisions depend on engine and
version.

## Build Technical Requirements Baseline

Extract technical requirements from GDDs:

- Data structures and ownership.
- Cross-system communication.
- Save/load and persistence.
- Input, UI, audio, VFX, physics, animation, networking, AI, or rendering needs.
- Performance and timing constraints.
- Engine APIs or capabilities implied by design.

Assign stable provisional IDs like `TR-[system]-001` when a registry does not
already provide them.

## Architecture Sections

Draft these sections:

- System Layer Map: Platform, Foundation, Core, Feature, Presentation, Polish.
- Module Ownership: owns, exposes, consumes, and engine APIs used.
- Data Flow: frame update, event/signal path, save/load, initialization order.
- API Boundaries: public contracts, invariants, and caller guarantees.
- Engine Compatibility: version, high-risk domains, deprecated APIs to avoid.
- ADR Coverage: existing ADRs, missing ADRs, and conflicts.
- Traceability: GDD/system requirement to architecture module and ADR status.
- Open Questions and Risks.

Flag post-cutoff engine risks instead of guessing.

## Write Output

Before editing, present:

- GDD count read.
- Requirement count.
- Proposed architecture layers.
- Missing ADRs.
- High-risk engine domains.

Ask whether to write or update `docs/architecture/architecture.md`. After
approval, create `docs/architecture/` if needed and write the document.

Preserve useful existing architecture content. Do not replace an existing
architecture file wholesale unless the user explicitly approves a rewrite.

## Completion

Finish with:

- Architecture path.
- Required ADR list.
- Traceability gaps.
- Next recommended Codex request: create an ADR, review architecture, or create
  the control manifest.
