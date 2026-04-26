# Prototypes Directory Instructions

Prototype standards are intentionally relaxed. The goal is learning quickly, not
shipping production-quality code.

## Allowed In Prototypes

- Hardcoded values.
- Minimal doc comments.
- Simple architecture.
- Singletons or global state.
- Copy-pasted code.
- Debug output.
- Placeholder art, audio, and data.

## Still Required

- Each prototype lives in `prototypes/[name]/`.
- Each prototype has a `README.md` with hypothesis, how to run, status, and
  findings.
- Prototype code must not be imported by production code.
- Prototypes must not modify files outside `prototypes/`.
- Prototypes must not be deployed or shipped.

## Promotion Rule

When a prototype succeeds, rewrite the production feature to normal standards.
Do not gradually clean prototype code into production code.
