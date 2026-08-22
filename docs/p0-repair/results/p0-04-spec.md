# p0-04 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/Set/TG`
- Build target: `LRA.Set.TG`
- Last good stop: spec frozen on disk and implemented on the main thread

## Brief Summary

`p0-04` was still live. The public TG definition [IsGrothendieckUniverseFor](/F:/repos/lra-lean/LRA/Set/TG/Definitions.lean:94) already required both image closure and indexed-union closure, and [GrothendieckUniverseClosedUnderUnion](/F:/repos/lra-lean/LRA/Set/TG/GrothendieckUniverse/Theorems.lean:29) already documented the ordinary-union consequence of that indexed-union clause. But the primitive owner [LRA/Set/TG/Axioms/GrothendieckUniverse.lean](/F:/repos/lra-lean/LRA/Set/TG/Axioms/GrothendieckUniverse.lean:5) still stopped at image closure. That left the foundational TG contract strictly weaker than the definition and theorem layer built on top of it.

The repair scope is narrow and canonical: add the missing indexed-union closure clause to the TG Grothendieck-universe axiom so the primitive contract matches the public definition already exposed by the subject.

## Exact Repair List

- Update [LRA/Set/TG/Axioms/GrothendieckUniverse.lean](/F:/repos/lra-lean/LRA/Set/TG/Axioms/GrothendieckUniverse.lean:5).
  Extend the `GrothendieckUniverse` axiom with the missing clause:
  for every `I ∈ U` and every `family : TGSet -> TGSet` with `family i ∈ U` for each `i ∈ I`,
  there exists `union ∈ U` such that
  `x ∈ union <-> ∃ i ∈ I, x ∈ family i`.
- Do not weaken or restate [LRA/Set/TG/Definitions.lean](/F:/repos/lra-lean/LRA/Set/TG/Definitions.lean:94).
  It already has the correct Grothendieck-universe contract.
- Do not change [LRA/Set/TG/GrothendieckUniverse/Theorems.lean](/F:/repos/lra-lean/LRA/Set/TG/GrothendieckUniverse/Theorems.lean:29) except if required by fallout.
  Its theorem surface and explanatory comment are already aligned with the intended closure clause.
- Leave unrelated TG axioms and theorem modules untouched.

## Acceptance Criteria

- The primitive axiom in [LRA/Set/TG/Axioms/GrothendieckUniverse.lean](/F:/repos/lra-lean/LRA/Set/TG/Axioms/GrothendieckUniverse.lean:5) includes both:
  - indexed image closure
  - indexed union closure
- The axiom contract no longer lags behind [IsGrothendieckUniverseFor](/F:/repos/lra-lean/LRA/Set/TG/Definitions.lean:94).
- `python scripts/validate_structure.py --path LRA/Set/TG` passes.
- `lake build LRA.Set.TG` passes.
- The persistent P0 tracker records `p0-04` as done and advances the queue to launching `p0-05` spec.

## Blockers Or Dependencies

No prerequisite P0 blocked this item. The repair was localized to the TG universe axiom contract and did not depend on the earlier queue items beyond the repo already building.
