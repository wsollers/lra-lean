# p0-02 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/Function`
- Build target: `LRA.Function.Calculus.Classes`
- Last good stop: spec frozen on disk and handed to verification

## Brief Summary

`p0-02` is already resolved in the canonical Lean theorem surface. The core repair landed earlier in commit `cefda27f` (`Fix injective indexed intersection theorem`): [LRA/Function/Calculus/Classes/Theorems.lean](/F:/repos/lra-lean/LRA/Function/Calculus/Classes/Theorems.lean:199) now states `ImageClassIndexedIntersectionOfInjective` with the required `[Nonempty Index]` hypothesis and an explanatory comment that names the empty-index failure. No additional Lean theorem, definition, or source comment change is required to make the mathematics correct.

The only remaining work for this P0 is queue closeout: record that the theorem is already fixed in-tree, keep the scoped success gate attached to the subject, and advance the open queue to `p0-03`. The generated inventory file [LRA/Function/ProofsToDo.md](/F:/repos/lra-lean/LRA/Function/ProofsToDo.md:1) still shows the old unrestricted statement, but it is explicitly generated and noncanonical, so it is not the source owner for this P0 and should not be hand-edited in this closeout pass.

## Exact Repair List

- No change is required to the theorem surface in [LRA/Function/Calculus/Classes/Theorems.lean](/F:/repos/lra-lean/LRA/Function/Calculus/Classes/Theorems.lean:199).
  `ImageClassIndexedIntersectionOfInjective` already has the exact necessary restriction:
  `{Index : Type w} [Nonempty Index]`.
- No change is required to [LRA/Function/Calculus/Classes/FailureModes.lean](/F:/repos/lra-lean/LRA/Function/Calculus/Classes/FailureModes.lean:47).
  `EmptyIndexedIntersectionImageFailure` and `SomeEmbeddingRealizesEmptyIndexedIntersectionImageFailure` already memorialize the reason the unrestricted theorem is false.
- No change is required to [LRA/Set/Interface/RelationLaws.lean](/F:/repos/lra-lean/LRA/Set/Interface/RelationLaws.lean:523).
  That generic relation theorem states only subset inclusion for indexed intersections, which is mathematically correct for arbitrary relations and does not assert the false injective equality.
- The implementation step for this P0 is limited to the persistent coordinator artifacts:
  [docs/p0-repair/status.md](/F:/repos/lra-lean/docs/p0-repair/status.md:1) and
  [docs/p0-repair/ledger.json](/F:/repos/lra-lean/docs/p0-repair/ledger.json:1).
  They must mark `p0-02` as already resolved in-tree and point the queue at `p0-03`.

## Acceptance Criteria

- [LRA/Function/Calculus/Classes/Theorems.lean](/F:/repos/lra-lean/LRA/Function/Calculus/Classes/Theorems.lean:199) continues to state:
  `theorem ImageClassIndexedIntersectionOfInjective {Index : Type w} [Nonempty Index] ...`
- The theorem comment above that declaration continues to explain why the nonempty-index hypothesis is essential.
- [LRA/Function/Calculus/Classes/FailureModes.lean](/F:/repos/lra-lean/LRA/Function/Calculus/Classes/FailureModes.lean:47) continues to expose the empty-index counterexample boundary.
- `python scripts/validate_structure.py --path LRA/Function` passes.
- `lake build LRA.Function.Calculus.Classes` passes.
- The persistent P0 tracker records `p0-02` as done and advances the next step to launching `p0-03` spec.

## Blockers Or Dependencies

No prerequisite P0 blocks this item. The theorem repair itself is already present in `main`, and the scoped validator/build gate passes against the current tree. The stale statement in the generated proof inventory is noncanonical and does not block closeout for this P0.
