---
name: cgs-create-control-manifest
description: Use to generate the Codex Game Studios control manifest from Accepted ADRs, technical preferences, and engine reference constraints. This is the Codex-native replacement for the original Claude Code `/create-control-manifest` workflow.
metadata:
  short-description: Generate programmer rules manifest
---

# Codex Game Studios Create Control Manifest

This skill generates `docs/architecture/control-manifest.md`: the flat,
actionable rules sheet programmers use during story implementation.

## Inputs To Read

- Accepted `docs/architecture/adr-*.md` files.
- `.claude/docs/technical-preferences.md`.
- `docs/engine-reference/<engine>/VERSION.md`.
- `docs/engine-reference/<engine>/deprecated-apis.md`.
- `docs/engine-reference/<engine>/current-best-practices.md`, if present.
- Original source workflow, only if more detail is needed:
  `.claude/skills/create-control-manifest/SKILL.md`.

Skip Proposed, Deprecated, and Superseded ADRs.

## Extract Rules

From Accepted ADRs, extract:

- Required patterns.
- Forbidden approaches.
- Performance guardrails.
- Engine API constraints.
- Layer-specific rules.
- Source ADR for every rule.

From technical preferences, extract:

- Naming conventions.
- Performance budgets.
- Approved libraries/addons.
- Forbidden patterns.

From engine references, extract:

- Deprecated APIs as forbidden entries.
- Current best practices as required entries when directly applicable.

Do not invent unsourced rules.

## Write Output

Before writing, present rule counts by layer:

- Foundation.
- Core.
- Feature.
- Presentation.
- Global.

After approval, write `docs/architecture/control-manifest.md` with:

- Engine and version.
- Last Updated.
- Manifest Version.
- ADRs covered.
- Required patterns.
- Forbidden approaches.
- Performance guardrails.
- Naming conventions.
- Approved libraries.
- Forbidden APIs.

## Completion

Finish with:

- Manifest path.
- ADRs covered.
- ADRs skipped and why.
- Any missing technical preference values.
- Next recommended Codex request: create stories or run story readiness.
