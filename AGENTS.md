# Codex Game Studios -- Agent Instructions

This repository is an unofficial Codex-oriented fork of Claude Code Game Studios.
Keep the original MIT license and attribution intact.

## Repository Purpose

This is a game-development workflow template for Codex. It adapts the original
Claude Code assets into Codex-readable project instructions, skills, role
references, docs, and validation scripts.

The original upstream assets remain under `.claude/` for attribution and source
material. Ported Codex-native assets live under `.agents/` and normal repo docs.

- `.claude/agents/` contains the original studio role definitions.
- `.claude/skills/` contains the original slash-command workflows.
- `.claude/hooks/` contains the original validation and session scripts.
- `.claude/rules/` contains the original path-scoped standards.
- `.claude/docs/` contains workflow catalogs, templates, and technical guidance.
- `.agents/skills/` contains Codex-native ports of the 72 original workflows.
- `.agents/roles/` contains compact Codex role references for the 49 original
  agent definitions.

When porting, preserve the intent but remove Claude Code-specific assumptions.

## Codex Porting Rules

- Convert Claude slash-command workflows into Codex skills or normal procedural
  instructions. Do not assume `/command` invocation exists unless a Codex skill
  explicitly provides it.
- Convert named Claude subagents into Codex delegation guidance. Codex may use
  available subagent roles only when the user explicitly asks for delegation or
  parallel agent work.
- Use `.agents/roles/` as the first stop for role-shaped analysis. Read
  `.claude/agents/` only when full upstream detail is needed.
- Convert `AskUserQuestion` steps into concise user questions. In default
  Codex operation, make reasonable assumptions unless a decision is genuinely
  blocking or risky.
- Convert Claude hooks into explicit scripts or checklist-driven validation.
  Do not assume automatic hook execution unless a Codex plugin implements it.
- Preserve collaborative control for design work: ask before locking major game
  direction, architecture decisions, or multi-file workflow rewrites.
- For implementation work, prefer completing the change end-to-end, including
  verification, unless the user asks only for planning or analysis.

## Game Project Workflow

Use the original seven-phase pipeline unless the user asks for a lighter flow:

1. Concept
2. Systems Design
3. Technical Setup
4. Pre-Production
5. Production
6. Polish
7. Release

For detailed phase definitions, read `.claude/docs/workflow-catalog.yaml` and
`docs/WORKFLOW-GUIDE.md`.

## Technology Stack

- **Engine**: [CHOOSE: Godot 4 / Unity / Unreal Engine 5]
- **Language**: [CHOOSE: GDScript / C# / C++ / Blueprint]
- **Version Control**: Git with trunk-based development
- **Build System**: [SPECIFY after choosing engine]
- **Asset Pipeline**: [SPECIFY after choosing engine]

Use `.claude/docs/technical-preferences.md` until a Codex-native preferences
file exists.

## Project Structure

- `src/`: game source code
- `assets/`: art, audio, VFX, shaders, and data files
- `design/`: GDDs, narrative docs, level designs, balance docs, UX specs
- `docs/`: technical documentation, ADRs, engine references
- `tests/`: automated and manual test assets
- `tools/`: build and pipeline tooling
- `prototypes/`: isolated throwaway prototypes
- `production/`: sprints, milestones, releases, session state

## Coding Standards

- Keep gameplay values data-driven; avoid hardcoded balance numbers.
- Prefer testable system boundaries over hidden singletons.
- Document public APIs in game code.
- Add or update ADRs for new architecture decisions.
- Keep generated or throwaway prototype code under `prototypes/`, not `src/`.
- Check `docs/engine-reference/` before relying on engine APIs.
- Read `docs/STANDARDS.md` and the nearest directory `AGENTS.md` before editing
  path-sensitive code, assets, tests, prototypes, or design docs.

## Validation

Run the most relevant checks available for the current engine or workflow. If no
engine is configured, validate documentation and shell scripts only.

Suggested baseline checks:

```bash
bash tools/codex-validate.sh baseline
```

## Attribution

This fork is based on Claude Code Game Studios by Donchitos. The upstream
license is MIT; retain `LICENSE` and clearly mark Codex-specific changes as
unofficial.
