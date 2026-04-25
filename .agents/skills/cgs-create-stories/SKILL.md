---
name: cgs-create-stories
description: Use to break a Codex Game Studios epic into implementable story markdown files with TR-ID traceability, governing ADRs, acceptance criteria, story type, dependencies, and test evidence requirements. This is the Codex-native replacement for the original Claude Code `/create-stories` workflow.
metadata:
  short-description: Break an epic into stories
---

# Codex Game Studios Create Stories

This skill creates implementable story files under an epic directory. Run it per
epic after `cgs-create-epics`.

## Inputs To Read

- `production/epics/[epic-slug]/EPIC.md`.
- The epic's GDD.
- Governing ADRs listed in the epic.
- `docs/architecture/control-manifest.md`.
- `docs/architecture/tr-registry.yaml`.
- `.claude/docs/technical-preferences.md`.
- Original source workflow, only if more detail is needed:
  `.claude/skills/create-stories/SKILL.md`.

Stop if the epic references ADR files that do not exist. Stories need concrete
implementation guidance.

## Story Types

Classify each story by highest implementation risk:

- Logic: formulas, state transitions, rules, AI decisions.
- Integration: two or more systems interacting.
- Visual/Feel: animation, VFX, audio sync, responsiveness, game feel.
- UI: screens, HUD, menus, controls, accessibility.
- Config/Data: balance values or data file changes only.

## Decompose

For each GDD acceptance criterion:

1. Group related criteria into one focused story.
2. Keep each story small enough for one focused implementation session.
3. Order by dependency: foundation behavior, core logic, edge cases, integration,
   UI/visual polish.
4. Assign TR-ID from registry. If missing, use a placeholder and flag it.
5. Assign governing ADR. If ADR is Proposed, mark story Blocked.
6. Define evidence path:
   - Logic: `tests/unit/[system]/[story-slug]_test.[ext]`.
   - Integration: `tests/integration/[system]/[story-slug]_test.[ext]`.
   - Visual/Feel or UI: `production/qa/evidence/[story-slug]-evidence.md`.
   - Config/Data: smoke check evidence.

## Write Output

Before writing, present the full story list:

- Story number and title.
- Type.
- TR-ID.
- ADR.
- Evidence path.
- Dependencies.
- Blocked/Ready status.

After approval, write:

`production/epics/[epic-slug]/story-[NNN]-[slug].md`

Minimum story sections:

- Header with Epic, Status, Layer, Type, Manifest Version.
- Context: GDD, TR-ID, ADR, engine risk.
- Acceptance Criteria.
- Implementation Notes from ADR.
- Out of Scope.
- QA Test Cases or Manual Verification.
- Test Evidence.
- Dependencies.
- Developer Notes.

Update `EPIC.md` story count/status only after user approval.

## Completion

Finish with:

- Story files written.
- Blocked stories and why.
- Missing TR IDs or ADRs.
- Next recommended Codex request: story readiness or dev story implementation.
