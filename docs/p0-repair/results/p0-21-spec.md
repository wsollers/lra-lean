# p0-21 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/NumberSystems/RealNumbers`
- Build target: `LRA.NumberSystems.RealNumbers`
- Last good stop: `2026-08-23`: spec frozen on disk and ready for implementation

## Brief Summary

`p0-21` is partly pre-repaired on current `main`. The live
PrimitiveIntervals owner files already removed the former fake self-comparison
theorem and the tautological final summary proposition, and
`Instances.lean` already states the carrier-tied
`PrimitiveIntervalsRealizesRationalRealExtension` theorem.

The remaining live defect is authoritative documentation drift. The active
PrimitiveIntervals proof-order notes still describe the deleted behavior
theorems as if they existed, and one migration note still points to the old
comparison theorem name instead of the current
`PersistentOverlapIffEndpointDifferenceIsNull`.

## Exact Repair List

- Change
  [LRA/NumberSystems/RealNumbers/ProofOrder.md](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/ProofOrder.md:29)
  only as far as needed to describe the current PrimitiveIntervals surface
  accurately:
  use the live theorem name
  `PersistentOverlapIffEndpointDifferenceIsNull`, describe the removed fake
  self-comparison / tautological summary as already gone, and keep
  `PrimitiveIntervalsRealizesRationalRealExtension` as the authoritative
  carrier-tied real-number certificate.

- Change
  [LRA/NumberSystems/RealNumbers/Constructions/PrimitiveIntervals/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/PrimitiveIntervals/Carrier.lean:24)
  only to repoint its migration note from the deleted theorem name
  `persistent_overlap_iff_endpoint_null` to the live behavior theorem
  `PersistentOverlapIffEndpointDifferenceIsNull`.

- Do not reopen the PrimitiveIntervals theorem statements in
  `Behavior.lean`, `Laws.lean`, or `Instances.lean` unless the build forces a
  minimal aligned change. The active code surface already carries the bounded
  `p0-21` repair.

## Acceptance Criteria

- No authoritative PrimitiveIntervals note in the active real-number
  construction docs still describes the deleted self-comparison theorem or the
  removed tautological final summary as live declarations.
- The active documentation points to
  `PersistentOverlapIffEndpointDifferenceIsNull` and
  `PrimitiveIntervalsRealizesRationalRealExtension`.
- `python scripts/validate_structure.py --path LRA/NumberSystems/RealNumbers`
  passes.
- `lake build LRA.NumberSystems.RealNumbers` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item.

The underlying PrimitiveIntervals theorem surface is already repaired on
current `main`, so `p0-21` should close by aligning the authoritative owner
documentation with that live surface.
