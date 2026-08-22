# p0-16 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/NumberSystems/RealNumbers`
- Build target: `LRA.NumberSystems.RealNumbers`
- Last good stop: spec frozen on disk and ready for implementation

## Brief Summary

`p0-16` is live in the authored real-construction registration owners under
`LRA/NumberSystems/RealNumbers/Constructions/*/Instances.lean`.

Those files no longer return a completely detached bare `RealModel`, but they
still stop at existential carrier-equality theorems such as
`DedekindCarrierRealModelExists` and `CauchyCarrierRealModelExists`. The
current surface still leaves the actual real-extension package external to the
construction owner. Downstream real-number theory in this repo is phrased over
`RationalRealExtension`, so the construction owners should package their own
carrier-certified real extension directly.

## Exact Repair List

- Change
  [LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Instances.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Instances.lean:1).
  Replace `CauchyCarrierRealModelExists` with a carrier-tied realization
  theorem whose result packages a
  `LRA.NumberSystems.RealNumbers.RationalRealExtension rationalSystem` and
  states that its selected real carrier is exactly
  `Carrier rationalSystem.FieldModel absoluteValueData`.

- Change
  [LRA/NumberSystems/RealNumbers/Constructions/Cantor/Instances.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Cantor/Instances.lean:1),
  [Dedekind/Instances.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Dedekind/Instances.lean:1),
  [PrimitiveIntervals/Instances.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/PrimitiveIntervals/Instances.lean:1),
  and
  [Dyadic/Instances.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Instances.lean:1)
  the same way. Each owner should certify a
  `RationalRealExtension` over the actual rational source and tie its
  `RealModel.Carrier` to the construction carrier (`Cut ...`, `Carrier ...`,
  or `Expansion` as appropriate).

- Change the directly affected authored comments that still name the old
  existence-theorem surface:
  [LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Behavior.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Behavior.lean:1)
  and
  [LRA/NumberSystems/RealNumbers/ProofOrder.md](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/ProofOrder.md:1).
  Update them to describe the repaired `RationalRealExtension` packaging
  surface instead of the old carrier-equality `RealModel` existence theorems.

- Do not widen into `ConstructionModels.lean`, `EffectiveCauchy`, or the
  integer/rational construction routers. `p0-16` is closed by repairing the
  live authored real-construction registration owners only.

## Acceptance Criteria

- Each affected real construction exposes a theorem whose output includes a
  `RationalRealExtension` built from the actual rational input data.
- Each such theorem states that the extension's selected real carrier is
  exactly the construction carrier owned by that file.
- No affected comment or proof-order note still describes the old detached
  `...CarrierRealModelExists` surface as canonical.
- `python scripts/validate_structure.py --path LRA/NumberSystems/RealNumbers`
  passes.
- `lake build LRA.NumberSystems.RealNumbers` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item.

`p0-17` will later strengthen the source-strength assumptions behind some real
constructions, but `p0-16` can close now by making the current realization
surface carrier-visible and construction-tied without changing those later
input contracts yet.
