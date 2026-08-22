# p0-16 Verify Result

- Status: `approved`
- Task backend: `main-thread coordinator`
- Verify task id: `main-thread`
- Launched: `2026-08-22`
- Last good stop: verification completed with no bounded correction list

## Verifier Outcome

The spec is correct and implementation-complete.

1. The live defect is still a detached realization surface in the authored real
   construction owners. Even after the earlier carrier-equality repair, each
   affected `Instances.lean` file still stops at “there exists a `RealModel`”
   instead of packaging the actual `RationalRealExtension` consumed by the
   rest of the real-number API.

2. The canonical owner files are the five real-construction registration
   modules under `LRA/NumberSystems/RealNumbers/Constructions/*/Instances.lean`.
   They are where the repo currently states that each construction realizes the
   real-number stage, so the repair belongs there rather than in
   `ConstructionModels.lean` or generated proof ledgers.

3. The repaired output type should mention both the actual rational source and
   the selected real extension. Using
   `LRA.NumberSystems.RealNumbers.RationalRealExtension` plus an explicit
   carrier equality is sufficient and matches the repo's existing
   rational/real packaging vocabulary.

4. One scoped validator/build pair is sufficient. The repair is contained to
   authored real-number modules and directly affected documentation under the
   same component router.

## Resolution

`p0-16` is ready for implementation on `main`: replace the five detached
   real-construction realization theorems with carrier-tied
   `RationalRealExtension` realization theorems, align the directly affected
   comments, then run the real-number validator and build gates before commit
   and push.
