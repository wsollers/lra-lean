# p0-17 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/NumberSystems/RealNumbers`
- Build target: `LRA.NumberSystems.RealNumbers`
- Last good stop: spec frozen on disk and ready for implementation

## Brief Summary

`p0-17` is live in the active real-construction input surfaces, not in the
later dedicated defect queues for Dedekind natural-map repair (`p0-18`) or
Cauchy absolute-value-law strengthening (`p0-19`).

The current real-construction pipeline still exposes several live declaration
surfaces over bare `DenselyOrderedFieldModel` input, even after `p0-16`
repaired the realization packaging. The most important remaining source-strength
gap is the Cauchy metric/input record itself: it is still parameterized by an
arbitrary dense ordered field, and downstream real-construction comparison
theorems still accept that generic source directly.

## Exact Repair List

- Change
  [LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Carrier.lean:1),
  [Equivalence.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Equivalence.lean:1),
  [WellFoundedness.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Cauchy/WellFoundedness.lean:1),
  [Operations.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Operations.lean:1),
  [WellDefinedness.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Cauchy/WellDefinedness.lean:1),
  and
  [Instances.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Instances.lean:1).
  Retarget the current `RationalMetricData` owner and all dependent Cauchy
  public surfaces from a bare `DenselyOrderedFieldModel` parameter to an actual
  `LRA.NumberSystems.RationalNumbers.RationalNumberSystem`. Keep the existing
  metric-law fields unchanged in this P0; only the source-strength input type
  changes here.

- Change
  [LRA/NumberSystems/RealNumbers/Constructions\\Cantor\\Behavior.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Cantor/Behavior.lean:1)
  and
  [PrimitiveIntervals\\Behavior.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/PrimitiveIntervals/Behavior.lean:1).
  Retarget the live Cauchy-comparison theorem surfaces to accept an actual
  `RationalNumberSystem` plus the updated Cauchy metric data over that rational
  system, instead of a bare dense ordered field.

- Change
  [LRA/NumberSystems/RealNumbers/Constructions\\Dedekind\\Behavior.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Dedekind/Behavior.lean:1)
  only as far as needed to make the active embedded-rationals/final-summary
  surfaces consume an actual `RationalNumberSystem`. Do not repair the
  arbitrary `natural_carrier`/`natural_to_rational` Archimedean theorem beyond
  the parameter threading needed for consistency; that bounded theorem repair is
  `p0-18`.

- Change
  [LRA/NumberSystems/RealNumbers/Constructions\\Dyadic\\Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Carrier.lean:145)
  and
  [Dyadic\\WellDefinedness.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Dyadic/WellDefinedness.lean:1)
  so the dyadic transport record and its Cauchy-value theorems use the updated
  Cauchy metric-data type over an actual rational system.

- Align directly affected authored comments/docs that still describe the old
  generic-dense-field input surface:
  [LRA/NumberSystems/RealNumbers/ProofOrder.md](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/ProofOrder.md:84)
  and any touched owner comments above.

- Do not widen into `LRA/NumberSystems/RealNumbers/ConstructionModels.lean`.
  That file is an abstract comparison layer explicitly kept outside the
  construction pipeline. Do not add the stronger multiplicative/order
  compatibility axioms to `RationalMetricData` in this P0; that is `p0-19`.

## Acceptance Criteria

- The active Cauchy metric/input record is parameterized by an actual
  `RationalNumberSystem`, not by a bare `DenselyOrderedFieldModel`.
- The active Cauchy quotient/operation/equivalence surfaces thread that actual
  rational-system input consistently.
- The active Cantor, PrimitiveIntervals, and Dedekind behavior/summary surfaces
  that compare against or summarize the real constructions no longer accept a
  bare dense ordered field as their rational source.
- The dyadic transport record and value theorems use the updated Cauchy input
  type.
- `python scripts/validate_structure.py --path LRA/NumberSystems/RealNumbers`
  passes.
- `lake build LRA.NumberSystems.RealNumbers` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item.

The remaining source-strength gaps are intentionally split:
- `p0-18` repairs the specific arbitrary-natural-map Dedekind theorem.
- `p0-19` strengthens the substantive absolute-value/metric laws for the
  Cauchy construction.
