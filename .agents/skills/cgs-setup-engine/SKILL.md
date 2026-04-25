---
name: cgs-setup-engine
description: Use to configure the game engine, language, platform targets, input methods, performance defaults, testing approach, and engine-specialist routing for Codex Game Studios. This is the Codex-native replacement for the original Claude Code `/setup-engine` workflow.
metadata:
  short-description: Configure game engine and project standards
---

# Codex Game Studios Setup Engine

This skill configures engine-specific project standards for Codex Game Studios.
It replaces Claude Code-specific behavior with Codex-readable files and explicit
edits.

## Supported Modes

Recognize these user intents:

- Full spec: "configure Godot 4.6" or "setup Unity 6".
- Engine only: "configure Unity"; verify the current stable version from
  official sources before writing.
- Guided: no engine chosen; recommend an engine based on concept and
  constraints.
- Refresh: update engine reference docs.
- Upgrade: migrate settings from one engine version to another.

When current/latest engine versions matter, verify from official release docs or
official engine websites before relying on memory.

## Files To Read

- `AGENTS.md`: Codex project-level instructions.
- `.claude/docs/technical-preferences.md`: current preferences file until a
  Codex-native equivalent exists.
- `design/gdd/game-concept.md`: genre, scope, platform, art style, and any
  engine recommendation.
- `docs/engine-reference/<engine>/VERSION.md`: pinned version if already set.
- Original source workflow, only if needed:
  `.claude/skills/setup-engine/SKILL.md`.

## Guided Recommendation

If no engine is chosen, gather only the missing critical facts:

- Prior engine experience.
- Target platform: PC, mobile, console, web, or multiple.
- Game shape: 2D, 3D, both, open-world, photorealistic, stylized, etc.
- Primary input: keyboard/mouse, gamepad, touch, mixed.
- Team size and experience.
- Language preference.
- Licensing constraints.

Use these practical defaults:

- Godot: strongest for 2D, solo/small teams, fast iteration, open source,
  contained stylized 3D.
- Unity: strongest for mobile, mid-scope 3D, console-oriented indie work,
  asset-store-heavy development, C# teams.
- Unreal: strongest for high-end 3D, open-world, photorealism, Blueprint-heavy
  prototyping, PC/console visual fidelity.

Present one primary recommendation and one alternative. The user chooses; do not
force a verdict.

## Language Selection

For Godot, ask whether the project primarily uses:

- GDScript: fastest native iteration.
- C#: stronger IDE/tooling, useful for C# experience or heavier logic.
- Both: advanced mixed setup.

Unity defaults to C#.

Unreal defaults to C++ plus Blueprint for gameplay prototyping.

## Edits To Make

Show a concise proposed changeset before editing. After confirmation, update:

- `AGENTS.md` Technology Stack section.
- `.claude/docs/technical-preferences.md` until a Codex-native preferences file
  is introduced.
- `docs/engine-reference/<engine>/VERSION.md` if pinning or upgrading the
  engine version.

Do not edit `CLAUDE.md` unless the user wants to keep Claude Code compatibility
updated too.

## Technical Preferences Content

Populate:

- Engine and language.
- Rendering and physics stack when known.
- Target platforms and input methods.
- Naming conventions.
- Performance budgets if the user accepts defaults.
- Testing framework recommendation.
- Engine specialist routing, translated as Codex role guidance rather than
  guaranteed named subagents.

Do not add speculative dependencies. Add a library or addon only when the
project is actively integrating it.

## Safe Defaults

If the user accepts defaults:

- Target framerate: 60 FPS.
- Frame budget: 16.6 ms.
- Gamepad support:
  - PC only: Partial recommended.
  - Console: Full.
  - Mobile: None.
  - PC + Console: Full.
  - PC + Mobile: Partial.
  - Web: Partial.
- Touch support:
  - Mobile: Full.
  - PC + Mobile: Full.
  - Web: Partial.
  - Otherwise: None.

Testing defaults:

- Godot: GUT or engine-native test harness, depending on language choice.
- Unity: Unity Test Framework/NUnit.
- Unreal: Unreal Automation Testing Framework.

## Verification

After editing:

- Re-read modified sections.
- Confirm placeholders were replaced only where intended.
- If JSON or shell files were touched, run relevant syntax checks.
- Report any version information that could not be verified from official
  sources.
