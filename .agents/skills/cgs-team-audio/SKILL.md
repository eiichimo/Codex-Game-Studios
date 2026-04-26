---
name: cgs-team-audio
description: Use to coordinate a Codex Game Studios audio feature or area through direction, sound design, accessibility, technical integration, gameplay triggers, and asset planning. This is the Codex-native replacement for the original Claude Code `/team-audio` workflow.
metadata:
  short-description: Coordinate audio feature work
---

# Codex Game Studios Team Audio

This skill coordinates the audio pipeline for a feature or area. Do not spawn
subagents unless the user explicitly asks for delegation or parallel agent work;
otherwise synthesize the role perspectives locally.

## Required Input

Require a feature or area, such as `combat`, `main menu`, `forest biome`, or
`boss encounter`. If missing, ask for the target.

## Roles To Simulate Or Delegate

- Audio director: sonic identity, emotion, palette, music direction.
- Sound designer: SFX specs, audio events, mix groups, ducking.
- Accessibility specialist: captions, visual alternatives, sensitivity risks.
- Technical artist: middleware/native setup, buses, memory, audio-reactive VFX.
- Engine specialist: idiomatic engine audio implementation.
- Gameplay programmer: audio manager, triggers, adaptive music, tests.

## Inputs To Read

- Relevant GDDs under `design/gdd/`.
- `design/gdd/sound-bible.md`, if present.
- Existing audio docs and `assets/audio/`.
- `.claude/docs/technical-preferences.md`.
- Existing audio code, middleware config, and tests.
- Original source workflow, only if more detail is needed:
  `.claude/skills/team-audio/SKILL.md`.

## Pipeline

1. Context: summarize target, existing audio assets, design constraints, engine,
   and accessibility requirements.
2. Audio direction: define sonic identity, emotional tone, music/adaptive layer
   needs, mix priorities, and audio palette.
3. Sound design: list audio events, trigger conditions, categories, parameters,
   attenuation, variation, bus/mix group, and asset estimates.
4. Accessibility: identify critical audio cues, visual fallbacks, caption text,
   subtitle timing, and sensitivity risks.
5. Technical integration: choose middleware/native path, bus routing, memory
   budget, streaming/preload strategy, and engine-specific patterns.
6. Gameplay integration: define trigger ownership, audio manager/API needs,
   adaptive music rules, occlusion/reverb zones, and tests.
7. Documentation: ask before writing `design/gdd/audio-[feature].md`.

## Safety

- Do not communicate critical gameplay state by audio alone.
- Keep player-facing audio text localization-ready.
- Do not introduce middleware or architecture changes without explicit approval.
- Flag missing GDD or sound bible context instead of inventing canon.

## Completion

Finish with:

- Audio event count and key categories.
- Estimated asset count.
- Accessibility requirements.
- Technical integration tasks.
- Open questions and blockers.
- Recommended next request: asset spec, dev story, asset audit, or team polish.
