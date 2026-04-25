---
name: cgs-asset-spec
description: Use to generate Codex Game Studios per-asset visual specifications and AI generation prompts from an art bible plus system, level, or character source documents, updating asset spec files and the master asset manifest after approval. This is the Codex-native replacement for the original Claude Code `/asset-spec` workflow.
metadata:
  short-description: Generate asset specs
---

# Codex Game Studios Asset Spec

This skill turns approved design context into producible asset specifications.

## Target

Accept:

- `system:[name]`
- `level:[name]`
- `character:[name]`

If no target is provided, check `design/assets/asset-manifest.md` for the first
Needed asset context without specs. If no manifest exists, ask for a target.

Review modes:

- `full`: include art and technical constraint passes.
- `lean`: art direction only.
- `solo`: derive from existing docs without delegation.

Use Codex delegation only when the user explicitly asks for parallel agent work.

## Required Inputs

- `design/art/art-bible.md`; stop if missing.
- `.claude/docs/technical-preferences.md`.
- Source doc:
  - system: `design/gdd/[target].md`
  - level: `design/levels/[target].md`
  - character: `design/narrative/characters/[target].md` or matching narrative
    file.
- Existing `design/assets/asset-manifest.md`, if present.
- Existing `design/assets/specs/*.md`, to avoid duplicate shared assets.
- Original source workflow, only if more detail is needed:
  `.claude/skills/asset-spec/SKILL.md`.

## Identify Assets

Extract explicit and implied assets:

- sprites and 2D art.
- VFX and particles.
- environment props, tiles, backgrounds, skyboxes.
- UI elements and custom fonts.
- audio SFX, music, ambient loops.
- 3D meshes, materials, textures.

Present the grouped asset list and confirm before writing specs.

## Generate Specs

For each asset, produce:

- stable `ASSET-NNN` ID, continuing from the manifest.
- category.
- dimensions, polycount, texture resolution, file format, and naming.
- visual or audio description.
- art bible anchors by section.
- generation prompt for visual assets, or sonic brief for audio.
- status: Needed.

Surface conflicts between desired art direction and technical constraints; do
not silently resolve them.

## Write Output

After approval or explicit write request:

- create `design/assets/specs/`.
- write `design/assets/specs/[target-name]-assets.md`.
- create or update `design/assets/asset-manifest.md`.

Ask separately before updating the manifest if the user did not explicitly
request both files.

## Completion

Finish with:

- spec path if written.
- manifest update status.
- assets specced.
- reused/shared assets.
- next recommended Codex request: another asset spec or asset audit.
