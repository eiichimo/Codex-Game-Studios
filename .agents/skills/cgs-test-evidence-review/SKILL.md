---
name: cgs-test-evidence-review
description: Use to review Codex Game Studios automated and manual test evidence for stories, sprints, or systems and decide whether acceptance criteria are genuinely covered. This is the Codex-native replacement for the original Claude Code `/test-evidence-review` workflow.
metadata:
  short-description: Review test evidence quality
---

# Codex Game Studios Test Evidence Review

This skill evaluates evidence quality, not just file existence. It is read-only
by default.

## Modes

- `story-path [path]`: review one story and its evidence.
- `sprint`: review the current sprint.
- `system [name]`: review one gameplay/system area.

If the target is ambiguous, ask for the story, sprint, or system name.

## Inputs To Read

- `production/sprint-status.yaml` and latest `production/sprints/*.md`.
- `production/epics/**/*.md` stories and `EPIC.md` files.
- Referenced GDD Acceptance Criteria, Formulas, and Edge Cases.
- `tests/**/*`, test result logs, and manual QA evidence under `production/qa/`.
- `docs/architecture/tr-registry.yaml`, if present.
- Original source workflow, only if more detail is needed:
  `.claude/skills/test-evidence-review/SKILL.md`.

## Review Criteria

For each story or acceptance criterion, check:

- Automated assertions verify behavior, not only construction or happy paths.
- Edge cases and error paths are covered when the GDD requires them.
- Formula tests trace back to documented formulas and expected values.
- Manual evidence has steps, result, date, build/version, tester, and artifacts.
- Evidence is fresh enough for the changed code or current sprint.
- Test names and paths make coverage discoverable.
- Visual/feel criteria have appropriate screenshots, videos, or signed notes.

## Verdicts

Use one verdict per story and per major criterion:

- `ADEQUATE`: evidence is specific, current, and linked to requirements.
- `INCOMPLETE`: evidence exists but misses important criteria or freshness.
- `MISSING`: no credible evidence was found.

Do not mark evidence as adequate only because a test file exists.

## Write Output

Default output is a findings table in the response. If the user asks for a
persisted report, or after approval, create:

```text
production/qa/evidence-review-[date].md
```

Do not modify tests or stories from this skill unless the user explicitly asks
for a separate implementation pass.

## Completion

Finish with:

- Overall evidence verdict.
- Highest-risk missing evidence.
- Stories blocked by evidence gaps.
- Recommended next action: add tests, collect manual evidence, or run bug triage.
