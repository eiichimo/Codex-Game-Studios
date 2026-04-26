# Codex Role References

This directory contains compact Codex-oriented references for the 49 original
Claude Code Game Studios agent roles.

Use these files as role lenses for analysis, review, and implementation. They
do not guarantee that a same-named Codex subagent exists. Only use subagents
when the user explicitly asks for delegation or parallel agent work; otherwise
apply the relevant role guidance locally.

## Navigation

- `directors.md`: 3 top-level decision and coordination roles.
- `department-leads.md`: 8 discipline leads.
- `specialists.md`: 23 non-engine implementation and content specialists.
- `engine-specialists.md`: 15 Godot, Unity, and Unreal specialists.

## Source Mapping

Each role maps back to one upstream file in `.claude/agents/[role].md`. Read the
upstream file only when you need full original detail; keep normal Codex context
small by starting with these compact references.

## Delegation Policy

- Default: use the role reference to structure your own reasoning and output.
- If the user explicitly requests delegation or parallel agent work, create
  concrete bounded subtasks and provide the relevant role context.
- Do not claim that Claude Code tools, `subagent_type`, or the original agent
  roster are available in Codex.
- For design direction, architecture, and multi-file rewrites, preserve user
  control and ask before locking decisions.
