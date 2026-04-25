---
name: cgs-reverse-document
description: Use to generate Codex Game Studios design, architecture, or concept documentation from existing implementation or prototypes, separating observed behavior from clarified intent and writing reverse-documented files only after approval. This is the Codex-native replacement for the original Claude Code `/reverse-document` workflow.
metadata:
  short-description: Document existing implementation
---

# Codex Game Studios Reverse Document

This skill works backwards from code or prototypes to produce missing planning
documents. It must not infer intent without asking.

## Modes

Use:

- `design [path]`: generate a system GDD from gameplay/UI implementation.
- `architecture [path]`: generate an ADR or architecture note from core code.
- `concept [path]`: generate a concept document from a prototype.

If type or path is missing, ask for both.

## Inputs To Read

- target file or directory.
- relevant existing GDDs, ADRs, quick specs, and prototypes.
- `.claude/docs/technical-preferences.md`.
- templates if present under `templates/`.
- Original source workflow, only if more detail is needed:
  `.claude/skills/reverse-document/SKILL.md`.

## Analyze Implementation

For design docs, identify:

- mechanics, rules, formulas, gameplay values.
- states and edge cases handled in code.
- dependencies and system interactions.

For architecture docs, identify:

- patterns, dependencies, coupling, technical decisions.
- constraints, tradeoffs, performance characteristics.

For concepts, identify:

- core mechanic, player fantasy, emergent patterns.
- what worked, what failed, and feasibility notes.

## Clarify Intent

Before drafting, show findings and ask about unclear intent:

- why a resource exists.
- whether a mechanic is core or supporting.
- whether a scaling behavior is intentional.
- whether an architecture pattern is deliberate or legacy.

Separate observed behavior from user-confirmed intent.

## Draft

Draft the appropriate document with:

- current behavior.
- clarified intent.
- missing or partial areas.
- risks and follow-up work.
- reverse-documentation metadata.

Use `status: reverse-documented`, source path, date, and verification note in
the document header when writing.

## Write Output

Show the draft first. After approval or explicit write request, write to the
appropriate location:

- `design/gdd/[system-name].md`
- `docs/architecture/[decision-name].md`
- `prototypes/[name]/CONCEPT.md` or `design/concepts/[name].md`

## Completion

Finish with:

- output path if written.
- intent areas confirmed.
- incomplete sections.
- recommended follow-up: balance check, ADR, design review, or implementation
  cleanup.
