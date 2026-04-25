---
name: cgs-security-audit
description: Use to audit Codex Game Studios security risks across save files, serialization, networking, input validation, data exposure, cheat vectors, and dependencies, producing prioritized findings and release recommendations. This is the Codex-native replacement for the original Claude Code `/security-audit` workflow.
metadata:
  short-description: Audit security risk
---

# Codex Game Studios Security Audit

This skill audits common game security failure modes. It is not a replacement
for a human penetration test for competitive, monetized, or multiplayer games.

## Scope

- `full`: all categories; default before release.
- `network`: multiplayer/network only.
- `save`: save file and serialization only.
- `input`: input validation only.
- `quick`: high-severity checks only.

If no scope is provided, use `full`.

## Inputs To Read

- `.claude/docs/technical-preferences.md` for engine, language, platforms, and
  multiplayer scope.
- Source directories, config files, `assets/data/`, plugins, addons, and
  third-party/vendor folders.
- Release docs, QA bug reports, and prior security audits, if present.
- Original source workflow, only if more detail is needed:
  `.claude/skills/security-audit/SKILL.md`.

Do not assume a named security subagent exists. Use Codex delegation only when
the user explicitly asks for parallel agent work.

## Audit Categories

Check applicable categories:

- Save and serialization: blind deserialization, path traversal, missing bounds
  checks, missing tamper detection, dynamic code execution near load paths.
- Network and multiplayer: client authority, packet size/type/range validation,
  rate limiting, token handling, release debug endpoints.
- Input validation: user-controlled paths, log injection, numeric bounds,
  backend achievement/stat writes.
- Data exposure: secrets, tokens, verbose release logs, sensitive player data,
  internal file paths.
- Cheat and anti-tamper: editable progression values, leaderboard validation,
  DLC/entitlement trust, multiplayer server authority.
- Dependencies: plugins, addons, third-party libraries, source, version, known
  risk notes when available.

## Classify Findings

Severity:

- `CRITICAL`: remote code execution, data breach, or trivially exploitable
  multiplayer integrity break.
- `HIGH`: save tampering bypass, credential exposure, server authority bypass.
- `MEDIUM`: limited input validation, client-side cheat enablement,
  information disclosure.
- `LOW`: defense-in-depth hardening.

Status: `Open`, `Accepted Risk`, or `Out of Scope`.

For multiplayer, treat HIGH integrity findings as release blockers.

## Report

Generate:

- Executive Summary by severity.
- Release recommendation: `CLEAR TO SHIP`, `FIX CRITICALS FIRST`, or
  `DO NOT SHIP`.
- CRITICAL/HIGH/MEDIUM/LOW findings with category, file/line, description,
  attack scenario, remediation, and effort.
- Accepted Risk.
- Dependency Inventory.
- Remediation Priority Order.
- Re-audit trigger.

## Write Output

Present executive summary and CRITICAL/HIGH findings first. After approval or
explicit write request, create `production/security/` and write
`production/security/security-audit-[date].md`.

## Completion

Finish with:

- audit status and path if written.
- blocking findings.
- release recommendation.
- next recommended Codex request: remediate, quick re-audit, gate check, or
  launch checklist.
