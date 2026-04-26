# Engine Specialist Roles

Engine specialists validate engine-specific patterns, APIs, asset pipelines, and
performance risks. Check `docs/engine-reference/` before relying on engine APIs.

## Godot

| Role | Use When | Codex Guidance | Source |
| --- | --- | --- | --- |
| `godot-specialist` | Godot architecture, node/scene structure, signals, resources, engine APIs, or optimization. | Validate patterns against the pinned Godot version and project language choice. | `.claude/agents/godot-specialist.md` |
| `godot-gdscript-specialist` | GDScript typing, signals, coroutines, patterns, and performance. | Enforce static typing where useful, idiomatic signals, and clear node ownership. | `.claude/agents/godot-gdscript-specialist.md` |
| `godot-csharp-specialist` | Godot C#/.NET patterns, exports, signal delegates, async, and type-safe node access. | Keep C# idiomatic to both .NET and Godot 4. | `.claude/agents/godot-csharp-specialist.md` |
| `godot-gdextension-specialist` | GDExtension, native code, C++/Rust bindings, custom nodes, or performance-critical native work. | Keep native boundaries clean and justify native complexity with performance evidence. | `.claude/agents/godot-gdextension-specialist.md` |
| `godot-shader-specialist` | Godot shaders, materials, particles, post-processing, or rendering customization. | Balance shader quality with Godot renderer constraints and target hardware. | `.claude/agents/godot-shader-specialist.md` |

## Unity

| Role | Use When | Codex Guidance | Source |
| --- | --- | --- | --- |
| `unity-specialist` | Unity architecture, subsystems, MonoBehaviour vs DOTS, Input System, UI Toolkit, or optimization. | Validate against pinned Unity version and chosen render pipeline. | `.claude/agents/unity-specialist.md` |
| `unity-dots-specialist` | ECS, Jobs, Burst, hybrid renderer, or data-oriented gameplay. | Use DOTS only where complexity is justified; require data layout and performance rationale. | `.claude/agents/unity-dots-specialist.md` |
| `unity-shader-specialist` | Shader Graph, HLSL, VFX Graph, URP/HDRP, post-processing, or visual effects. | Keep render-pipeline compatibility and performance budgets explicit. | `.claude/agents/unity-shader-specialist.md` |
| `unity-addressables-specialist` | Addressables, asset loading/unloading, memory, content catalogs, remote content, or bundles. | Track lifetime, memory pressure, catalogs, and load-time risk. | `.claude/agents/unity-addressables-specialist.md` |
| `unity-ui-specialist` | UI Toolkit, UGUI, data binding, runtime UI performance, input, or cross-platform adaptation. | Keep UI responsive, accessible, and independent from gameplay state ownership. | `.claude/agents/unity-ui-specialist.md` |

## Unreal

| Role | Use When | Codex Guidance | Source |
| --- | --- | --- | --- |
| `unreal-specialist` | Unreal architecture, Blueprint vs C++, GAS, Enhanced Input, Niagara, or engine subsystems. | Validate against pinned Unreal version and avoid unnecessary custom systems. | `.claude/agents/unreal-specialist.md` |
| `ue-gas-specialist` | Gameplay Ability System abilities, effects, attributes, tags, ability tasks, or prediction. | Keep GAS architecture consistent and avoid ad hoc ability state outside GAS. | `.claude/agents/ue-gas-specialist.md` |
| `ue-blueprint-specialist` | Blueprint architecture, Blueprint/C++ boundaries, maintainability, or optimization. | Prevent Blueprint spaghetti; define ownership and C++ boundaries clearly. | `.claude/agents/ue-blueprint-specialist.md` |
| `ue-replication-specialist` | Unreal networking, replicated properties, RPCs, prediction, relevancy, net serialization, or bandwidth. | Keep server authority, responsiveness, and bandwidth constraints explicit. | `.claude/agents/ue-replication-specialist.md` |
| `ue-umg-specialist` | UMG/CommonUI widgets, input routing, styling, binding, or UI optimization. | Follow Unreal UI best practices and support platform input paths. | `.claude/agents/ue-umg-specialist.md` |
