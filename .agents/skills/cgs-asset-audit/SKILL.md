---
name: cgs-asset-audit
description: Use to run a read-only Codex Game Studios asset compliance audit across art, audio, VFX, shaders, and data files, checking naming, formats, size budgets, orphaned files, missing references, and pipeline standard violations. This is the Codex-native replacement for the original Claude Code `/asset-audit` workflow.
metadata:
  short-description: Audit asset compliance
---

# Codex Game Studios Asset Audit

This skill is read-only. It reports asset pipeline problems without modifying
files.

## Scope

Accept a category or `all`:

- `art`
- `audio`
- `vfx`
- `shaders`
- `data`
- `all`

Default to `all` when unspecified.

## Inputs To Read

- `design/art/art-bible.md`, if present.
- `design/assets/asset-manifest.md`, if present.
- `design/assets/specs/*.md`, if present.
- `.claude/docs/technical-preferences.md`.
- Relevant asset directories:
  - `assets/art/**/*`
  - `assets/audio/**/*`
  - `assets/vfx/**/*`
  - `assets/shaders/**/*`
  - `assets/data/**/*`
- Source references to assets under `src/`, `design/`, and config files.
- Original source workflow, only if more detail is needed:
  `.claude/skills/asset-audit/SKILL.md`.

## Checks

Check:

- naming conventions: lowercase, underscores, category-specific patterns.
- file format compliance.
- size, duration, resolution, and budget issues when data is available.
- data validity for JSON/YAML-like files.
- orphaned assets with no references.
- missing assets referenced by code or docs.
- spec/manifest drift.

If dimensions, duration, or metadata cannot be read with available tools, report
the check as inconclusive rather than guessing.

## Report

Generate:

- Summary: scanned count, naming violations, size violations, format
  violations, orphaned assets, missing assets, overall health.
- Naming Violations table.
- Size or Budget Violations table.
- Format Violations table.
- Orphaned Assets table.
- Missing Assets table.
- Spec/Manifest Drift.
- Recommendations.
- Verdict: `COMPLIANT`, `WARNINGS`, or `NON-COMPLIANT`.

## Completion

Finish with:

- audit verdict.
- top blockers.
- highest-value cleanup actions.
- next recommended Codex request: content audit, asset spec, or targeted fixes.
