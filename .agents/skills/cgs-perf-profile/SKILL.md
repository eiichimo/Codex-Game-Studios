---
name: cgs-perf-profile
description: Use to run a Codex Game Studios performance profiling analysis for one system or the full project, identifying budgets, static hotspots, runtime profiling needs, optimization priorities, quick wins, and scope/timeline trade-offs. This is the Codex-native replacement for the original Claude Code `/perf-profile` workflow.
metadata:
  short-description: Analyze performance risk
---

# Codex Game Studios Performance Profile

This skill identifies performance risks and optimization candidates. Static
analysis can find suspects; runtime profiling on target hardware is required to
confirm impact.

## Scope

- system name: focus on one system.
- `full`: profile all systems at a high level.

If scope is missing, ask whether to analyze one system or the whole project.

## Inputs To Read

- `.claude/docs/technical-preferences.md`.
- Performance budgets in GDDs, technical docs, release docs, or engine
  preferences.
- Relevant source files for the target system.
- Existing performance tests, profiler captures, logs, or benchmarks.
- Engine reference docs under `docs/engine-reference/`, if present.
- Original source workflow, only if more detail is needed:
  `.claude/skills/perf-profile/SKILL.md`.

Do not assume a named performance subagent exists. Use Codex delegation only
when the user explicitly asks for parallel agent work.

## Analyze Hotspots

Look for:

- per-frame code such as `_process`, `Update`, `Tick`, timers, and loops.
- nested loops over entities or large collections.
- allocations, string work, sorting, searching, or logging in hot paths.
- frequent physics queries.
- instantiate/destroy patterns that should use pooling.
- large data structures, caches, and missing eviction.
- sync asset loading or save/load blocking paths.
- rendering risks: draw calls, overdraw, shader complexity, particles, LODs.
- networking frequency, packet size, and validation overhead if applicable.

## Report

Generate:

- Performance Budgets table: frame time, memory, load time, draw calls,
  network as applicable.
- Hotspots Identified table with location, issue, estimated impact, fix effort.
- Optimization Recommendations in priority order.
- Quick Wins under one hour.
- Requires Runtime Profiling: areas that need measurement before action.
- Scope and Timeline Decision: implement, reduce scope, defer, or consider ADR
  for medium/large fixes.

Classify estimated impact and fix effort conservatively when evidence is weak.

## Completion

Finish with:

- top 3 hotspots.
- estimated headroom vs budget when known.
- quick wins.
- measurement gaps.
- next recommended Codex request: targeted profiling, ADR, scope check, or
  sprint plan update.
