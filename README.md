<p align="center">
  <h1 align="center">Codex Game Studios</h1>
  <p align="center">
    Unofficial Codex-oriented port of Claude Code Game Studios.
    <br />
    Game development workflows, studio roles, and quality gates for Codex.
  </p>
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="MIT License"></a>
  <a href=".claude/agents"><img src="https://img.shields.io/badge/source%20roles-49-blueviolet" alt="49 source roles"></a>
  <a href=".agents/skills"><img src="https://img.shields.io/badge/Codex%20skills-72-green" alt="72 Codex skills"></a>
  <a href=".claude/hooks"><img src="https://img.shields.io/badge/source%20hooks-12-orange" alt="12 source hooks"></a>
  <a href=".claude/rules"><img src="https://img.shields.io/badge/source%20rules-11-red" alt="11 source rules"></a>
  <a href=".agents/skills"><img src="https://img.shields.io/badge/ported%20for-Codex-111827" alt="Ported for Codex"></a>
  <a href="https://www.buymeacoffee.com/donchitos3"><img src="https://img.shields.io/badge/Buy%20Me%20a%20Coffee-Support%20this%20project-FFDD00?logo=buymeacoffee&logoColor=black" alt="Buy Me a Coffee"></a>
  <a href="https://github.com/sponsors/Donchitos"><img src="https://img.shields.io/badge/GitHub%20Sponsors-Support%20this%20project-ea4aaa?logo=githubsponsors&logoColor=white" alt="GitHub Sponsors"></a>
</p>

---

> **Fork status:** This repository is an unofficial Codex-oriented fork of
> [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios)
> by Donchitos. The original project is MIT licensed. This fork keeps the
> upstream `.claude/` assets as source material while adding Codex-readable
> instructions such as `AGENTS.md`.

> **Porting status:** The original 72 workflow skills now have repo-local Codex
> ports under `.agents/skills/`. Claude Code assets remain available under
> `.claude/` as upstream source material while agents, hooks, and rules continue
> to be adapted for Codex.

## Why This Exists

Building a game solo with AI is powerful — but a single chat session has no structure. No one stops you from hardcoding magic numbers, skipping design docs, or writing spaghetti code. There's no QA pass, no design review, no one asking "does this actually fit the game's vision?"

The original **Claude Code Game Studios** solves this by giving your AI session the structure of a real studio. Instead of one general-purpose assistant, you get 49 specialized roles organized into a studio hierarchy — directors who guard the vision, department leads who own their domains, and specialists who do the hands-on work.

**Codex Game Studios** adapts that structure for Codex. The active workflow catalog lives in `.agents/skills/`, and the original `.claude/` assets remain as source material while role references, hooks, and rules are ported.

The result: you still make every decision, but now you have a team that asks the right questions, catches mistakes early, and keeps your project organized from first brainstorm to launch.

---

## Table of Contents

