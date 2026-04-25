---
name: cgs-architecture-decision
description: Use to create or retrofit an Architecture Decision Record for Codex Game Studios, including status, context, decision, consequences, dependencies, engine compatibility, and GDD requirement traceability. This is the Codex-native replacement for the original Claude Code `/architecture-decision` workflow.
metadata:
  short-description: Create or retrofit an ADR
---

# Codex Game Studios Architecture Decision

This skill creates or retrofits ADRs in `docs/architecture/`.

## Modes

- New ADR: user provides a technical decision title or problem.
- Guided ADR: user asks what ADR is needed next.
- Retrofit: user provides an existing ADR path and wants missing sections added
  without overwriting existing content.

## Inputs To Read

- `.claude/docs/technical-preferences.md`.
- Relevant engine reference docs under `docs/engine-reference/<engine>/`.
- `docs/architecture/architecture.md`, if present.
- Existing `docs/architecture/adr-*.md`.
- `docs/registry/architecture.yaml`, if present.
- Relevant GDDs under `design/gdd/`.
- `docs/architecture/tr-registry.yaml`, if present.
- `.claude/docs/templates/architecture-decision-record.md`.
- Original source workflow, only if more detail is needed:
  `.claude/skills/architecture-decision/SKILL.md`.

If no engine is configured, ask whether to configure the engine first or proceed
with an explicitly engine-agnostic ADR.

## New ADR Workflow

1. Determine next ADR number from existing `adr-*.md` files.
2. Identify decision domain: Core, Physics, Rendering, UI, Audio, Navigation,
   Animation, Networking, Input, Scripting, Persistence, Build, or Tools.
3. Read relevant GDD and architecture context.
4. Read engine reference docs for the domain and flag deprecated/post-cutoff
   APIs.
5. Present assumptions before drafting:
   - Problem.
   - Alternatives.
   - Recommended decision.
   - Dependencies.
   - GDD requirements addressed.
   - Engine risk.

Ask the user to confirm or adjust assumptions before writing.

## Required ADR Sections

- Status: Proposed by default unless the user explicitly chooses Accepted.
- Date.
- Context.
- Decision Drivers.
- Options Considered.
- Decision.
- Consequences.
- ADR Dependencies.
- Engine Compatibility.
- GDD Requirements Addressed.
- Verification Plan.

## Retrofit Workflow

For an existing ADR:

- Detect missing sections.
- Report existing sections that will not be touched.
- Ask before appending missing sections.
- Never overwrite existing authored sections.
- Add `Status`, `ADR Dependencies`, `Engine Compatibility`, and
  `GDD Requirements Addressed` first because stories depend on them.

## Write Output

Before editing, show the target path and summary. After approval, write:

`docs/architecture/adr-[NNNN]-[slug].md`

For status:

- `Proposed`: safe for discussion, blocks implementation stories.
- `Accepted`: implementation-ready.
- `Superseded`: must name replacement ADR.
- `Deprecated`: retained for history, not new work.

## Completion

Finish with:

- ADR path.
- Status.
- Dependencies.
- GDD/TR IDs addressed.
- Engine risks and verification items.
- Next recommended Codex request: architecture review, control manifest, or epic
  creation.
