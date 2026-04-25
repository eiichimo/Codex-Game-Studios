---
name: cgs-milestone-review
description: Use to generate a Codex Game Studios milestone progress review with feature completeness, quality metrics, code health, risk assessment, velocity, scope recommendations, and a go/no-go recommendation. This is the Codex-native replacement for the original Claude Code `/milestone-review` workflow.
metadata:
  short-description: Review milestone readiness
---

# Codex Game Studios Milestone Review

This skill reviews whether a milestone is on track and what scope or quality
risks must be addressed before the deadline.

## Scope And Mode

Accept a milestone name or `current`. If missing, use the most recently modified
file under `production/milestones/` when unambiguous; otherwise ask.

Review modes:

- `solo`: no delegated review; produce the review directly.
- `lean`: default; produce the review without director gate simulation.
- `full`: include a producer-style risk assessment, but only use Codex
  delegation if the user explicitly asks for parallel agent work.

Read `production/review-mode.txt` if mode is not specified.

## Inputs To Read

- Milestone definition under `production/milestones/`.
- Sprint plans, sprint status, and retrospectives under `production/sprints/`
  and `production/retrospectives/`.
- QA plans, bug reports, smoke/regression results, and release records under
  `production/`.
- Risk register under `production/risk-register/`, if present.
- GDDs and architecture docs referenced by milestone scope.
- Git history for the milestone period, if available.
- Original source workflow, only if more detail is needed:
  `.claude/skills/milestone-review/SKILL.md`.

## Analyze

Assess:

- feature completeness: complete, partial, not started.
- acceptance criteria and test evidence status.
- open S1/S2/S3 bugs and release-blocking risks.
- TODO/FIXME/HACK counts and notable locations.
- risk register status and mitigations.
- planned vs completed work across milestone sprints.
- velocity trend and adjusted estimate for remaining work.
- cut candidates that preserve milestone intent.

Do not report a `GO` recommendation if critical evidence is missing or high
severity blockers remain unassigned.

## Review Output

Generate:

- Overview: target date, current date, days remaining, sprints complete.
- Feature Completeness tables.
- Quality Metrics.
- Code Health.
- Risk Assessment.
- Velocity Analysis.
- Scope Recommendations: Protect, At Risk, Cut Candidates.
- Go/No-Go: `GO`, `CONDITIONAL GO`, or `NO-GO`.
- Action Items with owner/deadline when known.

For `full` mode, add a `Producer Risk Assessment` section. If no delegated
producer review is available, label it as Codex-inferred.

## Write Output

Show the review and top risks first. After approval or explicit write request,
create `production/milestones/` and write
`production/milestones/[milestone-name]-review.md`.

## Completion

Finish with:

- review path if written.
- go/no-go recommendation.
- top blockers.
- suggested next Codex request: sprint plan, gate check, bug triage, or scope
  reduction.
