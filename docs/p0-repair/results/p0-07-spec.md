# p0-07 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/Analysis/Differentiation`
- Build target: `LRA.Analysis.Differentiation`
- Last good stop: spec frozen on disk and ready for implementation

## Brief Summary

`p0-07` is still live. The active differentiation router still exposes several theorem surfaces whose current hypotheses are too weak for the relative derivative notion used in this chapter.

- [DerivativeUnique](/F:/repos/lra-lean/LRA/Analysis/Differentiation/DerivativeDefinition.lean:152) asserts uniqueness from the raw punctured relative derivative alone, even when `A` has no punctured approach to `c`.
- [NecessaryConditionExtremum](/F:/repos/lra-lean/LRA/Analysis/Differentiation/DerivativeGeometry.lean:52) and [RelativeExtremumNecessaryCondition](/F:/repos/lra-lean/LRA/Analysis/Differentiation/DerivativeGeometry.lean:70) only require `c ∈ A`, so one-sided boundary extrema can falsely force derivative zero.
- [InverseFunctionDerivative](/F:/repos/lra-lean/LRA/Analysis/Differentiation/AlgebraOfDerivatives.lean:220) differentiates `g` on `V` using `fD1 (g y)` without any hypothesis that `g y` lands back in `U`.
- [TaylorTheoremLagrangeRemainder](/F:/repos/lra-lean/LRA/Analysis/Differentiation/TaylorExpansion.lean:72) talks about a Taylor chain `fD` without connecting that chain back to `f`.
- [TaylorExpansionPeanoRemainder](/F:/repos/lra-lean/LRA/Analysis/Differentiation/TaylorExpansion.lean:98) and [FirstOrderPeanoRemainder](/F:/repos/lra-lean/LRA/Analysis/Differentiation/TaylorExpansion.lean:118) drop the domain from the limit filter in their conclusions.
- [DifferentialAndDerivativeAgree](/F:/repos/lra-lean/LRA/Analysis/Differentiation/TaylorExpansion.lean:183) compares the relative derivative on `A` to an ambient differential without any interior hypothesis on `A`.

No earlier open P0 blocks this item. The repair is local to the active differentiation router.

## Exact Repair List

- Update [LRA/Analysis/Differentiation/DerivativeDefinition.lean](/F:/repos/lra-lean/LRA/Analysis/Differentiation/DerivativeDefinition.lean:152).
  Add an explicit accumulation hypothesis to `DerivativeUnique`:
  `hacc : ∃ xs : ℕ → ℝ, LRA.Analysis.Limits.ApproachesButNotEqual xs A c`.
  Keep the theorem local to the existing project-native relative derivative definition; do not replace it with a Mathlib-native notion.

- Update [LRA/Analysis/Differentiation/DerivativeGeometry.lean](/F:/repos/lra-lean/LRA/Analysis/Differentiation/DerivativeGeometry.lean:52).
  Strengthen both `NecessaryConditionExtremum` and `RelativeExtremumNecessaryCondition` by requiring
  `hc : c ∈ interior A` instead of bare membership `c ∈ A`.
  Mirror the same hypothesis change in the surrounding docstrings.

- Update [LRA/Analysis/Differentiation/AlgebraOfDerivatives.lean](/F:/repos/lra-lean/LRA/Analysis/Differentiation/AlgebraOfDerivatives.lean:220).
  Strengthen `InverseFunctionDerivative` with
  `hgVU : ∀ y ∈ V, g y ∈ U`
  so every use of `hf` and `hnz` at `g y` is justified on the source domain.

- Update [LRA/Analysis/Differentiation/TaylorExpansion.lean](/F:/repos/lra-lean/LRA/Analysis/Differentiation/TaylorExpansion.lean:72).
  Replace the free-standing `hDnp1` hypothesis on `fD n` with a chain hypothesis
  `hchain : ∀ x ∈ Set.Ioo a b, HigherDerivativeAt f fD (Set.Ioo a b) (n + 1) x`.
  Leave the conclusion in the same Lagrange-remainder shape, but ensure the theorem statement now certifies that the Taylor data really belongs to `f`.

- Update [LRA/Analysis/Differentiation/TaylorExpansion.lean](/F:/repos/lra-lean/LRA/Analysis/Differentiation/TaylorExpansion.lean:98).
  Change the `TaylorExpansionPeanoRemainder` conclusion to the domain-aware filter
  `nhdsWithin a (I \ {a})`.

- Update [LRA/Analysis/Differentiation/TaylorExpansion.lean](/F:/repos/lra-lean/LRA/Analysis/Differentiation/TaylorExpansion.lean:118).
  Change the `FirstOrderPeanoRemainder` conclusion to the domain-aware increment filter
  `nhdsWithin 0 {h : ℝ | c + h ∈ A ∧ h ≠ 0}`.

- Update [LRA/Analysis/Differentiation/TaylorExpansion.lean](/F:/repos/lra-lean/LRA/Analysis/Differentiation/TaylorExpansion.lean:183).
  Strengthen `DifferentialAndDerivativeAgree` with an interior hypothesis
  `hc : c ∈ interior A`
  before identifying the relative derivative on `A` with the ambient differential at `c`.

## Acceptance Criteria

- `DerivativeUnique` is no longer derivable on a vacuous punctured neighborhood; the theorem surface explicitly requires a punctured approach sequence in `A` converging to `c`.
- The extremum necessary-condition theorems now require `c ∈ interior A`.
- `InverseFunctionDerivative` explicitly states that `g(V) ⊆ U`.
- `TaylorTheoremLagrangeRemainder` now ties the Taylor witness family `fD` back to `f` via `HigherDerivativeAt`.
- Both Peano remainder theorems keep the domain in the conclusion filter.
- `DifferentialAndDerivativeAgree` now requires `c ∈ interior A`.
- `python scripts/validate_structure.py --path LRA/Analysis/Differentiation` passes after implementation.
- `lake build LRA.Analysis.Differentiation` passes after implementation.

## Blockers Or Dependencies

No earlier open P0 blocks `p0-07`.

The broader flat-function issue noted in [LRAReview.md](/F:/repos/lra-lean/LRAReview.md:234) is real, but it is not part of this P0 title and should not be folded into the `p0-07` gate.
