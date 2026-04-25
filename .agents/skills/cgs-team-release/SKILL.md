---
name: cgs-team-release
description: Use to coordinate a Codex Game Studios release from version planning through release candidate, quality gates, go/no-go, deployment checklist, communication, and post-release monitoring. This is the Codex-native replacement for the original Claude Code `/team-release` workflow.
metadata:
  short-description: Coordinate a release
---

# Codex Game Studios Team Release

This skill coordinates release work. It must not tag, deploy, publish, or merge
release changes without explicit user approval.

Do not spawn subagents unless the user explicitly asks for delegation or
parallel agent work.

## Version

Require a version number or infer it from milestone/session files. If no version
is discoverable, ask for one. Do not default to a hardcoded version.

## Roles To Simulate Or Delegate

- Producer: release authorization and go/no-go.
- Release manager: branch, versioning, checklist, changelog.
- QA lead: regression, bug severity, quality sign-off.
- DevOps engineer: build artifacts, CI, deployment readiness.
- Security engineer: online/multiplayer/player-data risk.
- Analytics engineer: telemetry events and dashboards.
- Community manager: patch notes and announcement readiness.
- Network programmer: multiplayer stability, if applicable.

## Inputs To Read

- `production/session-state/active.md`.
- `production/milestones/`, release docs, and sprint status.
- `production/qa/` sign-off reports, bugs, smoke/regression results.
- `docs/`, ADRs, security notes, and telemetry docs.
- Build/deployment scripts and CI config.
- `CHANGELOG.md` or existing release notes.
- Original source workflow, only if more detail is needed:
  `.claude/skills/team-release/SKILL.md`.

## Pipeline

1. Release planning: confirm scope, deferred items, target date, and release
   authorization.
2. Release candidate: identify candidate commit/branch, version files, and
   release checklist needs. Ask before editing version files or branches.
3. Quality gate: verify regression status, open S1/S2 bugs, artifact builds,
   CI status, security needs, and multiplayer stability if relevant.
4. Localization, performance, analytics: check string status, perf budgets, and
   telemetry readiness.
5. Go/no-go: produce `GO`, `GO WITH CONDITIONS`, or `NO-GO` with rationale. If
   `NO-GO`, stop before tagging or deployment.
6. Deployment preparation: only with explicit approval, prepare changelog,
   patch notes, staging smoke plan, release tag checklist, and rollback plan.
7. Post-release: define 48-hour monitoring, bug triage, community monitoring,
   analytics checks, and retrospective triggers.

## Hard Stops

Stop before release execution if:

- S1/S2 bugs are open.
- Required QA sign-off is missing.
- Build artifacts are missing or unreproducible.
- Security or network blockers exist for online/multiplayer features.
- User has not explicitly approved tag/deploy/publish actions.

## Completion

Finish with:

- Version and candidate source.
- Scope and deferred items.
- Quality gate results.
- Go/no-go verdict.
- Release artifacts/checklists status.
- Deployment and monitoring plan.
- Next request: release checklist, changelog, patch notes, or hotfix planning.
