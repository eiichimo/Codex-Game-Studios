---
name: cgs-content-audit
description: Use to audit Codex Game Studios planned content counts against implemented content for one system or the full project, identifying specified vs found counts, gaps, high-priority MVP gaps, and backlog follow-up. This is the Codex-native replacement for the original Claude Code `/content-audit` workflow.
metadata:
  short-description: Audit planned content gaps
---

# Codex Game Studios Content Audit

This skill compares GDD-specified content against files present in the project.
Counts are approximate and should be manually verified for high-priority gaps.

## Scope

- no argument: full audit.
- system name: audit one system.
- `summary`: print summary only and do not write a file.

## Inputs To Read

- `design/gdd/systems-index.md`.
- In-scope GDDs under `design/gdd/`.
- Relevant content directories under `assets/` and `src/`.
- Existing epics/stories if backlog follow-up is requested.
- Original source workflow, only if more detail is needed:
  `.claude/skills/content-audit/SKILL.md`.

## Extract Planned Content

Use a grep-first pass for count/list language:

- enemies, characters, NPCs.
- levels, maps, areas, stages.
- items, weapons, equipment, loot.
- abilities, skills, spells.
- dialogue, conversations, cutscenes.
- quests, missions, objectives.
- explicit named content lists.

Record unspecified qualitative content as an auditability gap.

## Scan Implemented Content

Count likely implemented files:

- scenes/levels/maps in `assets/` and `src/`.
- enemy, character, item, ability, quest, and dialogue data files.
- engine-specific scene/prefab/resource files.

Note caveats where files may be editor-only, test-only, UI-only, or otherwise
not shippable content.

## Report

Generate:

- Summary: total specified, total found, gap count and percentage, scope.
- Gap Table: system, content type, specified, found, gap, status.
- Status: `COMPLETE`, `IN PROGRESS`, `EARLY`, or `NOT STARTED`.
- HIGH PRIORITY Gaps for MVP/Vertical Slice blockers.
- Per-System Breakdown.
- Unspecified Content Counts.
- Recommendations.

Flag `NOT STARTED` or `EARLY` MVP content as high priority.

## Write Output

For full or single-system audits, present the report first. After approval or
explicit write request, write `docs/content-audit-[date].md`.

For `summary`, do not write.

## Completion

Finish with:

- audit scope.
- highest priority gaps.
- total gap percentage.
- report path if written.
- next recommended Codex request: sprint plan, create stories, quick design, or
  design system update.
