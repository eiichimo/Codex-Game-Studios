---
name: cgs-soak-test
description: Use to create a Codex Game Studios extended play soak test protocol for memory, stability, balance, or all-up validation. This is the Codex-native replacement for the original Claude Code `/soak-test` workflow.
metadata:
  short-description: Create a soak test protocol
---

# Codex Game Studios Soak Test

This skill creates a protocol for a human-run extended play session. Codex
prepares the test; it does not claim the soak test was executed unless evidence
is provided.

## Modes

- `30m`, `1h`, `2h`, `4h`: requested duration.
- `memory`: memory growth, leaks, allocation spikes.
- `stability`: crashes, freezes, error logs, recovery.
- `balance`: economy, progression, combat/resource drift over time.
- `all`: default when no focus is specified.

If duration or focus is missing, infer only when the request is clear; otherwise
ask one concise question.

## Inputs To Read

- `.claude/docs/technical-preferences.md`.
- `design/gdd/game-concept.md` and relevant system GDDs.
- Latest `production/qa/qa-plan-*.md`, smoke report, or playtest report.
- `docs/engine-reference/`, if present.
- Original source workflow, only if more detail is needed:
  `.claude/skills/soak-test/SKILL.md`.

## Protocol Contents

Generate:

- Scope: build, platform, duration, focus, feature area, exclusions.
- Preconditions: build source, save state, settings, hardware, tools open.
- Script: startup steps, repeated actions, scenario rotation, recovery checks.
- Checkpoint schedule: timed checkpoints with metrics and questions.
- Evidence requirements: screenshots, logs, profiler captures, save files, notes.
- Pass criteria: `PASS`, `PASS WITH CONCERNS`, or `FAIL`.
- Escalation rules for crashes, data loss, severe performance drops, or blocked
  progression.

## Monitoring Guidance

Use configured engine guidance when available:

- Godot: debugger monitors, output log, scene tree state, resource/memory view.
- Unity: Profiler, Memory Profiler, console log, Player.log.
- Unreal: Unreal Insights, `stat unit`, `stat fps`, `stat memory`, crash logs.
- Unknown engine: frame rate, memory, CPU/GPU load, save/load behavior, logs.

Do not invent exact profiler commands if the engine version is unknown. Mark
unknowns as assumptions.

## Write Output

Show a short summary first. After approval, create `production/qa/` and write:

```text
production/qa/soak-test-[date]-[duration].md
```

Use the local date. Do not overwrite an existing protocol without approval.

## Completion

Finish with:

- Protocol path.
- Duration and focus.
- Required evidence.
- Human execution reminder.
- Recommended follow-up: evidence review or bug triage after the soak test.
