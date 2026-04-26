---
name: cgs-team-live-ops
description: Use to coordinate a Codex Game Studios live-ops season, event, or post-launch content update through scope, narrative, economy, analytics, content writing, communication, ethics review, and production handoff. This is the Codex-native replacement for the original Claude Code `/team-live-ops` workflow.
metadata:
  short-description: Coordinate live-ops planning
---

# Codex Game Studios Team Live Ops

This skill plans seasons, events, and live content updates. Do not spawn
subagents unless the user explicitly asks for delegation or parallel agent work.

## Required Input

Require a season name or event description. If missing, ask for the target.

## Roles To Simulate Or Delegate

- Live-ops designer: season structure, cadence, retention hooks.
- Economy designer: reward track, currencies, pricing, pity/bad-luck protection.
- Analytics engineer: success metrics, A/B tests, telemetry, dashboards.
- Community manager: player-facing messaging and communication cadence.
- Narrative director: seasonal theme, world framing, story hook.
- Writer: event text, item names, challenge text, flavor copy.

## Inputs To Read

- `design/gdd/game-concept.md`.
- Existing `design/live-ops/`, seasons, economy rules, and ethics policy.
- Current economy/balance docs.
- Narrative/lore docs relevant to the event.
- Telemetry/analytics docs and community notes.
- Original source workflow, only if more detail is needed:
  `.claude/skills/team-live-ops/SKILL.md`.

## Pipeline

1. Scope: define event type, duration, theme direction, content list, reuse vs
   new content, and retention loop.
2. Narrative: connect the event to the world, story hook, lore threads, and
   player-facing premise.
3. Economy: design reward tracks, free/premium value, seasonal currency, store
   rotation, pricing, random elements, and bad-luck protection.
4. Analytics: define participation, retention, completion, conversion, and
   satisfaction metrics; specify telemetry events and dashboard needs.
5. Content writing: draft event names, reward descriptions, challenge text,
   flavor text, and any in-game narrative copy.
6. Communication: plan teaser, launch, mid-season, final-week, known-issues,
   and platform-specific copy.
7. Ethics review: check `design/live-ops/ethics-policy.md`. If missing, flag
   `ETHICS REVIEW SKIPPED`. If violated, block `COMPLETE` until revised or
   explicitly overridden with rationale.
8. Documentation: ask before writing season, analytics, and comms docs under
   `design/live-ops/`.

## Output Paths

Suggested outputs:

- `design/live-ops/seasons/S[N]_[name].md`.
- `design/live-ops/seasons/S[N]_[name]_analytics.md`.
- `design/live-ops/seasons/S[N]_[name]_comms.md`.

## Completion

Finish with:

- Season/event theme and scope.
- Economy health and ethics status.
- Success metrics and instrumentation gaps.
- Content inventory.
- Communication plan.
- Open decisions and blockers.
- Recommended next request: design review, sprint plan, or team release.
