---
name: cgs-skill-test
description: Use to validate repo-local Codex Game Studios skills under `.agents/skills/` for frontmatter, Codex compatibility, workflow quality, safety, and source mapping. This is the Codex-native replacement for the original Claude Code `/skill-test` workflow.
metadata:
  short-description: Validate Codex skills
---

# Codex Game Studios Skill Test

This skill validates Codex skills in `.agents/skills/`. It may also compare
against original `.claude/skills/` source material when that helps assess a
port, but `.agents/skills/` is the Codex source of truth.

## Modes

- `static`: validate all Codex skills. Default mode.
- `spec [skill-name]`: validate one skill in detail.
- `category [name]`: validate a category such as QA, release, or design.
- `audit`: check naming, source mapping, and migration consistency.

## Inputs To Read

- `.agents/skills/*/SKILL.md`.
- Matching `.claude/skills/*/SKILL.md`, only when source comparison is needed.
- `README.md` Codex Usage list.
- `docs/CODEX-PORTING.md`.
- Original source workflow, only if more detail is needed:
  `.claude/skills/skill-test/SKILL.md`.

## Required Checks

Check each skill for:

- YAML frontmatter with `name`, `description`, and `metadata.short-description`.
- Folder name matches `name`.
- Description states when to use the skill, not only what it is.
- Body has a clear purpose, inputs, workflow, outputs, and completion criteria.
- Output paths are explicit when the skill writes files.
- Validation or evidence expectations are stated when relevant.
- Content is concise enough for Codex progressive disclosure.

## Codex Compatibility Checks

Flag:

- Claude slash-command assumptions as required invocation behavior.
- Guaranteed named Claude subagent routing.
- Automatic Claude hook execution assumptions.
- `AskUserQuestion` or Claude-only tool references.
- Broad rewrites or major direction changes without user approval.
- Missing note that Codex should use reasonable assumptions unless a decision is
  genuinely blocking or risky.

Use original workflow intent as context, but do not require Claude-specific
implementation details.

## Output Format

Report:

- Summary counts: pass, warning, fail.
- Findings table with severity, skill, location, issue, recommendation.
- Source mapping gaps, if any.
- Highest-value fixes.

By default, do not edit files. If the user asks for a persisted report, or after
approval, create:

```text
production/qa/skill-test-[date].md
```

## Completion

Finish with:

- Overall skill catalog verdict.
- Blocking issues.
- Warnings worth fixing later.
- Suggested next Codex request: improve the highest-risk skill or continue
  porting the next category.
