---
name: cgs-qa-plan
description: Use to generate a Codex Game Studios QA plan for a sprint, feature, epic, or story by classifying stories, mapping automated and manual evidence, defining smoke scope, and documenting story-level test requirements. This is the Codex-native replacement for the original Claude Code `/qa-plan` workflow.
metadata:
  short-description: Create a QA test plan
---

# Codex Game Studios QA Plan

This skill creates `production/qa/qa-plan-[scope]-[date].md`. Run it before
implementation begins so developers know what evidence each story needs.

## Scope

- `sprint`: current sprint stories.
- `feature: [system]`: stories for a system/feature.
- `story: [path]`: one story.
- `epic: [slug]`: all stories in one epic.

If scope is missing, infer only when unambiguous; otherwise ask.

## Inputs To Read

- `production/sprint-status.yaml` and latest `production/sprints/*.md`.
- `production/epics/**/*.md` stories and `EPIC.md` files.
- Referenced GDD Acceptance Criteria and Formulas sections.
- `design/gdd/systems-index.md`.
- `docs/architecture/control-manifest.md`, if present.
- `.claude/docs/technical-preferences.md`.
- Original source workflow, only if more detail is needed:
  `.claude/skills/qa-plan/SKILL.md`.

## Classify Stories

Use existing `Type:` when present; otherwise infer:

- Logic: calculations, rules, state transitions, AI decisions.
- Integration: two or more systems, save/load, events, network sync.
- Visual/Feel: animation, VFX, audio sync, responsiveness, subjective feel.
- UI: screens, menus, HUD, controls, accessibility.
- Config/Data: balance/config file changes only.

Mixed stories get the highest-risk type and a note.

## Plan Contents

Generate:

- Test Summary table.
- Automated Tests Required with suggested paths.
- Manual QA Checklist.
- Smoke Test Scope.
- Playtest Requirements.
- Definition of Done for the scope.
- Gaps: missing GDD, missing story type, unclear acceptance criteria, missing
  evidence path.

Do not invent requirements beyond story ACs and GDD formulas. If information is
missing, flag it.

## Write Output

Show summary first. After approval, create `production/qa/` and write the QA
plan. Do not truncate generated plan content.

## Completion

Finish with:

- QA plan path.
- Stories covered.
- Required automated tests.
- Manual evidence requirements.
- Next recommended Codex request: smoke check after implementation or story
  readiness before implementation.
