# p0-24 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/NumberSystems/RationalNumbers`
- Build target: `LRA.NumberSystems.RationalNumbers`; `LRA.NumberSystems.RealNumbers`
- Last good stop: `2026-08-23`: spec frozen on disk and ready for implementation

## Brief Summary

`p0-24` is already substantially repaired in the active owner code on current
`main`.

- Finite rational evaluation is no longer the old vacuous `FiniteValue`
  surface; it is the recursive relation
  `CoefficientsEvaluateTo`/`FiniteSimpleContinuedFractionEvaluatesTo` in
  `LRA/NumberSystems/RationalNumbers/ContinuedFractions.lean`.
- Finite canonicality now uses the standard "positive tail, final tail entry
  greater than one when present" condition in
  `LRA/Arithmetic/ContinuedFractions/Definition.lean`.
- Infinite continued-fraction convergence is tied to actual finite-prefix
  convergents through `FinitePrefix`, `IsConvergentAt`, and
  `ConvergentsConvergeTo` in
  `LRA/NumberSystems/RealNumbers/ContinuedFractions/Definition.lean`.
- Lagrange's theorem is tied to a continued-fraction expansion witness and
  `IsQuadraticIrrational` already requires a nonzero leading coefficient.

The remaining live defect is authoritative documentation drift.
`LRA/NumberSystems/RationalNumbers/ProofOrder.md` still says
`ContinuedFractions.lean` was deferred at the old
`LRA.VolumeII.RationalNumbers.ContinuedFractions` path and had not been moved.
That no longer matches the current owner tree.

## Exact Repair List

- Change
  [LRA/NumberSystems/RationalNumbers/ProofOrder.md](/F:/repos/lra-lean/LRA/NumberSystems/RationalNumbers/ProofOrder.md:1)
  only as far as needed to replace the stale deferred/migration note with an
  accurate top-level continued-fractions summary.

- The repaired note must state the current ownership split accurately:
  `LRA.Arithmetic.ContinuedFractions` owns the generic finite/infinite syntax
  and arithmetic predicates; 
  `LRA.NumberSystems.RationalNumbers.ContinuedFractions` owns finite rational
  evaluation and the canonical finite-expansion theorem; and
  `LRA.NumberSystems.RealNumbers.ContinuedFractions.{Definition,Theorems}`
  owns finite-prefix convergents, convergence-to-a-real, and the Lagrange
  theorem surface.

- Do not edit generated files such as `LRA/NumberSystems/ProofsToDo.md`, even
  though they still show the retired `FiniteValue` surface. The proof-order
  markdown is the authoritative owner note; `ProofsToDo.md` is generated and
  noncanonical.

- Do not reopen the Lean declarations in the continued-fraction owner modules
  unless the build reveals a minimal in-scope mismatch. The bounded `p0-24`
  repair is documentation-only because the live owner theorem surface is
  already on the repaired side of the review note.

## Acceptance Criteria

- No authoritative `NumberSystems` proof-order note still says rational
  continued fractions were deferred at `LRA.VolumeII.*`.
- The active proof-order documentation points to the live owner modules and
  theorem names:
  `CoefficientsEvaluateTo`,
  `FiniteSimpleContinuedFractionEvaluatesTo`,
  `EveryRationalHasUniqueCanonicalFiniteSimpleContinuedFraction`,
  `FinitePrefix`,
  `IsConvergentAt`,
  `ConvergentsConvergeTo`,
  `ProperInfiniteSimpleContinuedFractionConverges`, and
  `QuadraticIrrationalIffEventuallyPeriodicContinuedFraction`.
- `python scripts/validate_structure.py --path LRA/NumberSystems/RationalNumbers`
  passes.
- `lake build LRA.NumberSystems.RationalNumbers` passes.
- `lake build LRA.NumberSystems.RealNumbers` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item.

The owner code already carries the repaired continued-fraction statement
surface, so `p0-24` should close by aligning the authoritative rational
proof-order documentation with that live code.
