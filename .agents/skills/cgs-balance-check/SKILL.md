---
name: cgs-balance-check
description: Use to analyze Codex Game Studios balance data, formulas, and GDD tuning targets for combat, economy, progression, loot, or a specific data file, identifying outliers, degenerate strategies, broken curves, and recommended fixes. This is the Codex-native replacement for the original Claude Code `/balance-check` workflow.
metadata:
  short-description: Check game balance
---

# Codex Game Studios Balance Check

This skill analyzes balance data against design intent. It reports issues first;
data changes require explicit user instruction.

## Scope

Accept:

- system name such as combat, economy, progression, or loot.
- path to a data or balance file.

If missing, ask which balance domain to check.

## Inputs To Read

- Relevant files under `assets/data/`.
- Relevant files under `design/balance/`.
- Matching system GDD under `design/gdd/`.
- Formulas, tuning knobs, expected ranges, and acceptance criteria.
- Original source workflow, only if more detail is needed:
  `.claude/skills/balance-check/SKILL.md`.

## Domain Checks

Combat:

- DPS and time-to-kill by tier.
- strictly dominant options.
- defensive loops or unkillable states.
- damage/resistance interactions.

Economy:

- resource faucets and sinks.
- accumulation over time.
- infinite loops.
- price/value mismatches.

Progression:

- XP/power curves.
- dead zones and power spikes.
- content gates vs expected player power.
- grind/skip strategy risk.

Loot:

- rarity distribution.
- expected acquisition time.
- pity timer math.
- useless loot and inventory pressure.

## Report

Generate:

- Data Sources Analyzed.
- Health Summary: `HEALTHY`, `CONCERNS`, or `CRITICAL ISSUES`.
- Outliers Detected table.
- Degenerate Strategies Found.
- Progression or flow analysis.
- Recommendations by priority.
- Values That Need Attention.

Label weak estimates and missing source data explicitly.

## Fix Cycle

After presenting the report, ask before changing data. If the user asks to fix:

- change the smallest relevant data file or formula.
- explain the design impact.
- recommend rerunning the balance check.
- flag GDD/ADR downstream impacts when tuning knobs change.

## Completion

Finish with:

- balance health.
- highest priority issue.
- files analyzed.
- changes made, if any.
- next recommended Codex request: rerun balance check, propagate design change,
  sprint plan, or quick design.
