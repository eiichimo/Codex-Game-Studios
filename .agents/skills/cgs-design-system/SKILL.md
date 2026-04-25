---
name: cgs-design-system
description: Use to author or retrofit a single Codex Game Studios system GDD section-by-section, using the game concept, systems index, dependencies, and engine constraints. This is the Codex-native replacement for the original Claude Code `/design-system` workflow.
metadata:
  short-description: Write one system GDD
---

# Codex Game Studios Design System

This skill writes or retrofits one system GDD in `design/gdd/`. It should be
used after the game concept and systems index exist.

## Modes

- New GDD: user names a system, such as "combat" or "inventory".
- Next GDD: user asks to design the next system from the systems index.
- Retrofit: user provides an existing GDD path and wants missing sections filled
  without overwriting existing content.

## Inputs To Read

- `design/gdd/game-concept.md`; required.
- `design/gdd/systems-index.md`; required unless the user explicitly accepts an
  off-index GDD.
- `design/registry/entities.yaml`, if present.
- `docs/consistency-failures.md`, if present.
- `.claude/docs/technical-preferences.md`.
- Relevant `docs/engine-reference/<engine>/` files, if an engine is configured.
- Relevant upstream/downstream GDDs listed in the systems index.
- `.claude/docs/templates/game-design-document.md` for the output shape.
- Original source workflow, only if more detail is needed:
  `.claude/skills/design-system/SKILL.md`.

If required concept or systems index files are missing, stop and recommend the
appropriate prior workflow.

## Select The Target System

If no system is provided:

1. Read `design/gdd/systems-index.md`.
2. Identify the highest-priority `Not Started` system.
3. Ask whether to design it or choose a different system.

Normalize new GDD filenames to kebab-case, for example `combat-system.md`.

For retrofit mode:

- Read the existing GDD.
- Identify the 8 required sections.
- List complete, missing, and placeholder-only sections.
- Ask before filling only the missing or incomplete sections.
- Never overwrite complete existing content.

## Context Summary

Before designing, present a concise brief:

- System name, priority, and layer.
- Upstream dependencies and whether their GDDs exist.
- Downstream dependents and expectations.
- Existing decisions to respect.
- Relevant pillars and anti-pillars.
- Relevant registry facts that must not be contradicted.
- Engine/domain constraints or missing engine setup.

If dependencies are undesigned, either recommend designing them first or define
explicit provisional contracts.

## Required GDD Sections

Author these sections in order:

1. Overview
2. Player Fantasy
3. Detailed Rules
4. Formulas
5. Edge Cases
6. Dependencies
7. Tuning Knobs
8. Acceptance Criteria

Also include a short Game Feel subsection when the system affects moment-to-
moment player experience.

## Section Workflow

For each section:

1. Explain what the section must decide.
2. Surface constraints from concept, dependencies, engine docs, and registry.
3. Ask only the decisions that are actually needed.
4. Present a concise draft.
5. Ask whether to write or revise.
6. Write the approved section before moving on.

For simple low-risk sections, make reasonable assumptions and mark them as
assumptions instead of over-questioning the user.

## Write Output

For a new GDD:

- Create the skeleton after the user confirms the target system.
- Fill sections incrementally.
- Use `Status: In Design` until the user accepts the full GDD.

For retrofit:

- Edit only missing or placeholder sections.
- Preserve existing authored content.

After all sections are complete:

- Summarize unresolved assumptions.
- Recommend a design review.
- Update `design/gdd/systems-index.md` status only if the user approves.

## Completion

Finish with:

- GDD path.
- Sections completed.
- Open assumptions or conflicts.
- Next recommended Codex request: design review, next system, or systems index
  status update.
