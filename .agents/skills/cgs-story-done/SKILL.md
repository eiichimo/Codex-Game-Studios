---
name: cgs-story-done
description: Use to verify and close a Codex Game Studios story after implementation by checking acceptance criteria, tests or manual evidence, GDD/ADR deviations, scope, and next ready work. This is the Codex-native replacement for the original Claude Code `/story-done` workflow.
metadata:
  short-description: Verify and close a story
---

# Codex Game Studios Story Done

This skill verifies whether an implemented story can be marked complete. It does
not implement missing work; use `cgs-dev-story` first.

## Find The Story

If a story path is provided, read it.

If not:

- Check `production/session-state/active.md`.
- Check sprint or epic files for in-progress stories.
- Ask the user to provide the story path if ambiguous.

## Inputs To Read

- Story file.
- Referenced TR IDs from `docs/architecture/tr-registry.yaml`.
- Referenced GDD sections.
- Referenced ADR decision and consequences.
- `docs/architecture/control-manifest.md`, if present.
- Implementation files mentioned by story, session state, or recent git diff.
- Test evidence paths from the story.
- Original source workflow, only if more detail is needed:
  `.claude/skills/story-done/SKILL.md`.

## Verify Acceptance Criteria

For each acceptance criterion:

- Check implementation file existence.
- Check tests or evidence files.
- Run relevant tests when the command is known and scoped.
- For subjective or build-only checks, ask for manual confirmation or mark
  deferred with a clear reason.

Create a traceability table:

- Criterion.
- Evidence: unit test, integration test, manual evidence, or deferred.
- Status: covered, untested, failed, or not applicable.

## Evidence Requirements

- Logic: unit test exists and passes.
- Integration: integration test or documented playtest/evidence exists.
- Visual/Feel: manual evidence/signoff is advisory unless project policy says
  otherwise.
- UI: manual walkthrough, screenshot, or interaction test is advisory unless
  project policy says otherwise.
- Config/Data: smoke check evidence is advisory.

Blocking gaps prevent completion.

## Deviation Checks

Compare implementation against:

- Current TR requirement text.
- GDD rules and formulas.
- ADR decision and forbidden patterns.
- Control manifest rules.
- Story out-of-scope boundaries.

Categorize findings:

- Blocking: contradicts GDD/ADR, missing required tests, or fails AC.
- Advisory: acceptable risk if documented.
- Out of scope: extra touched files or behavior outside story.

## Output Before Writes

Present:

- Verdict: Complete, Needs Fixes, or Blocked.
- Acceptance criteria coverage.
- Test results.
- Deviations.
- Manual confirmations needed.

## Optional Writes

Only after user approval and only if verdict is Complete or accepted with
explicit advisory risks:

- Update story `Status:` to `Complete`.
- Add completion notes with date, evidence, and deviations.
- Update `production/session-state/active.md`.
- Update sprint or epic status if the file format is clear.

Do not mark the story complete if blocking gaps remain.

## Completion

Finish with:

- Story status.
- Evidence summary.
- Remaining risks.
- Next ready story, if discoverable from epic or sprint files.
