---
name: ue-performance-optimization
description: Use when a game has low FPS, hitches, long load times, high memory use, or when setting performance budgets, profiling, or optimizing levels, Blueprints, materials, lighting, VFX, or packaged builds in Unreal Engine.
---

# UE Performance Optimization

Measure first, change one thing, measure again.

## Iron law

**No optimization without a measurement.** Guessing optimizes the wrong thing.

## Process

1. **Set the budget:** target platform, resolution, frame rate (e.g. 60 FPS = 16.6 ms; 30 FPS = 33.3 ms).
2. **Baseline** in a representative, packaged-like scenario (not just the empty editor viewport). Record numbers.
3. **Find the bound:** `stat unit` shows Frame, Game, Draw, GPU. The largest relevant number is the bottleneck.
4. **Profile:** `stat game`, `stat gpu`, `ProfileGPU`, `stat scenerendering`, Unreal Insights, Session Frontend; Blueprint profiler for BP cost.
5. **Fix the biggest cost first;** change one thing at a time.
6. **Re-measure,** compare to baseline, keep a log of what helped.

## By bottleneck

**Game thread (CPU logic):** remove Tick, use timers/events; avoid `Get All Actors Of Class` in loops; cache references; reduce expensive Blueprint loops, casts and per-frame traces; pool frequently spawned actors; reduce actor count; check AI/perception/animation cost; Anim update rate optimization.

**Draw / render thread:** reduce draw calls and unique materials; instance repeated meshes (ISM/HISM); merge or use Nanite where suitable; culling and LODs; limit dynamic lights; fewer translucent layers.

**GPU:** expensive materials (instruction count, many texture samples); overdraw (particles, foliage, translucency); shadow cost; Lumen/Nanite/VSM settings scaled for target hardware; post-process cost; resolution and upscaling (TSR/DLSS/FSR options); texture streaming pool.

**Memory/loading:** texture sizes and streaming; soft references and async load; avoid hard-reference chains; audio compression; World Partition/streaming; Size Map and Reference Viewer to find bloat.

**Hitches:** shader compilation (PSO caching), spawning many actors at once, synchronous loads, garbage collection spikes, level streaming.

## Reporting

```
Target: 60 FPS on <hardware>
Before: Frame 24 ms (Game 6, Draw 4, GPU 22)
Bottleneck: GPU
Change: ...
After: ...
```

## Red flags

"This probably costs a lot" · optimizing in the editor viewport only · changing five things at once · lowering quality without telling the user · optimizing before the game is fun.
