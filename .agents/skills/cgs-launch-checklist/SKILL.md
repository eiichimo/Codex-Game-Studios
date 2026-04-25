---
name: cgs-launch-checklist
description: Use to generate a Codex Game Studios launch readiness checklist across code, content, QA, store, marketing, community, infrastructure, legal, operations, and go/no-go sign-offs. This is the Codex-native replacement for the original Claude Code `/launch-checklist` workflow.
metadata:
  short-description: Check launch readiness
---

# Codex Game Studios Launch Checklist

This skill validates launch readiness across departments. It is broader than
`cgs-release-checklist` and should be used near final launch or for launch
dry-runs.

## Modes

- `launch date`: generate a checklist for a concrete launch date.
- `dry-run`: generate the same analysis without writing files or creating
  sign-off records.

If the date or mode is missing, ask unless project docs make it unambiguous.

## Inputs To Read

- `AGENTS.md` and relevant project instructions.
- Latest milestone under `production/milestones/`.
- Existing release checklists under `production/releases/`.
- `design/live-ops/content-calendar.md`, if present.
- QA, regression, smoke, soak, and bug/risk records under `production/`.
- Store, legal, community, and support docs, if present.
- `.claude/docs/technical-preferences.md`.
- Original source workflow, only if more detail is needed:
  `.claude/skills/launch-checklist/SKILL.md`.

## Scan For Launch Risks

Search for:

- `TODO`, `FIXME`, and `HACK`.
- debug output such as `console.log`, `print()`, and temporary debug flags.
- placeholder assets and names such as `placeholder`, `temp_`, and `WIP_`.
- hardcoded test/dev values such as `localhost`, test credentials, or dev-only
  feature flags.
- missing launch evidence in QA, release, or milestone docs.

## Checklist Sections

Generate:

- Code Readiness: build health, tests, performance, version/tag, crash
  reporting, production flags.
- Content Readiness: final assets, audio, localization, credits, complete game
  flow, save/load, achievements.
- QA: regression, zero critical blockers, soak/stress/edge-case testing,
  certification, accessibility.
- Store and Distribution: copy, screenshots, trailer, key art, pricing,
  ratings, system requirements.
- Legal: EULA, privacy, third-party licenses, music rights, trademark/IP,
  regional compliance.
- Infrastructure: servers, backups, CDN, monitoring, alerting, analytics.
- Community and Marketing: guidelines, moderation, FAQ, known issues,
  launch posts, press keys.
- Operations: on-call, incident response, rollback, hotfix pipeline, launch
  war room, day-one plan.
- Go / No-Go Decision: `READY`, `CONDITIONAL`, or `NOT READY`.
- Sign-Offs Required: creative, technical, QA, producer, release owner.

## Output

Present:

- Target launch date or `DRY RUN`.
- Department-by-department readiness.
- Blocking items.
- Conditional risks.
- Missing evidence.
- Full checklist.

Do not treat unchecked or undocumented launch items as complete.

## Write Output

In `dry-run`, do not write unless explicitly requested.

Otherwise, after approval or an explicit write request, create
`production/releases/` and write
`production/releases/launch-checklist-[date].md`.

## Completion

Finish with:

- Checklist path if written.
- Go/no-go decision.
- Launch blockers.
- Recommended next step: release checklist, gate check, or hotfix readiness.
