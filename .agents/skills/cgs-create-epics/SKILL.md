---
name: cgs-create-epics
description: Use to translate approved Codex Game Studios GDDs and architecture into epic folders and EPIC.md files, one epic per architectural module or system. This is the Codex-native replacement for the original Claude Code `/create-epics` workflow.
metadata:
  short-description: Create implementation epics
---

# Codex Game Studios Create Epics

This skill creates `production/epics/[epic-slug]/EPIC.md` files. Epics define
bounded implementation scope; they do not create stories.

## Modes

- All eligible systems.
- A layer: Foundation, Core, Feature, Presentation, or Polish.
- One system or module.

## Inputs To Read

- `design/gdd/systems-index.md`.
- In-scope system GDDs under `design/gdd/`.
- `docs/architecture/architecture.md`.
- Relevant `docs/architecture/adr-*.md`.
- `docs/architecture/control-manifest.md`, if present.
- `docs/architecture/tr-registry.yaml`, if present.
- Engine version from `.claude/docs/technical-preferences.md` or
  `docs/engine-reference/<engine>/VERSION.md`.
- Original source workflow, only if more detail is needed:
  `.claude/skills/create-epics/SKILL.md`.

Stop if systems index, GDDs, or architecture are missing unless the user
explicitly accepts placeholder epics.

## Epic Definition

For each in-scope system/module, determine:

- Layer.
- GDD path.
- Architecture module.
- Governing ADRs.
- Engine risk from ADRs.
- TR/GDD requirements covered.
- Untraced requirements or missing ADRs.
- Dependencies on other epics.

Warn when requirements lack Accepted ADR coverage. The epic may be created, but
stories tied to unaccepted or missing ADRs should be marked blocked.

## Write Output

Before writing, present:

- Epic name.
- Scope summary.
- Governing ADRs.
- Requirement coverage.
- Gaps and risks.

After approval, create:

- `production/epics/[epic-slug]/EPIC.md`.
- Update or create `production/epics/index.md`.

Minimum `EPIC.md` sections:

- Overview.
- Layer and architecture module.
- GDD link.
- Governing ADRs.
- GDD/TR requirements.
- Dependencies.
- Definition of Done.
- Story creation status.
- Next step: create stories.

## Completion

Finish with:

- Epics written.
- Epics skipped or blocked.
- Requirements lacking ADR coverage.
- Next recommended Codex request: create stories for one epic.
