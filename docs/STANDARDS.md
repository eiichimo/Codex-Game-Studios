# Codex Standards

These standards are the Codex-readable equivalent of the original
`.claude/rules/` path-scoped rules. The original files remain as upstream source
material; use this document and directory `AGENTS.md` files during Codex work.

## Source Mapping

| Original Rule | Codex Location | Status |
| --- | --- | --- |
| `.claude/rules/gameplay-code.md` | `src/AGENTS.md` | Ported |
| `.claude/rules/engine-code.md` | `src/AGENTS.md` | Ported |
| `.claude/rules/ai-code.md` | `src/AGENTS.md` | Ported |
| `.claude/rules/network-code.md` | `src/AGENTS.md` | Ported |
| `.claude/rules/ui-code.md` | `src/AGENTS.md` | Ported |
| `.claude/rules/design-docs.md` | `design/AGENTS.md` | Ported |
| `.claude/rules/narrative.md` | `design/AGENTS.md` | Ported |
| `.claude/rules/data-files.md` | `assets/AGENTS.md` | Ported |
| `.claude/rules/shader-code.md` | `assets/AGENTS.md` | Ported |
| `.claude/rules/test-standards.md` | `tests/AGENTS.md` | Ported |
| `.claude/rules/prototype-code.md` | `prototypes/AGENTS.md` | Ported |

## Cross-Cutting Rules

- Keep gameplay behavior traceable to GDDs, ADRs, or quick specs.
- Keep balance and tuning values data-driven unless working in `prototypes/`.
- Check `docs/engine-reference/` before relying on engine APIs.
- Ask before changing major game direction, architecture, or multi-file workflow
  structure.
- Add tests or manual evidence for behavior changes.
- Do not claim automatic Claude Code rule enforcement in Codex; these standards
  are instructions and review criteria.
