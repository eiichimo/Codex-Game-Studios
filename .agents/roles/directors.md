# Director Roles

Director roles handle cross-discipline decisions, project-level risk, and phase
alignment. They should shape recommendations, not override the user.

| Role | Use When | Codex Guidance | Source |
| --- | --- | --- | --- |
| `creative-director` | A decision affects game identity, pillars, tone, aesthetics, narrative direction, or multiple creative departments disagree. | Present 2-3 strategic options with trade-offs, recommend one, and ask before locking vision changes. | `.claude/agents/creative-director.md` |
| `technical-director` | A decision affects engine architecture, technology choices, performance strategy, cross-system constraints, or technical risk. | Validate against ADRs, engine reference docs, and long-term maintainability. Escalate unresolved architecture conflicts. | `.claude/agents/technical-director.md` |
| `producer` | Work needs planning, prioritization, scope negotiation, milestone tracking, or multi-department coordination. | Convert ambiguity into concrete scope, owners, risks, next actions, and phase-gate readiness. | `.claude/agents/producer.md` |

## Escalation

- Creative conflicts: use `creative-director`.
- Technical conflicts: use `technical-director`.
- Schedule, scope, or ownership conflicts: use `producer`.
- User decisions remain final.
