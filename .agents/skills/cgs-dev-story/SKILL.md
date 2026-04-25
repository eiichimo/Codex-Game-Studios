---
name: cgs-dev-story
description: Use to implement a Codex Game Studios production story by loading the story, GDD requirement, ADR, control manifest, engine preferences, writing code and tests, and summarizing acceptance-criteria coverage. This is the Codex-native replacement for the original Claude Code `/dev-story` workflow.
metadata:
  short-description: Implement a production story
---

# Codex Game Studios Dev Story

This skill bridges planning and implementation. It reads a story file, loads
the governing design and architecture context, implements the change, writes or
updates tests, and reports acceptance-criteria coverage.

## Preconditions

Use after story readiness has been checked or when the user explicitly accepts
the risk of implementing without that check.

Expected flow:

1. QA/test plan for sprint or feature.
2. Story readiness check.
3. Dev story implementation.
4. Code review.
5. Story done verification.

## Find The Story

If a story path is provided, read it.

If not:

- Check `production/session-state/active.md` for an active story.
- Otherwise list ready stories from `production/epics/**/*.md` and ask which one
  to implement.

## Required Context

Read before editing code:

- Story file: title, ID, status, layer, type, acceptance criteria, dependencies,
  out-of-scope, test evidence path, TR-ID, ADR, manifest version.
- `docs/architecture/tr-registry.yaml`: current requirement text for the TR-ID.
- Governing ADR referenced by the story.
- `docs/architecture/control-manifest.md`, if present.
- `.claude/docs/technical-preferences.md`.
- Relevant GDDs under `design/gdd/`.
- Relevant engine references under `docs/engine-reference/`, if engine is
  configured.
- Existing source and tests in the target area.
- Original source workflow, only if more detail is needed:
  `.claude/skills/dev-story/SKILL.md`.

Stop before implementation if the TR registry or governing ADR is required by
the story but missing. Report the blocker and recommended fix.

## Dependency And Scope Checks

Before editing:

- Verify dependency stories are `Done` or `Complete`, or ask the user to accept
  dependency risk.
- Compare story manifest version to the current control manifest, if both exist.
- Identify files likely in scope.
- Identify out-of-scope boundaries that must not be crossed.

If unexpected unrelated local changes exist in files you need to edit, stop and
ask how to proceed.

## Implementation Routing

Use role guidance locally rather than guaranteed named subagents:

- Foundation systems: engine-programmer lens.
- UI stories: UI programmer lens.
- Gameplay mechanics: gameplay-programmer lens.
- AI/pathfinding: AI programmer lens.
- Networking: network-programmer lens.
- Config/data: direct data edit, usually no code architecture change.
- Engine-specific code: consult engine reference docs and apply the selected
  engine specialist lens.

Do not spawn subagents unless the user explicitly asks for delegation or
parallel implementation.

## Implement

- Keep within the story's acceptance criteria and out-of-scope boundaries.
- Respect ADR decisions and control manifest rules.
- Keep gameplay values data-driven.
- Add doc comments for public APIs.
- Prefer minimal, coherent changes over broad refactors.
- For Config/Data stories, report exact value changes.

## Tests And Evidence

- Logic and integration stories require automated tests.
- Visual/Feel and UI stories require manual evidence notes if automated tests
  are not practical.
- Config/Data stories usually need smoke-check evidence.

Test expectations:

- Cover each acceptance criterion where automatable.
- Test formula bounds and edge cases from the GDD.
- Avoid nondeterminism, external I/O, and time-dependent assertions unless the
  project test framework explicitly supports them.

Run the relevant test command when available. If the engine or test framework is
not configured, state that verification could not be run and why.

## Session State

After implementation, append a concise entry to
`production/session-state/active.md` if the user has not asked to avoid session
state updates:

```text
## Session Extract - dev story [YYYY-MM-DD]
- Story: [path] - [title]
- Files changed: [paths]
- Test written: [path or manual evidence]
- Blockers: [none or summary]
- Next: code review, then story done verification
```

Create `production/session-state/` if needed.

## Output

Use this format:

```text
Implementation: [Story Title]

Files changed:
- [path] - [what changed]

Acceptance criteria:
- [x] [criterion] - [implementation/test evidence]
- [ ] [criterion] - [why not complete]

Tests:
- [command] - passed/failed/not run

Deviations:
- [none or explicit scope/ADR/test deviation]

Next:
- Run code review.
- Run story done verification.
```

Do not mark a story done automatically. That belongs to story done verification.
