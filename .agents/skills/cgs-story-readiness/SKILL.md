---
name: cgs-story-readiness
description: Use to validate whether one or more Codex Game Studios story files are ready for implementation, checking GDD traceability, ADR status, manifest version, dependencies, acceptance criteria, scope, and test evidence requirements. This is the Codex-native replacement for the original Claude Code `/story-readiness` workflow.
metadata:
  short-description: Check story implementation readiness
---

# Codex Game Studios Story Readiness

This skill is read-only. It reports whether stories are ready to implement.

## Scope

- One story path.
- `sprint`: stories in the current sprint.
- `all`: all stories under `production/epics/`.
- One epic directory.

## Inputs To Read

- Story files in scope.
- `design/gdd/systems-index.md`.
- `docs/architecture/control-manifest.md`.
- `docs/architecture/tr-registry.yaml`.
- Referenced ADR files.
- Current sprint file, if checking sprint scope.
- Original source workflow, only if more detail is needed:
  `.claude/skills/story-readiness/SKILL.md`.

## Checklist

For each story:

- GDD path and specific requirement or TR-ID referenced.
- Acceptance criteria are self-contained and testable.
- ADR reference exists, or explicit "No ADR applies" rationale exists.
- Referenced ADR status is Accepted; Proposed ADRs block implementation.
- TR-ID exists and is active when registry exists.
- Manifest Version matches current control manifest when both exist.
- Engine notes are present or N/A.
- Scope and out-of-scope boundary are clear.
- Dependencies are listed as files/IDs or explicitly None.
- Dependency stories exist and are not Draft.
- No unresolved TODO/TBD/UNRESOLVED markers in critical sections.
- Referenced assets exist.
- Story Type is declared.
- Test Evidence section points to automated test or manual evidence path.

## Verdicts

- `READY`: all checks pass or have explicit N/A.
- `NEEDS WORK`: fixable gaps, no blocking dependency/ADR issue.
- `BLOCKED`: missing dependency, missing ADR, Proposed ADR, unresolved critical
  question, or story depends on Draft work.

## Output

For one story:

- Verdict.
- Passing checks count.
- Gaps with exact fixes.
- Blockers.

For multiple stories:

- Counts by verdict.
- Ready story list.
- Needs work summary.
- Blocked summary.
- Detail for non-ready stories.

Do not edit story files unless the user asks for a follow-up fix.
