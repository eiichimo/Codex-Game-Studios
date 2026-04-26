---
name: cgs-project-stage-detect
description: Use to analyze a Codex Game Studios project state, detect its current development phase, identify artifact gaps, and recommend next steps from existing files. This is the Codex-native replacement for the original Claude Code `/project-stage-detect` workflow.
metadata:
  short-description: Detect project stage
---

# Codex Game Studios Project Stage Detect

This skill scans existing artifacts to answer "where are we?" It is diagnostic
and read-only unless the user approves writing a report.

## Modes

- `general`: holistic scan. Default.
- `programmer`: focus on architecture, code, tests, ADRs.
- `designer`: focus on GDDs, prototypes, systems, levels, narrative.
- `producer`: focus on sprint plans, milestones, roadmap, stage gates.

## Inputs To Read

- `production/stage.txt`, if present. Treat as authoritative.
- `design/gdd/`, `design/narrative/`, `design/levels/`.
- `src/`, `prototypes/`, `tests/`.
- `docs/architecture/`, ADRs, and `docs/engine-reference/`.
- `production/sprints/`, milestones, roadmap, and session state.
- Original source workflow, only if more detail is needed:
  `.claude/skills/project-stage-detect/SKILL.md`.

## Stage Heuristics

If `production/stage.txt` is absent, infer from most advanced reliable signal:

- Concept: no concept doc or only brainstorming artifacts.
- Systems Design: concept exists, systems index missing or incomplete.
- Technical Setup: systems index exists, engine not configured.
- Pre-Production: engine configured, source code is minimal.
- Production: active source/story/sprint development exists.
- Polish: explicit stage gate only.
- Release: explicit stage gate only.

Report confidence as `PASS`, `CONCERNS`, or `FAIL`.

## Gap Analysis

Do not just list missing files. For each important gap, explain the implication
and ask or recommend the next safe workflow:

- Code exists without GDD: suggest reverse-documenting or confirming prototype
  status.
- ADRs exist without architecture overview: suggest architecture review or
  reverse-documenting.
- Concept exists without systems index: suggest `cgs-map-systems`.
- Prototypes lack READMEs: suggest reverse-documenting or archiving.
- No sprint plan: ask whether work is tracked elsewhere.

## Optional Report

Default output is a concise stage report in the response. After approval, write:

```text
production/project-stage-report.md
```

Use the template intent from `.claude/docs/templates/project-stage-report.md` if
available.

## Completion

Finish with:

- Detected stage and confidence.
- Completeness overview for design, code, architecture, production, tests.
- Highest-impact gaps.
- Role-filtered recommendations, if requested.
- One concrete next Codex request.
