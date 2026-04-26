# Specialist Roles

Specialists handle focused implementation, content, QA, operations, and analysis
work. Use them as targeted lenses when a request falls inside their domain.

| Role | Use When | Codex Guidance | Source |
| --- | --- | --- | --- |
| `gameplay-programmer` | Implementing mechanics, player systems, combat, or interactive features. | Translate GDDs into data-driven, testable gameplay code and flag design deviations. | `.claude/agents/gameplay-programmer.md` |
| `engine-programmer` | Core engine systems, rendering, physics, memory, resource loading, scene management, or hot paths. | Prioritize performance, stability, engine constraints, and clean framework boundaries. | `.claude/agents/engine-programmer.md` |
| `ai-programmer` | Behavior trees, state machines, pathfinding, perception, decisions, NPC/enemy behavior, or AI debugging. | Make behavior debuggable, data-driven, performant, and testable. | `.claude/agents/ai-programmer.md` |
| `network-programmer` | Multiplayer replication, lag compensation, matchmaking, protocols, bandwidth, or synchronization. | Prefer server-authoritative, versioned, secure, and bandwidth-aware designs. | `.claude/agents/network-programmer.md` |
| `tools-programmer` | Editor extensions, authoring tools, debug utilities, pipeline automation, or workflow improvements. | Optimize developer workflow without coupling tools to runtime code unnecessarily. | `.claude/agents/tools-programmer.md` |
| `ui-programmer` | Menus, HUDs, inventory screens, dialogue boxes, UI framework code, widgets, or binding. | UI displays state and emits events; it must not own gameplay state. Keep text localizable and input accessible. | `.claude/agents/ui-programmer.md` |
| `systems-designer` | Combat formulas, progression curves, crafting, status effects, interaction matrices, or detailed subsystem rules. | Provide math, edge cases, tuning ranges, and acceptance criteria. | `.claude/agents/systems-designer.md` |
| `level-designer` | Level layout, encounters, pacing, spatial puzzles, navigation, or area flow. | Connect layout to pillars, narrative purpose, landmarks, accessibility, and testable completion criteria. | `.claude/agents/level-designer.md` |
| `economy-designer` | Resource economies, loot systems, sinks/faucets, progression curves, markets, or reward balance. | Analyze fairness, exploit paths, degeneracy, and non-predatory monetization. | `.claude/agents/economy-designer.md` |
| `technical-artist` | Shaders, VFX, rendering optimization, art pipeline tools, or art-to-engine integration. | Balance visual quality with performance budgets and production constraints. | `.claude/agents/technical-artist.md` |
| `sound-designer` | SFX specs, audio events, mix documentation, sound categories, or feedback sounds. | Define triggers, parameters, variation, mix groups, attenuation, and accessibility alternatives. | `.claude/agents/sound-designer.md` |
| `writer` | Dialogue, lore entries, item text, ability descriptions, environmental text, or player-facing copy. | Preserve voice, string-key readiness, placeholder safety, and localization headroom. | `.claude/agents/writer.md` |
| `world-builder` | Factions, cultures, history, geography, ecology, world rules, or lore consistency. | Track canon levels, contradictions, timelines, and environmental storytelling opportunities. | `.claude/agents/world-builder.md` |
| `ux-designer` | User flows, interaction patterns, onboarding, accessibility, information architecture, or input design. | Define player intent, flow, states, edge cases, input paths, and accessibility requirements. | `.claude/agents/ux-designer.md` |
| `prototyper` | Fast throwaway experiments, concept validation, vertical slices, or mechanic probes. | Isolate work under `prototypes/`, document hypothesis/results, and avoid production-code leakage. | `.claude/agents/prototyper.md` |
| `performance-analyst` | Profiling, memory analysis, frame-time investigation, optimization strategy, or metrics tracking. | Require budgets, before/after evidence, and risk-ranked recommendations. | `.claude/agents/performance-analyst.md` |
| `devops-engineer` | Build pipelines, CI/CD, branching strategy, deployment automation, or test infrastructure. | Prefer reproducible builds, clear scripts, safe release controls, and CI observability. | `.claude/agents/devops-engineer.md` |
| `analytics-engineer` | Telemetry, event tracking, dashboards, A/B tests, funnels, or player behavior analysis. | Define events, schemas, success metrics, privacy constraints, and dashboard validation. | `.claude/agents/analytics-engineer.md` |
| `security-engineer` | Cheat prevention, exploits, save security, networking security, authentication, or player data privacy. | Treat security as release risk; classify severity and avoid exposing secrets or unsafe patterns. | `.claude/agents/security-engineer.md` |
| `qa-tester` | Test cases, bug reports, regression checklists, manual QA evidence, or execution documentation. | Produce reproducible steps, expected/actual results, evidence requirements, and clear verdicts. | `.claude/agents/qa-tester.md` |
| `accessibility-specialist` | Remapping, text scaling, colorblind support, screen readers, subtitles, cognitive load, or accessibility audits. | Do not rely on a single sensory channel; identify blockers and alternatives. | `.claude/agents/accessibility-specialist.md` |
| `live-ops-designer` | Seasons, events, battle passes, content cadence, retention, or live service economy. | Balance engagement with ethical monetization, content capacity, and analytics readiness. | `.claude/agents/live-ops-designer.md` |
| `community-manager` | Patch notes, announcements, social posts, player feedback, community bug triage, or crisis communication. | Translate internal changes into clear player-facing language and sentiment-aware messaging. | `.claude/agents/community-manager.md` |
