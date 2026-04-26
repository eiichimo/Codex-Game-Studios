---
name: cgs-team-polish
description: Use to coordinate a Codex Game Studios polish pass for a feature or area across performance, visuals, audio, tools, hardening, regression, and release-readiness. This is the Codex-native replacement for the original Claude Code `/team-polish` workflow.
metadata:
  short-description: Coordinate a polish pass
---

# Codex Game Studios Team Polish

This skill coordinates a release-quality polish pass. Do not spawn subagents
unless the user explicitly asks for delegation or parallel agent work.

## Required Input

Require the feature or area to polish, such as `combat`, `main menu`,
`inventory system`, or `level-1`. If missing, ask for it.

## Roles To Simulate Or Delegate

- Performance analyst: profiling, budgets, memory, frame time.
- Engine programmer: low-level rendering, loading, allocation issues.
- Technical artist: VFX quality, shader optimization, visual readability.
- Sound designer: feedback sounds, mix, ambience, spatial audio.
- Tools programmer: pipeline/editor tooling when content tools are involved.
- QA tester: edge cases, regression, soak/stress evidence.

## Inputs To Read

- Target GDDs, UX specs, art bible, audio docs, and acceptance criteria.
- `.claude/docs/technical-preferences.md`.
- Performance budgets and prior `production/qa/` reports.
- Existing source/assets/audio/tests for the target area.
- `docs/tech-debt-register.md`, if present.
- Original source workflow, only if more detail is needed:
  `.claude/skills/team-polish/SKILL.md`.

## Pipeline

1. Assessment: run or follow `cgs-perf-profile`, identify bottlenecks, visual
   gaps, audio gaps, tool risks, and QA risks.
2. Optimization: address high-priority hotspots without changing gameplay
   behavior. Capture before/after metrics when evidence exists.
3. Visual polish: improve feedback clarity, VFX consistency, graceful quality
   scaling, and art bible alignment.
4. Audio polish: validate missing events, mix balance, ambience, spatialization,
   and audio routing.
5. Tools check: verify editor/content pipeline stability if the polished area
   depends on custom tools.
6. Hardening: define or run regression, edge-case, stress, and soak checks.
7. Sign-off: report `READY FOR RELEASE` or `NEEDS MORE WORK`.

## Safety

- Do not treat subjective polish as permission for broad redesign.
- Ask before changing design direction, large asset sets, or multi-file
  architecture.
- Keep changes traceable to release-readiness issues, player feedback, or
  documented quality targets.

## Completion

Finish with:

- Target area.
- Performance before/after evidence or required profiling.
- Visual and audio polish status.
- QA hardening status.
- Remaining issues and severity.
- Release-readiness verdict.
- Next request: release checklist, gate check, sprint plan update, or another
  targeted polish pass.
