# p0-23 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/NumberSystems/RealNumbers`
- Build target: `LRA.NumberSystems.RealNumbers`
- Last good stop: `2026-08-23`: spec frozen on disk and ready for implementation

## Brief Summary

`p0-23` is already substantially repaired in the active owner code on current
`main`. The construction is no longer named `Computable`; it lives under
`EffectiveCauchy`, carries modulus-tracked rational Cauchy approximations,
uses a genuine quotient by an equivalence relation, deliberately exports no
arithmetic closure theorem, and explicitly refuses any detached `RealModel`
realization or countability claim.

The remaining live defect is authoritative documentation drift.
`LRA/NumberSystems/RealNumbers/ProofOrder.md` still describes the old
`Computable` construction as a direct wrapper with closure/countability
theorems and a `RealModel` instance, which no longer matches the owner code.

## Exact Repair List

- Change
  [LRA/NumberSystems/RealNumbers/ProofOrder.md](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/ProofOrder.md:1)
  only as far as needed to describe the live `EffectiveCauchy` owner surface
  accurately:
  rename the backend/part from `Computable` to `EffectiveCauchy`,
  replace the stale carrier names (`EffectiveApproximation`,
  `ComputableReal`) with the live
  `EffectiveCauchyApproximation` / `EffectiveCauchyReal`,
  describe the quotient/setoid and equivalence theorem accurately,
  remove the stale arithmetic-closure and countability theorem inventory, and
  state that no detached `RealModel` realization is currently asserted.

- In the top summary of that file, stop claiming that all six construction
  packages realize `RealModel` via `Instances.lean`. The five classical
  real-construction packages still target `RationalRealExtension`/`RealModel`;
  `EffectiveCauchy` is intentionally only an effective-form quotient package
  at present.

- Do not reopen the `EffectiveCauchy` Lean declarations themselves unless the
  build requires a minimal aligned comment change. The bounded `p0-23` repair
  is documentation-only because the active owner code is already on the
  repaired side of the review note.

## Acceptance Criteria

- No authoritative `RealNumbers` owner note still documents a `Computable`
  construction with closure/countability theorems or a `ComputableRealizesRealModel`
  instance.
- The active documentation points to `EffectiveCauchyApproximation`,
  `Equivalent`, `ApproximationSetoid`, `EffectiveCauchyReal`, and the absence
  of a detached `RealModel` realization.
- `python scripts/validate_structure.py --path LRA/NumberSystems/RealNumbers`
  passes.
- `lake build LRA.NumberSystems.RealNumbers` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item.

The owner code already carries the intended effective-Cauchy semantics and has
removed the false completeness/countability surface, so `p0-23` should close
by aligning the authoritative proof-order documentation with that live code.
