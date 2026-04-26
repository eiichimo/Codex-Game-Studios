# Assets Directory Instructions

Follow these standards when adding or editing art, audio, shader, VFX, and data
assets.

## Data Files

For `assets/data/**`:

- JSON files must be valid JSON.
- Filenames use lowercase with underscores and the pattern
  `[system]_[name].json`.
- JSON keys use camelCase consistently.
- Every data file needs a schema or corresponding design documentation.
- Numeric values need rationale in comments, companion docs, or the relevant
  GDD.
- No orphaned entries; data should be referenced by code or another data file.
- Version data files when making breaking schema changes.
- Optional fields need sensible defaults.

## Shaders

For `assets/shaders/**`:

- Use descriptive names with shader type or engine convention, such as
  `spatial_env_water.gdshader`, `SG_Env_Water`, or `M_Env_Water`.
- Name uniforms/parameters clearly and group related settings.
- Comment non-obvious calculations and document purpose at the top.
- Avoid magic numbers; use named constants or documented uniform values.
- Document target platform, render pipeline, and complexity budget.
- Minimize fragment texture samples, dynamic branching, texture reads in loops,
  and shader variants.
- Provide lower-quality fallbacks when required by target hardware.

## Validation

Run:

```bash
bash tools/codex-validate.sh assets
```
