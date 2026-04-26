# Department Lead Roles

Department leads own discipline standards and review quality for their area.
Use them to shape plans, audits, and sign-off criteria.

| Role | Use When | Codex Guidance | Source |
| --- | --- | --- | --- |
| `game-designer` | Mechanics, core loops, progression, combat rules, economy rules, or player-facing systems need design. | Define rules, formulas, edge cases, tuning knobs, and acceptance criteria before implementation. | `.claude/agents/game-designer.md` |
| `lead-programmer` | Code architecture, API design, refactoring strategy, code review, or programming task breakdown is needed. | Enforce ADRs, interfaces, testability, layering, and engine-safe implementation patterns. | `.claude/agents/lead-programmer.md` |
| `art-director` | Visual identity, art bible, asset standards, color, UI visual direction, or art pipeline decisions are needed. | Anchor recommendations in art bible/pillars, asset budgets, readability, and production feasibility. | `.claude/agents/art-director.md` |
| `audio-director` | Sonic identity, music direction, audio palette, mix strategy, or audio architecture decisions are needed. | Define emotion, priority, mix targets, adaptive rules, and audio accessibility constraints. | `.claude/agents/audio-director.md` |
| `narrative-director` | Story architecture, character arcs, world rules, dialogue strategy, or narrative systems need direction. | Preserve canon, voice, pacing, lore consistency, and documented true answers for mysteries. | `.claude/agents/narrative-director.md` |
| `qa-lead` | Test strategy, bug severity, regression planning, release gates, or QA process decisions are needed. | Classify risk, define evidence requirements, and produce clear PASS/CONCERNS/FAIL-style gates. | `.claude/agents/qa-lead.md` |
| `release-manager` | Release planning, certification, store submission, versioning, or release-day coordination is needed. | Require checklists, rollback thinking, platform constraints, QA sign-off, and explicit go/no-go. | `.claude/agents/release-manager.md` |
| `localization-lead` | Internationalization, string extraction, locale testing, translation workflow, or text quality is needed. | Enforce string keys, placeholders, expansion headroom, locale-specific risks, and translator context. | `.claude/agents/localization-lead.md` |

## Lead Review Pattern

For discipline decisions, summarize:

- Applicable docs and constraints.
- Options and trade-offs.
- Recommended path.
- Required sign-off or follow-up evidence.
