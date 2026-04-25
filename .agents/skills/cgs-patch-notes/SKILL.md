---
name: cgs-patch-notes
description: Use to generate Codex Game Studios player-facing patch notes from internal changelogs, release records, git history, sprint context, balance docs, and QA records, with brief, detailed, or full style output. This is the Codex-native replacement for the original Claude Code `/patch-notes` workflow.
metadata:
  short-description: Write player patch notes
---

# Codex Game Studios Patch Notes

This skill produces public patch notes. It should not expose internal file
paths, sprint numbers, ticket IDs, developer names, or implementation jargon.

## Scope And Style

- Version is required. If missing, ask.
- Styles: `brief`, `detailed`, or `full`.
- Default style: `detailed`.

Use `brief` for short announcements, `detailed` for normal releases, and `full`
when developer commentary is requested.

## Inputs To Read

- `production/releases/[version]/changelog.md`, if present.
- `docs/CHANGELOG.md`, if it contains the version.
- Git history between previous release tag and target version/HEAD.
- Sprint retrospectives under `production/sprints/`.
- Balance docs under `design/balance/`, if present.
- QA bug fix and known issue records, if present.
- Tone/style guidance from `.claude/docs/technical-preferences.md`,
  `docs/PATCH-NOTES-STYLE.md`, or `design/community/tone-guide.md`.
- Patch note template from `docs/patch-notes-template.md` or
  `.claude/docs/templates/patch-notes-template.md`, if present.
- Original source workflow, only if more detail is needed:
  `.claude/skills/patch-notes/SKILL.md`.

If no changelog, release record, or usable git history exists, stop with
`BLOCKED` and recommend generating a changelog first.

## Categorize For Players

Use:

- New Content
- Gameplay Changes
- Quality of Life
- Bug Fixes
- Performance
- Known Issues

Translate developer language into player-visible outcomes. Preserve useful
numbers for balance changes, but avoid implementation details.

## Output Styles

- `brief`: compact bullets for new content, changes, fixes, and known issues.
- `detailed`: highlights, sections, balance table, grouped fixes, known
  issues, and workarounds.
- `full`: detailed output plus developer commentary in a team voice.

If a template exists, use the template structure instead of the built-in
sections while preserving the same evidence and privacy rules.

## Review Before Writing

Check:

- no internal jargon or references.
- bug fixes describe player symptoms.
- balance changes include before/after values when available.
- tone matches the project guidance.
- known issues are accurate and not overpromised.
- internal-only changes are excluded or reframed.

## Write Output

Show the patch notes, category counts, and excluded internal changes first.

After approval or an explicit write request, create directories and write:

- `docs/patch-notes/[version].md`
- `production/releases/[version]/patch-notes.md`

## Completion

Finish with:

- Patch notes status: generated, written, or blocked.
- File paths if written.
- Source data used.
- Items needing community/producer review before publishing.
