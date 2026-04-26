# ADR-0001: Codex Plugin Packaging Strategy

## Status

Accepted

## Context

Codex Game Studios is an unofficial Codex-oriented fork of Claude Code Game
Studios. The fork now has:

- 72 repo-local Codex skills in `.agents/skills/`.
- 49 Codex role references in `.agents/roles/`.
- Explicit validation workflows in `tools/codex-validate.sh`.
- Codex-readable standards in `docs/STANDARDS.md` and directory `AGENTS.md`
  files.

The remaining packaging question is whether the project should ship as a Codex
plugin or remain a repository template.

## Decision

Use a repository-local template as the primary distribution path. Defer Codex
plugin packaging.

## Rationale

- The workflow catalog is project-specific and benefits from living beside game
  docs, production records, assets, tests, and engine references.
- `.agents/skills/`, `.agents/roles/`, `AGENTS.md`, and directory `AGENTS.md`
  files already provide Codex-readable behavior without a plugin install step.
- The original hook behavior has been converted into explicit validation
  commands. The only strong plugin use case is future automation for
  notifications, compaction recovery, push interception, and subagent audit
  logging.
- Deferring plugin packaging avoids duplicating skill and role docs in two
  distribution formats before the template has stabilized.

## Consequences

- Users consume this project by cloning, forking, or using it as a template.
- Plugin-specific metadata is intentionally not added yet.
- Future plugin work should call the explicit validation entrypoints instead of
  duplicating hook logic.
- If plugin packaging becomes necessary, create a new issue with a concrete
  install/update workflow and automation scope.

## Revisit Criteria

Reconsider plugin packaging when one of these becomes true:

- Codex needs automatic hook-like behavior for this project.
- Users need to install the studio workflows into many existing repositories
  without adopting this template structure.
- The skill/role/standards catalog stabilizes enough to package without frequent
  repo-template changes.
- A documented plugin distribution and update workflow is required by users.
