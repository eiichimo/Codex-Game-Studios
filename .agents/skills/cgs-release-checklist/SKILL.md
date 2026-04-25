---
name: cgs-release-checklist
description: Use to generate a Codex Game Studios pre-release validation checklist for PC, console, mobile, or all target platforms, including code health, build verification, QA gates, store metadata, launch readiness, blockers, and sign-offs. This is the Codex-native replacement for the original Claude Code `/release-checklist` workflow.
metadata:
  short-description: Build a release checklist
---

# Codex Game Studios Release Checklist

This skill creates a pre-release checklist for a version or target platform. It
does not certify a release by itself; it makes release blockers explicit.

## Scope

- `pc`: PC distribution checks.
- `console`: console certification and platform behavior checks.
- `mobile`: mobile store and device checks.
- `all`: all relevant platform sections.

Default to `all` if platform scope is not specified. If version is missing,
infer from milestone/release docs when obvious; otherwise ask.

## Inputs To Read

- `AGENTS.md` and relevant project instructions.
- Latest milestone under `production/milestones/`, if present.
- Existing files under `production/releases/`, if present.
- QA plans, smoke checks, regression results, and test logs, if present.
- Open bug/risk documents under `production/`, if present.
- `.claude/docs/technical-preferences.md`.
- Original source workflow, only if more detail is needed:
  `.claude/skills/release-checklist/SKILL.md`.

## Scan For Blockers

Use repository search to count and sample:

- `TODO`
- `FIXME`
- `HACK`
- placeholder or WIP content markers
- known critical/major bugs
- missing or stale QA evidence

Treat `FIXME`, critical bugs, failed tests, and missing release evidence as
potential blockers unless project docs explicitly accept the risk.

## Checklist Sections

Generate:

- Codebase Health: TODO/FIXME/HACK counts and top locations.
- Build Verification: clean builds, warnings, versioning, included assets,
  reproducibility.
- Quality Gates: critical bug status, regression, performance, soak, smoke,
  and QA sign-off.
- Content Complete: placeholders, player-facing text, localization readiness,
  audio, credits, licenses.
- Platform Requirements: PC, console, and/or mobile requirements based on
  scope.
- Store / Distribution: metadata, screenshots, trailers, ratings, pricing,
  legal, third-party attribution.
- Launch Readiness: telemetry, crash reporting, day-one patch, on-call,
  support, rollback.
- Go / No-Go: `READY`, `CONDITIONAL`, or `NOT READY` with rationale.
- Sign-Offs Required: QA, technical, production, creative, and release owner.

## Output

Present:

- Version/platform.
- Total checklist items.
- Known blockers.
- Conditional risks.
- Go/no-go recommendation.
- Full checklist.

Do not mark uncertain items as complete. Use `[ ]` until evidence exists.

## Write Output

After approval or an explicit write request, create `production/releases/` and
write `production/releases/release-checklist-[version].md`.

## Completion

Finish with:

- Checklist path if written.
- Go/no-go recommendation.
- Blocking items to resolve first.
- Next recommended Codex request: gate check, launch checklist, or patch notes.
