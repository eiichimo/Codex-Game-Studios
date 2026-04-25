---
name: cgs-changelog
description: Use to generate Codex Game Studios internal and player-facing changelogs from git history, sprint records, milestone docs, GDDs, and release notes, with categories, metrics, known issues, and task-reference coverage. This is the Codex-native replacement for the original Claude Code `/changelog` workflow.
metadata:
  short-description: Generate a changelog
---

# Codex Game Studios Changelog

This skill turns development history into an internal changelog and a
player-facing summary.

## Scope

Accept a version, release tag, sprint number, date range, or "latest". If scope
is missing, infer from tags or sprint docs when obvious; otherwise ask.

## Inputs To Read

- Git tags and commits for the requested range.
- Existing `docs/CHANGELOG.md`, if present.
- Sprint plans/status/retrospectives under `production/sprints/`.
- Release records under `production/releases/`.
- Milestones under `production/milestones/`.
- Relevant GDDs under `design/gdd/`.
- QA bug and known-issue records, if present.
- Original source workflow, only if more detail is needed:
  `.claude/skills/changelog/SKILL.md`.

## Git Handling

Confirm the repository is a git worktree before using git history. If not,
explain that changelog generation needs explicit release/sprint notes.

Use:

- last matching tag to `HEAD`, if a version/tag is provided.
- previous tag to current tag, if both exist.
- sprint date range, if a sprint number is provided.
- a recent bounded range when no tags exist.

Ignore merge/fixup noise in the public narrative, but keep useful technical
detail in the internal changelog.

## Categorize Changes

Use these categories:

- New Features
- Improvements
- Bug Fixes
- Balance Changes
- Technical Debt / Refactoring
- Known Issues
- Miscellaneous

Count commits without a task reference such as `[STORY-123]`, `TR-`, `#NNN`,
or a repository-specific ticket prefix.

## Internal Changelog

Include:

- Version/date/sprint range.
- Commit count and hash range.
- Categorized changes with technical context.
- Related story/issue/design references where available.
- Owners only if already documented.
- Known issues and risk notes.
- Metrics: total commits, files changed, lines added/removed, commits without
  task reference.

## Player-Facing Changelog

Translate implementation details into player impact:

- avoid internal paths, ticket IDs, developer names, and jargon.
- group related fixes instead of listing every commit.
- explain balance changes with before/after values and player-facing intent.
- include known issues honestly, with workarounds when available.

## Output And Write

Show both changelogs first. If writing is approved:

- Append to the top of `docs/CHANGELOG.md` when it exists.
- Create `docs/CHANGELOG.md` when missing.
- Only overwrite if the user explicitly asks.

## Completion

Finish with:

- Changelog status: generated or written.
- File path if written.
- Commit range.
- Missing evidence or vague commits that need human review.
- Next recommended Codex request: patch notes or release checklist.
