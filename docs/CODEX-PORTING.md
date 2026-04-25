# Codex Porting Plan

This fork ports Claude Code Game Studios to Codex while preserving upstream
license and attribution.

## Current Status

- Fork renamed to `Codex-Game-Studios`.
- Original Claude Code assets remain under `.claude/`.
- Codex entry instructions exist in `AGENTS.md`.
- Directory-scoped Codex instructions exist in `src/`, `design/`, and `docs/`.
- Initial repo-local Codex skills exist in `.agents/skills/`.
- Ported starter workflows: `cgs-start`, `cgs-help`, `cgs-setup-engine`,
  `cgs-brainstorm`, `cgs-map-systems`, `cgs-design-system`,
  `cgs-design-review`, `cgs-gate-check`, `cgs-dev-story`,
  `cgs-create-architecture`, `cgs-architecture-decision`,
  `cgs-create-epics`, `cgs-create-stories`, `cgs-story-done`,
  `cgs-architecture-review`, `cgs-create-control-manifest`,
  `cgs-story-readiness`, `cgs-code-review`, `cgs-sprint-plan`,
  `cgs-qa-plan`, `cgs-smoke-check`, `cgs-regression-suite`,
  `cgs-test-setup`, `cgs-test-helpers`, `cgs-release-checklist`,
  `cgs-launch-checklist`, `cgs-changelog`, `cgs-patch-notes`, and
  `cgs-hotfix`.
- `.codex` is treated as a local Codex runtime file and ignored by Git.

## Porting Principles

- Preserve workflow intent, not tool-specific mechanics.
- Keep upstream files available until a Codex-native equivalent is tested.
- Mark Codex-specific behavior as unofficial.
- Prefer a small set of high-value Codex workflows before converting all 72
  original skills.
- Keep validation explicit and runnable from the terminal.

## Mapping

| Claude Code Asset | Codex Equivalent |
| --- | --- |
| `CLAUDE.md` | `AGENTS.md` |
| `directory/CLAUDE.md` | `directory/AGENTS.md` |
| `.claude/skills/*/SKILL.md` | Codex skills or workflow references |
| `.claude/agents/*.md` | Role prompt references and delegation guidance |
| `.claude/hooks/*.sh` | Explicit validation scripts or plugin hooks |
| `.claude/settings.json` | Instructions, scripts, and optional plugin manifest |
| `/slash-command` usage | Natural-language requests or Codex skill triggers |

## Recommended Migration Phases

### Phase 1: Foundation

- Add `AGENTS.md` and directory-scoped `AGENTS.md` files.
- Add this porting plan.
- Add README attribution and explain the fork status.
- Decide whether to package the port as a Codex plugin.

### Phase 2: Core Workflows

Port the smallest workflow set needed to use the project end-to-end:

- `start`: orient a new user and detect project state.
- `help`: identify current phase and next action.
- `setup-engine`: configure engine, language, platform, and preferences.
- `brainstorm`: create the game concept.
- `map-systems`: create the systems index.
- `design-system`: author one GDD.
- `gate-check`: validate phase transition readiness.
- `dev-story`: implement a production story.

### Phase 3: Role Library

Convert the 49 original agent files into compact role references. Codex should
use them to shape analysis and implementation, not as guaranteed named
subagents.

### Phase 4: Validation

Convert hooks into explicit checks:

- Session/project state check
- Commit and push safety checks
- Asset validation
- Skill structure validation
- Gap detection

### Phase 5: Full Catalog

Port the remaining skills by category: authoring, review, analysis, QA, sprint,
team orchestration, release, and utility.

## Known Differences From Claude Code

- Codex does not automatically expose Claude Code slash commands.
- Codex does not guarantee the same named subagent roster.
- Codex does not automatically run `.claude/settings.json` hooks.
- Interactive `AskUserQuestion` steps should become concise questions or
  reasonable assumptions, depending on risk.
- Codex can still use the same documents, templates, and workflow phase model.

## Next Concrete Step

Port the next production and bug-management workflows: `milestone-review`,
`retrospective`, `bug-report`, `bug-triage`, and `playtest-report`. Keep each
skill concise and load original `.claude/` source material only when needed.
