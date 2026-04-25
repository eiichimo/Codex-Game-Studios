---
name: cgs-gate-check
description: Use to validate whether a Codex Game Studios project is ready to advance from one development phase to the next, producing a PASS, CONCERNS, or FAIL verdict. This is the Codex-native replacement for the original Claude Code `/gate-check` workflow.
metadata:
  short-description: Validate phase readiness
---

# Codex Game Studios Gate Check

This skill performs a phase gate review. It is prescriptive: "are we ready to
advance?" For diagnostic "where are we?", use `cgs-help`.

## Inputs To Read

- `.claude/docs/workflow-catalog.yaml`: phase sequence and required artifacts.
- `production/stage.txt`, if present.
- `production/review-mode.txt`, if present.
- `docs/consistency-failures.md`, if present.
- Artifacts required by the current or requested phase.
- Original source workflow, only if a detailed checklist is needed:
  `.claude/skills/gate-check/SKILL.md`.

## Determine Gate

If the user names a target phase, validate readiness to enter that phase.

If no target is named:

1. Infer current phase using `production/stage.txt` first, then artifacts.
2. Identify the next phase from `workflow-catalog.yaml`.
3. Confirm the inferred transition before doing a long review.

Phase sequence:

1. Concept
2. Systems Design
3. Technical Setup
4. Pre-Production
5. Production
6. Polish
7. Release

## Review Mode

- `solo`: artifact and basic quality checks only.
- `lean`: artifact and core quality checks; default.
- `full`: deeper cross-domain scrutiny, still performed locally unless the user
  explicitly asks for delegated or parallel agent review.

Do not spawn subagents unless the user explicitly asks for delegation.

## Checks

Use `workflow-catalog.yaml` as the primary checklist:

- Verify required artifact globs.
- Verify `min_count` requirements.
- Verify `artifact.pattern` requirements.
- For files that exist, check they have meaningful content, not only template
  headings.
- For manual notes, report that human confirmation is needed.

Add phase-specific scrutiny:

- Concept gate: concept, pillars, core loop, target audience, visual identity.
- Systems gate: systems index, MVP GDD coverage, design reviews, dependency
  consistency.
- Technical gate: engine setup, technical preferences, ADRs, architecture docs,
  engine references, test setup, accessibility foundation.
- Pre-production gate: prototype, vertical slice evidence, UX specs, epics,
  stories, sprint plan.
- Production gate: implemented core loop, tests, QA plan, smoke check, playtest
  evidence, critical bugs.
- Polish gate: feature/content completeness, localization readiness, QA signoff,
  balance/performance checks.
- Release gate: release checklist, packaging, legal/store metadata, no
  medium-or-higher known bugs unless explicitly accepted.

## Verdict Rules

- `PASS`: required artifacts exist and quality risks are minor.
- `CONCERNS`: required artifacts mostly exist, but there are explicit risks the
  user can choose to accept.
- `FAIL`: required artifacts are missing, core quality checks fail, or a manual
  gate item is unresolved and materially blocks the next phase.

Never silently advance on `FAIL`.

## Output

Use this format:

```text
Gate: [Current] -> [Next]
Verdict: PASS | CONCERNS | FAIL

Required artifacts:
- PASS/FAIL [artifact] - [finding]

Blockers:
- [only FAIL items]

Concerns:
- [risks that could be accepted]

Recommended next action:
- [one concrete Codex request]
```

## Stage Update

If the verdict is `PASS`, ask whether to update `production/stage.txt` to the
new phase. Write only after approval.

If the verdict is `CONCERNS`, ask whether the user accepts the risks before
updating `production/stage.txt`.

If the verdict is `FAIL`, do not update stage state.
