---
name: cgs-skill-improve
description: Use to improve an existing Codex Game Studios skill with a baseline validation, focused patch, retest, and non-destructive rollback guidance if the patch does not improve quality. This is the Codex-native replacement for the original Claude Code `/skill-improve` workflow.
metadata:
  short-description: Improve a Codex skill
---

# Codex Game Studios Skill Improve

This skill improves one existing `.agents/skills/[name]/SKILL.md` file through a
test-fix-retest loop.

## Required Target

The user must name one skill or provide one skill path. If missing, ask for it.
Do not improve the whole catalog in this workflow; use `cgs-skill-test` first.

## Inputs To Read

- Target `.agents/skills/[name]/SKILL.md`.
- `cgs-skill-test` findings for the target, if available.
- Matching `.claude/skills/[source]/SKILL.md`, only when checking port fidelity.
- `README.md` and `docs/CODEX-PORTING.md` if the skill list or status may need
  updates.
- Original source workflow, only if more detail is needed:
  `.claude/skills/skill-improve/SKILL.md`.

## Workflow

1. Run or simulate `cgs-skill-test spec [name]` as the baseline.
2. Identify the smallest set of changes that improves correctness, safety, or
   Codex compatibility.
3. Explain the proposed patch before writing.
4. After approval, edit only the target skill and directly related indexes.
5. Retest the target with the same checks.
6. Keep the patch only if quality improves or the user explicitly accepts the
   tradeoff.

## Improvement Targets

Prioritize:

- Clearer trigger description.
- Missing inputs, outputs, or completion criteria.
- Unsafe write behavior or missing approval point.
- Claude-only assumptions not valid in Codex.
- Overly verbose instructions that can be shortened without losing behavior.
- Missing source mapping to the original `.claude/skills/` workflow.

Avoid stylistic rewrites with no behavioral benefit.

## Rollback Safety

Do not use destructive commands such as `git reset --hard` or `git checkout --`.
If a patch should be reverted, ask first and revert with a safe explicit patch
or a new corrective edit.

## Completion

Finish with:

- Baseline verdict.
- Changes made.
- Retest verdict.
- Residual warnings.
- Whether README or porting docs were updated.
