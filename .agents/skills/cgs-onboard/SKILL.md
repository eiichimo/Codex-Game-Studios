---
name: cgs-onboard
description: Use to generate a Codex Game Studios onboarding document for a new contributor, role, or project area by summarizing project state, architecture, standards, current priorities, key files, dependencies, pitfalls, and first tasks. This is the Codex-native replacement for the original Claude Code `/onboard` workflow.
metadata:
  short-description: Create onboarding docs
---

# Codex Game Studios Onboard

This skill creates a contextual onboarding document for a role or area. It is
for contributors joining the project, not first-time project setup.

## Scope

Accept a role or area, such as:

- programmer.
- designer.
- narrative.
- QA.
- production.
- audio.
- UI.
- a specific system or directory.

If missing, ask who or what area the onboarding doc is for.

## Inputs To Read

- `AGENTS.md` and relevant directory `AGENTS.md`.
- relevant role references under `.claude/agents/`, if present.
- `README.md` and `docs/CODEX-PORTING.md`.
- `design/`, `docs/`, `src/`, `tests/`, and `production/` subsets relevant
  to the role.
- latest sprint, milestone, and git history, if available.
- Original source workflow, only if more detail is needed:
  `.claude/skills/onboard/SKILL.md`.

## Scan By Role

- Programmers: architecture, source layout, coding standards, tests.
- Designers: concepts, systems, GDDs, art/UX specs.
- Narrative: narrative docs, characters, dialogue, localization risks.
- QA: test assets, QA plans, bug workflow, regression suite.
- Production: sprint, milestone, risk, release, onboarding state.
- Area-specific: read the target directory and related docs.

## Document

Generate:

- Project Summary.
- Your Role.
- Project Architecture or domain overview.
- Key Directories.
- Key Files with read priority.
- Current Standards and Conventions.
- Current State of Your Area.
- Current Sprint Context.
- Key Dependencies.
- Common Pitfalls.
- First Tasks.
- Questions to Ask.

Keep the output practical and role-specific. Do not dump the whole repository.

## Write Output

Present the onboarding doc first. After approval or explicit write request,
create `production/onboarding/` and write
`production/onboarding/onboard-[role]-[date].md`.

## Completion

Finish with:

- onboarding path if written.
- intended role or area.
- first three recommended reads.
- first safe task.
- next recommended Codex request: sprint status, help, or role-specific review.
