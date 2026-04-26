# Codex Validation

Codex does not automatically run the original Claude Code hooks in
`.claude/hooks/`. This repository keeps those hooks as upstream source material
and exposes explicit validation commands instead.

## Quick Commands

```bash
bash tools/codex-validate.sh baseline
bash tools/codex-validate.sh all
bash tools/codex-validate.sh session
bash tools/codex-validate.sh staged
bash tools/codex-validate.sh assets
bash tools/codex-validate.sh skills
bash tools/codex-validate.sh roles
bash tools/codex-validate.sh standards
```

Use `baseline` before commits that touch documentation, skills, roles, hooks, or
settings. Use `all` before release or template maintenance changes.

## Hook Migration Decisions

| Original Hook | Codex Equivalent | Decision |
| --- | --- | --- |
| `session-start.sh` | `bash tools/codex-validate.sh session` | Manual session-orientation check. |
| `detect-gaps.sh` | `bash tools/codex-validate.sh session` | Manual gap-detection check. |
| `validate-commit.sh` | `bash tools/codex-validate.sh staged` | Manual staged-change check before commit. |
| `validate-push.sh` | Documentation reminder | Source material only until a plugin implements push interception. |
| `validate-assets.sh` | `bash tools/codex-validate.sh assets` | Manual asset naming and JSON check. |
| `validate-skill-change.sh` | `bash tools/codex-validate.sh skills` | Manual Codex skill catalog check. |
| `pre-compact.sh` | Documentation/checklist | Source material; Codex compaction integration requires plugin support. |
| `post-compact.sh` | Documentation/checklist | Source material; Codex compaction integration requires plugin support. |
| `notify.sh` | Deferred plugin candidate | Source material; notification behavior is platform-specific. |
| `session-stop.sh` | Documentation/checklist | Source material; automatic session-stop logging requires plugin support. |
| `log-agent.sh` | Deferred plugin candidate | Source material; Codex subagent audit logging requires plugin support. |
| `log-agent-stop.sh` | Deferred plugin candidate | Source material; Codex subagent audit logging requires plugin support. |

## What Baseline Checks

`baseline` verifies:

- `.claude/hooks/*.sh` shell syntax.
- `.claude/settings.json` JSON validity.
- `.agents/skills/` contains 72 skills with required metadata.
- `.agents/roles/` maps all 49 original role files.
- `docs/STANDARDS.md` maps all 11 original path-scoped rule files.

## What All Checks

`all` runs `baseline`, then:

- Asset naming warnings and JSON validity for `assets/data/*.json`.
- Staged commit validation using the original `validate-commit.sh` logic.

## Plugin Boundary

These commands intentionally do not claim automatic hook execution. If this fork
becomes a Codex plugin later, the plugin should call these explicit validation
entrypoints rather than duplicating hook logic.
