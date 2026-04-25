---
name: cgs-scope-check
description: Use to run a read-only Codex Game Studios scope creep review for a feature, sprint, or milestone by comparing the original plan to current implementation, additions, removals, bloat score, risks, and cut/defer recommendations. This is the Codex-native replacement for the original Claude Code `/scope-check` workflow.
metadata:
  short-description: Check scope creep
---

# Codex Game Studios Scope Check

This skill is read-only. It compares original planned scope against the current
state and reports whether scope has drifted.

## Scope

Accept a feature name, sprint number, or milestone name. If missing, ask for the
baseline scope to compare.

## Inputs To Read

- Feature baseline: matching `design/gdd/*.md` or `design/**/*.md`.
- Sprint baseline: matching `production/sprints/*.md`.
- Milestone baseline: matching `production/milestones/*.md`.
- Current sprint status and related epics/stories.
- Git history and changed files for the relevant date range, if available.
- TODO/FIXME/HACK markers related to the scope.
- Original source workflow, only if more detail is needed:
  `.claude/skills/scope-check/SKILL.md`.

If no baseline plan exists, stop and report that scope cannot be measured.

## Compare

Extract:

- original scope items.
- current implemented or in-progress items.
- additions not present in the original plan.
- removals or descopes.
- changes that are justified discovered requirements.
- changes that need producer or creative decision.

Scope creep means additions without matching cuts, timeline extension, or
explicit acceptance.

## Report

Generate:

- Original Scope.
- Current Scope.
- Scope Additions table: addition, source, when, justification, effort.
- Scope Removals table: removed item, reason, impact.
- Bloat Score: original items, current items, added %, removed, net change.
- Risk Assessment: schedule, quality, integration.
- Recommendations: cut, defer, keep, flag.

Verdict:

- `PASS`: net change <= 10%.
- `CONCERNS`: net change > 10% and <= 25%.
- `FAIL`: net change > 25%.

If the item count is misleading, keep the verdict but add a qualitative risk
note.

## Completion

Finish with:

- scope verdict.
- net change.
- top 2-3 cut/defer candidates.
- next recommended Codex request: sprint plan update, estimate, or re-run after
  cuts.