- [What's Included](#whats-included)
- [Studio Roles](#studio-roles)
- [Workflow Catalog](#workflow-catalog)
- [Getting Started](#getting-started)
- [Upgrading](#upgrading)
- [Project Structure](#project-structure)
- [How It Works](#how-it-works)
- [Design Philosophy](#design-philosophy)
- [Customization](#customization)
- [Platform Support](#platform-support)
- [Community](#community)
- [Supporting This Project](#supporting-this-project)
- [License](#license)

---

## What's Included

| Category | Count | Description |
|----------|-------|-------------|
| **Codex Skills** | 72 | Repo-local workflows under `.agents/skills/` for onboarding, design, architecture, stories, QA, release, and team coordination |
| **Original Agent Roles** | 49 | Upstream role definitions across design, programming, art, audio, narrative, QA, and production, pending Codex role-reference conversion |
| **Original Hooks** | 12 | Upstream validation scripts under `.claude/hooks/`; in Codex they are source material until explicit scripts or a plugin implement them |
| **Original Rules** | 11 | Upstream path-scoped standards under `.claude/rules/`; Codex equivalents are being moved into AGENTS/docs guidance |
| **Templates** | 39 | Document templates for GDDs, UX specs, ADRs, sprint plans, HUD design, accessibility, and more |

## Studio Roles

The original role model is organized into three tiers, matching how real studios
operate. In Codex, treat these as role perspectives and review responsibilities.
Do not assume named Claude Code subagents exist; delegate only when the user
explicitly asks for subagents or parallel agent work.

```
Tier 1 — Directors (Opus)
  creative-director    technical-director    producer

Tier 2 — Department Leads (Sonnet)
  game-designer        lead-programmer       art-director
  audio-director       narrative-director    qa-lead
  release-manager      localization-lead

Tier 3 — Specialists (Sonnet/Haiku)
  gameplay-programmer  engine-programmer     ai-programmer
  network-programmer   tools-programmer      ui-programmer
  systems-designer     level-designer        economy-designer
  technical-artist     sound-designer        writer
  world-builder        ux-designer           prototyper
  performance-analyst  devops-engineer       analytics-engineer
  security-engineer    qa-tester             accessibility-specialist
  live-ops-designer    community-manager
```

### Engine Specialists

The template includes original role sets for all three major engines. Use them
as engine-specific guidance while the Codex role library is being ported:

| Engine | Lead Agent | Sub-Specialists |
|--------|-----------|-----------------|
| **Godot 4** | `godot-specialist` | GDScript, Shaders, GDExtension |
| **Unity** | `unity-specialist` | DOTS/ECS, Shaders/VFX, Addressables, UI Toolkit |
| **Unreal Engine 5** | `unreal-specialist` | GAS, Blueprints, Replication, UMG/CommonUI |

## Workflow Catalog

The upstream project exposes these as Claude Code slash commands. In this fork,
the Codex equivalents are `cgs-*` skills under `.agents/skills/`; invoke them
with natural-language requests. The original slash names remain useful as a
catalog of workflow intent:

**Onboarding & Navigation**
`/start` `/help` `/project-stage-detect` `/setup-engine` `/adopt`

**Game Design**
`/brainstorm` `/map-systems` `/design-system` `/quick-design` `/review-all-gdds` `/propagate-design-change`

**Art & Assets**
`/art-bible` `/asset-spec` `/asset-audit`

**UX & Interface Design**
`/ux-design` `/ux-review`

**Architecture**
`/create-architecture` `/architecture-decision` `/architecture-review` `/create-control-manifest`

**Stories & Sprints**
`/create-epics` `/create-stories` `/dev-story` `/sprint-plan` `/sprint-status` `/story-readiness` `/story-done` `/estimate`

**Reviews & Analysis**
`/design-review` `/code-review` `/balance-check` `/content-audit` `/scope-check` `/perf-profile` `/tech-debt` `/gate-check` `/consistency-check`

**QA & Testing**
`/qa-plan` `/smoke-check` `/soak-test` `/regression-suite` `/test-setup` `/test-helpers` `/test-evidence-review` `/test-flakiness` `/skill-test` `/skill-improve`

**Production**
`/milestone-review` `/retrospective` `/bug-report` `/bug-triage` `/reverse-document` `/playtest-report`

**Release**
`/release-checklist` `/launch-checklist` `/changelog` `/patch-notes` `/hotfix`

**Creative & Content**
`/prototype` `/onboard` `/localize`

**Team Orchestration** (coordinate multiple role perspectives on a single feature)
`/team-combat` `/team-narrative` `/team-ui` `/team-release` `/team-polish` `/team-audio` `/team-level` `/team-live-ops` `/team-qa`

## Codex Usage

This fork provides repo-local Codex skills in `.agents/skills/`:

- `cgs-start` — first-time onboarding and workflow routing
- `cgs-help` — read-only "what should I do next?" guidance
- `cgs-project-stage-detect` — read-only project stage and gap detection
- `cgs-adopt` — brownfield template adoption audit
- `cgs-setup-engine` — engine, language, platform, and standards setup
- `cgs-brainstorm` — concept ideation into `design/gdd/game-concept.md`
- `cgs-map-systems` — systems decomposition into `design/gdd/systems-index.md`
- `cgs-design-system` — section-by-section GDD authoring for one system
- `cgs-design-review` — design/GDD readiness review
- `cgs-gate-check` — phase transition readiness verdict
- `cgs-dev-story` — story implementation with tests and acceptance coverage
- `cgs-create-architecture` — master architecture blueprint creation
- `cgs-architecture-decision` — ADR creation and retrofit
- `cgs-create-epics` — convert systems/modules into epics
- `cgs-create-stories` — break an epic into implementable stories
- `cgs-story-done` — verify and close implemented stories
- `cgs-architecture-review` — architecture coverage and engine compatibility review
- `cgs-create-control-manifest` — generate programmer rules from Accepted ADRs
- `cgs-story-readiness` — check if stories are implementation-ready
- `cgs-code-review` — implementation code review
- `cgs-sprint-plan` — create, update, or summarize sprint plans
- `cgs-sprint-status` — fast read-only sprint progress snapshot
- `cgs-qa-plan` — generate sprint/feature/story QA plans
- `cgs-smoke-check` — smoke readiness gate before QA handoff
- `cgs-regression-suite` — audit and maintain regression coverage
- `cgs-test-setup` — scaffold engine-specific test infrastructure
- `cgs-test-helpers` — generate test helper utilities
- `cgs-soak-test` — create extended play soak test protocols
- `cgs-test-evidence-review` — evaluate automated and manual test evidence
- `cgs-test-flakiness` — detect and classify flaky tests
- `cgs-skill-test` — validate repo-local Codex skills
- `cgs-skill-improve` — improve one Codex skill with a test-fix-retest loop
- `cgs-release-checklist` — pre-release validation checklist
- `cgs-launch-checklist` — full launch readiness checklist
- `cgs-changelog` — internal and player-facing changelog generation
- `cgs-patch-notes` — public patch notes drafting
- `cgs-hotfix` — emergency S1/S2 hotfix workflow
- `cgs-day-one-patch` — launch day-one patch planning
- `cgs-milestone-review` — milestone progress and go/no-go review
- `cgs-retrospective` — sprint or milestone retrospective
- `cgs-bug-report` — bug filing, verification, and closure workflow
- `cgs-bug-triage` — open bug prioritization and trend report
- `cgs-playtest-report` — playtest template and feedback analysis
- `cgs-scope-check` — read-only scope creep review
- `cgs-estimate` — task effort estimate with confidence
- `cgs-perf-profile` — performance risk and hotspot analysis
- `cgs-security-audit` — release security risk audit
- `cgs-tech-debt` — technical debt scan, register, and report
- `cgs-quick-design` — lightweight spec for small design changes
- `cgs-prototype` — isolated throwaway prototype workflow
- `cgs-art-bible` — visual identity and asset standards authoring
- `cgs-asset-spec` — per-asset specs and generation prompts
- `cgs-asset-audit` — read-only asset compliance audit
- `cgs-content-audit` — planned-vs-implemented content gap audit
- `cgs-consistency-check` — cross-GDD registry consistency check
- `cgs-balance-check` — balance data and formula analysis
- `cgs-ux-design` — collaborative UX spec authoring
- `cgs-ux-review` — read-only UX readiness review
- `cgs-review-all-gdds` — holistic cross-GDD review
- `cgs-propagate-design-change` — ADR impact analysis after GDD changes
- `cgs-reverse-document` — generate docs from existing implementation
- `cgs-localize` — localization pipeline workflows
- `cgs-onboard` — role/area onboarding document generation
- `cgs-team-combat` — coordinate combat feature delivery
- `cgs-team-ui` — coordinate UI feature delivery
- `cgs-team-qa` — coordinate QA cycles and sign-off
- `cgs-team-release` — coordinate release readiness and deployment planning
- `cgs-team-polish` — coordinate release-quality polish passes
- `cgs-team-audio` — coordinate audio feature delivery
- `cgs-team-level` — coordinate level or area design
- `cgs-team-live-ops` — coordinate seasons and live events
- `cgs-team-narrative` — coordinate narrative content delivery

In Codex, use natural-language requests instead of Claude Code slash commands:

```text
Start Codex Game Studios onboarding.
What should I do next in this game project?
Detect the current project stage.
Audit this existing project for Codex Game Studios adoption.
Configure this project for Godot 4.6 with GDScript.
Brainstorm a game concept from this seed: cozy space salvaging.
Map the systems for the current game concept.
Design the next system GDD.
Review design/gdd/combat-system.md for implementation readiness.
Run a gate check for the Concept to Systems Design transition.
Implement production/epics/foundation/STORY-001.md.
Create the architecture document from the approved GDDs.
Create an ADR for event bus architecture.
Create Foundation layer epics.
Break the combat epic into stories.
Verify story-001 is done.
Review architecture coverage for the current GDDs.
Generate the control manifest from accepted ADRs.
Check readiness for all stories in the current sprint.
Review the files changed by the current story.
Create a new sprint plan from ready Foundation stories.
Show sprint status.
Generate a QA plan for the current sprint.
Run a smoke check for the current sprint.
Audit the regression suite.
Set up tests for the configured engine.
Create test helpers for the combat system.
Create a 2h soak test protocol focused on stability.
Review test evidence for the current sprint.
Scan test logs for flaky tests.
Validate all Codex Game Studios skills.
Improve the cgs-qa-plan skill.
Generate a release checklist for PC.
Run a dry-run launch checklist for July 15.
Generate the changelog for version 0.3.0.
Write detailed patch notes for version 0.3.0.
Start a hotfix workflow for BUG-142.
Plan a day-one patch for version 1.0.0.
Review the current milestone.
Create a retrospective for sprint 3.
File a bug report for this crash description.
Triage open bugs for the current sprint.
Analyze playtest notes at production/qa/raw-notes/session-04.md.
Check scope creep for sprint 3.
Estimate this inventory refactor.
Profile performance risk for the combat system.
Run a quick security audit.
Scan technical debt and propose register updates.
Create a quick design spec for a jump-height tuning change.
Prototype this grappling-hook concept.
Author the art bible from the current game concept.
Generate asset specs for system:combat.
Audit all assets for naming and manifest compliance.
Audit content gaps for all MVP systems.
Check GDD consistency against the entity registry.
Run a balance check for the economy.
Design the inventory UX spec.
Review all UX specs for implementation readiness.
Review all GDDs before architecture.
Propagate design changes from design/gdd/combat.md.
Reverse-document design from src/gameplay/combat.
Run localization status.
Create onboarding for a new QA contributor.
Coordinate a combat team pass for a melee parry system.
Coordinate a UI team pass for the inventory screen.
Coordinate QA for the current sprint.
Coordinate release readiness for version 0.3.0.
Coordinate a polish pass for combat feel.
Coordinate audio design for the forest biome.
Coordinate level design for the tutorial area.
Coordinate a live-ops event for winter festival.
Coordinate narrative work for the boss intro scene.
```

The original Claude Code workflows remain available under `.claude/` as source
material and attribution history. The active Codex workflow ports are under
`.agents/skills/`.

## Getting Started

### Prerequisites

- [Git](https://git-scm.com/)
- Codex access in your local development environment
- **Recommended**: [jq](https://jqlang.github.io/jq/) and Python 3 for validation scripts

The original hook scripts fail gracefully if optional tools are missing. In
Codex, run validation explicitly unless a future plugin wires automation.

### Setup

1. **Clone or use as template**:
   ```bash
   git clone https://github.com/eiichimo/Codex-Game-Studios.git my-game
   cd my-game
   ```

2. **Start Codex** from the repository root.

3. **Ask for onboarding**:
   ```text
   Start Codex Game Studios onboarding.
   ```

   Or jump directly to a workflow if you already know what you need:
   - `Brainstorm a game concept from this seed: ...`
   - `Configure this project for Godot 4.6 with GDScript.`
   - `Detect the current project stage.`

## Upgrading

Already using an older version of this template? See [UPGRADING.md](UPGRADING.md)
for step-by-step migration instructions, a breakdown of what changed between
versions, and which files are safe to overwrite vs. which need a manual merge.

## Project Structure

```
AGENTS.md                           # Codex repository instructions
.agents/
  skills/                           # 72 Codex workflow skills
CLAUDE.md                           # Upstream Claude Code configuration source
.claude/
  settings.json                     # Upstream Claude Code settings source
  agents/                           # 49 original agent role definitions
  skills/                           # 72 original slash command workflows
  hooks/                            # 12 original hook scripts
  rules/                            # 11 original path-scoped standards
  statusline.sh                     # Status line script (context%, model, stage, epic breadcrumb)
  docs/
    workflow-catalog.yaml           # 7-phase pipeline definition (read by /help)
    templates/                      # 39 document templates
src/                                # Game source code
assets/                             # Art, audio, VFX, shaders, data files
design/                             # GDDs, narrative docs, level designs
docs/                               # Technical documentation and ADRs
tests/                              # Test suites (unit, integration, performance, playtest)
tools/                              # Build and pipeline tools
prototypes/                         # Throwaway prototypes (isolated from src/)
production/                         # Sprint plans, milestones, release tracking
```

## How It Works

### Role Coordination

The upstream role model follows a structured delegation model:

1. **Vertical delegation** — directors delegate to leads, leads delegate to specialists
2. **Horizontal consultation** — same-tier agents can consult each other but can't make binding cross-domain decisions
3. **Conflict resolution** — disagreements escalate up to the shared parent (`creative-director` for design, `technical-director` for technical)
4. **Change propagation** — cross-department changes are coordinated by `producer`
5. **Domain boundaries** — agents don't modify files outside their domain without explicit delegation

### Collaborative, Not Autonomous

This is **not** an auto-pilot system. Every workflow and role perspective follows a strict collaboration protocol:

1. **Ask** — agents ask questions before proposing solutions
2. **Present options** — agents show 2-4 options with pros/cons
3. **You decide** — the user always makes the call
4. **Draft** — agents show work before finalizing
5. **Approve** — nothing gets written without your sign-off

You stay in control. The workflows provide structure and expertise, not autonomy.

Codex uses this model as guidance. It may still coordinate work by role, but it
must not assume the original named subagent roster is available.

### Validation And Safety

The original Claude Code hooks are preserved under `.claude/hooks/`. They do
not automatically run in Codex unless a future plugin implements that behavior.
Use them as explicit validation scripts or source material:

| Hook | Original Trigger / Use | What It Does |
|------|---------|--------------|
| `validate-commit.sh` | Commit validation source | Checks for hardcoded values, TODO format, JSON validity, design doc sections |
| `validate-push.sh` | Push validation source | Warns on pushes to protected branches |
| `validate-assets.sh` | Asset validation source | Validates naming conventions and JSON structure for `assets/` |
| `session-start.sh` | Session orientation source | Shows current branch and recent commits |
| `detect-gaps.sh` | Gap detection source | Detects fresh projects and missing design docs when code or prototypes exist |
| `pre-compact.sh` | Before compaction | Preserves session progress notes |
| `post-compact.sh` | After compaction | Reminds agents to restore session state from `active.md` |
| `notify.sh` | Notification event | Shows Windows toast notification via PowerShell |
| `session-stop.sh` | Session close | Archives `active.md` to session log and records git activity |
| `log-agent.sh` | Agent spawned | Audit trail source for subagent invocation |
| `log-agent-stop.sh` | Agent stops | Audit trail source for subagent completion |
| `validate-skill-change.sh` | Skill change validation source | Advises running skill validation after workflow changes |

Suggested baseline checks:

```bash
bash -n .claude/hooks/*.sh
python3 -m json.tool .claude/settings.json
```

`settings.json` remains upstream Claude Code source material. Do not assume its
permission rules apply to Codex.

### Path-Scoped Rules

The original path-scoped rules describe standards by file location. In Codex,
they are guidance until each rule is moved into AGENTS/docs equivalents:

| Path | Enforces |
|------|----------|
| `src/gameplay/**` | Data-driven values, delta time usage, no UI references |
| `src/core/**` | Zero allocations in hot paths, thread safety, API stability |
| `src/ai/**` | Performance budgets, debuggability, data-driven parameters |
| `src/networking/**` | Server-authoritative, versioned messages, security |
| `src/ui/**` | No game state ownership, localization-ready, accessibility |
| `design/gdd/**` | Required 8 sections, formula format, edge cases |
| `tests/**` | Test naming, coverage requirements, fixture patterns |
| `prototypes/**` | Relaxed standards, README required, hypothesis documented |

## Design Philosophy

This template is grounded in professional game development practices:

- **MDA Framework** — Mechanics, Dynamics, Aesthetics analysis for game design
- **Self-Determination Theory** — Autonomy, Competence, Relatedness for player motivation
- **Flow State Design** — Challenge-skill balance for player engagement
- **Bartle Player Types** — Audience targeting and validation
- **Verification-Driven Development** — Tests first, then implementation

## Customization

This is a **template**, not a locked framework. Everything is meant to be customized:

- **Add/remove role references** — keep only the disciplines your project needs
- **Edit role guidance** — tune behavior and project-specific knowledge
- **Modify Codex skills** — adjust workflows under `.agents/skills/`
- **Add standards** — create AGENTS/docs guidance for your directory structure
- **Tune validation** — adjust scripts or create a plugin if you need automation
- **Pick your engine** — use the Godot, Unity, or Unreal agent set (or none)
- **Set review intensity** — `full` (all director gates), `lean` (phase gates only), or `solo` (none). Set during onboarding or edit `production/review-mode.txt`.

## Platform Support

The original hook scripts were designed for **Windows 10** with Git Bash and use
POSIX-compatible patterns (`grep -E`, not `grep -P`) with fallbacks for missing
tools. Codex usage is repository-based and should work on macOS, Linux, and WSL
where the referenced shell tools are available.

## Community

- **This fork** — [Issues](https://github.com/eiichimo/Codex-Game-Studios/issues) for Codex port work
- **Upstream** — [Claude Code Game Studios discussions](https://github.com/Donchitos/Claude-Code-Game-Studios/discussions) for the original project community

---

## Supporting This Project

Claude Code Game Studios is free and open source. If it saves you time or helps you ship your game, consider supporting continued development:

<p>
  <a href="https://www.buymeacoffee.com/donchitos3"><img src="https://img.shields.io/badge/Buy%20Me%20a%20Coffee-FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black" alt="Buy Me a Coffee"></a>
  &nbsp;
  <a href="https://github.com/sponsors/Donchitos"><img src="https://img.shields.io/badge/GitHub%20Sponsors-ea4aaa?style=for-the-badge&logo=githubsponsors&logoColor=white" alt="GitHub Sponsors"></a>
</p>

- **[Buy Me a Coffee](https://www.buymeacoffee.com/donchitos3)** — one-time support
- **[GitHub Sponsors](https://github.com/sponsors/Donchitos)** — recurring support through GitHub

Sponsorships help fund time spent maintaining skills, adding new agents, keeping up with Claude Code and engine API changes, and responding to community issues.

---

*Unofficial Codex-oriented fork of Claude Code Game Studios. Original project by Donchitos; Codex-specific changes are maintained in this fork.*

## License

MIT License. See [LICENSE](LICENSE) for details.
