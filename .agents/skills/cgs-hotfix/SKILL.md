---
name: cgs-hotfix
description: Use to run a Codex Game Studios emergency hotfix workflow for S1/S2 issues, including severity assessment, hotfix record creation, minimal fix discipline, targeted validation, approval tracking, rollback planning, and backport reminders. This is the Codex-native replacement for the original Claude Code `/hotfix` workflow.
metadata:
  short-description: Manage an emergency hotfix
---

# Codex Game Studios Hotfix

This skill is for urgent S1/S2 production issues. It bypasses normal sprint
flow only with an audit trail and a minimal, testable fix.

## Severity Gate

Classify the issue:

- `S1 Critical`: game unplayable, data loss, security issue, broken launch.
- `S2 Major`: significant feature broken with player impact; workaround exists.
- `S3 or lower`: recommend normal bug triage instead of hotfix.

If severity is unclear, ask for impact, affected version/platform, repro steps,
and known workaround.

## Inputs To Read

- Bug report or user-provided incident description.
- Current release/milestone docs under `production/`.
- Existing hotfix records under `production/hotfixes/`.
- Relevant source, tests, QA plans, smoke checks, and regression suites.
- Git status and branch/tag context before branch or commit operations.
- Original source workflow, only if more detail is needed:
  `.claude/skills/hotfix/SKILL.md`.

## Hotfix Record

Draft:

- short description.
- date and affected version/platform.
- severity and reporter/source.
- player impact.
- root cause placeholder.
- minimal fix plan.
- targeted validation plan.
- approval checklist.
- rollback plan.
- backport targets.

After approval or explicit write request, create `production/hotfixes/` and
write `production/hotfixes/hotfix-[date]-[slug].md`.

## Branch And Implementation

Before changing code:

- Check `git status --short --branch`.
- Identify the release base or main branch/tag.
- Create a hotfix branch only when the user authorizes it.
- Keep the fix minimal. Do not refactor, clean up unrelated code, or add
  features.
- Add or update only tests that prove the fix and guard the adjacent regression.

If the fix appears to exceed roughly four focused hours or touches core
architecture, stop and recommend escalation before continuing.

## Validation And Approvals

Run the smallest useful validation set:

- targeted automated tests for the affected area.
- adjacent regression tests.
- smoke check for the hotfix build when available.
- manual repro verification when automation cannot cover it.

Do not assume Claude named subagents exist. Track sign-offs in the hotfix
record or use user-approved Codex delegation only when the user explicitly asks
for parallel agent work.

Required approvals:

- technical review.
- QA/regression verification.
- release/producer approval.

## Deployment Summary

When ready, output:

- severity.
- root cause.
- minimal fix.
- validation performed.
- approvals.
- rollback plan.
- branches/tags to merge into.
- bug record update needed.

Hotfixes must merge to both the release branch and development branch unless
the project explicitly documents a different policy.

## Post-Deploy

After deployment:

- verify the original repro against the deployed build.
- update and close the bug only after verification.
- schedule a post-incident review within 48 hours.
- add regression coverage to the normal suite if the hotfix introduced only
  temporary targeted coverage.

## Completion

Finish with:

- hotfix record path if written.
- branch name if created.
- files changed.
- validations run and result.
- remaining approvals or deployment blockers.
