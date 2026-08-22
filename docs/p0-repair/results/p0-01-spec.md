# p0-01 Spec Result

- Status: `completed`
- Task backend: fresh-context sub-agent
- Spec task id: `01a02a44-3e73-7d91-bc27-d80f5faf3f5a`
- Verifier task id: `01a02a51-0756-72f1-967b-9aa7b4fa769c`
- Validator path: `LRA/Analysis/Sequences`
- Build target: `LRAAll`
- Last good stop: spec frozen on disk and handed to verifier

## Brief Summary

`p0-01` is implementable now with no prerequisite P0. The repair is a sequence-layer ownership rewrite: move the native convergence/divergence semantics to the earliest non-interop module, restate every foundational theorem surface in that native vocabulary, and quarantine every Mathlib `Filter`/topology/uniform-space bridge under explicit interop modules. The existing generic completeness definition in [CauchySequencesConverge.lean](/F:/repos/lra-lean/LRA/Analysis/Completeness/Completeness/Definition/CauchySequencesConverge.lean:1) already matches the target semantics and should not be changed.

## Exact Repair List

- [SequenceDefinitions.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences/SequenceDefinitions.lean:1) becomes the foundational semantic-owner module. It must own:
  `Sequence`, `RealSequence`, `ConvergesTo`, `IsDivergent`, `DivergesToPosInf`, `DivergesToNegInf`, `IsOscillatory`.
- In [SequenceDefinitions.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences/SequenceDefinitions.lean:1), change theorem surfaces exactly to:
  `ConstantSequenceConverges : ConvergesTo (fun _ : ℕ => c) c`,
  `ReciprocalSequenceConvergesToZero : ConvergesTo (fun n : ℕ => 1 / (n : ℝ)) 0`,
  `NaturalNumberSequenceDiverges : DivergesToPosInf (fun n : ℕ => (n : ℝ))`.
- In [SequenceDefinitions.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences/SequenceDefinitions.lean:1), rewrite the opening file comment that currently says the filter statements were temporary forward-dependency placeholders, and rewrite the three theorem doc-comments/logical-form blocks so they no longer mention `Filter.Tendsto`, `nhds`, or `atTop`. Remove `Mathlib.Topology.Instances.Real.Lemmas` and `Mathlib.Order.Filter.AtTopBot.Basic`.

- [Convergence.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences/Convergence.lean:1) must stop owning `ConvergesTo`.
  Delete `CenteredInterval`.
  Keep `ConvergesToNbhd`, but redefine it exactly as:
  `∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, L - ε < x n ∧ x n < L + ε`.
  Change `EquivalenceOfConvergenceFormulations` exactly to:
  `(ConvergesTo x L ↔ ∀ ε > 0, ∃ K : ℕ, ∀ n ≥ K, |x n - L| < ε) ∧`
  `(ConvergesTo x L ↔ ∀ ε > 0, ∃ K : ℕ, ∀ n ≥ K, L - ε < x n ∧ x n < L + ε) ∧`
  `(ConvergesTo x L ↔ ConvergesToNbhd x L)`.
  Rewrite the file header that says the project’s own convergence definition “finally lands” here. Remove `Mathlib.Data.Set.Defs` and `Mathlib.Data.List.TFAE`.

- [NullConstantSequences.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences/NullConstantSequences.lean:1) must replace every filter-based convergence statement with native `ConvergesTo`:
  `ConstantSequenceConvergence`,
  `DifferenceFromLimitIsNull`,
  `UltimatelyConstantSequenceConvergence`,
  `TailEqualityPreservesConvergence`.
  Their exact types stay the same except every `Filter.Tendsto ... (nhds ...)` becomes the corresponding `ConvergesTo ...`.
  Rewrite the opening file comment that currently justifies `Filter.Tendsto` reuse. Remove `Mathlib.Topology.Instances.Real.Lemmas` and `Mathlib.Order.Filter.AtTopBot.Basic`.

- [Monotonicity.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences/Monotonicity.lean:1) must change:
  `UnboundedMonotoneDivergencePos : DivergesToPosInf x`
  `UnboundedMonotoneDivergenceNeg : DivergesToNegInf x`
  Rewrite the file-header paragraph that justifies `Filter.Tendsto _ atTop atTop/atBot` as a forward-dependency workaround, and rewrite both theorem doc-comments/logical forms accordingly. Remove `Mathlib.Order.Filter.AtTopBot.Basic` and `Mathlib.Topology.Instances.Real.Lemmas`.

- [Subsequences.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences/Subsequences.lean:1) must change:
  `DivergenceByTwoSubsequentialLimits ... : IsDivergent x`
  Rewrite that theorem’s doc-comment/logical-form block to use `IsDivergent`, not raw `¬ ∃ A, ConvergesTo x A`.

- [Divergence.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences/Divergence.lean:1) must stop defining:
  `IsDivergent`,
  `DivergesToPosInf`,
  `DivergesToNegInf`,
  `IsOscillatory`.
  Those names must be imported from [SequenceDefinitions.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences/SequenceDefinitions.lean:1). Keep the theorem names in this file; only the local definition ownership moves. Rewrite the file header so it no longer describes those definitions as introduced here.

- [ExamplesCounterexamples.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences/ExamplesCounterexamples.lean:1) must replace raw negated-convergence surfaces with native divergence predicates:
  `ExampleOscillatingSequence`: use `IsOscillatory (fun n : ℕ => (-1 : ℝ) ^ n)`
  `ExampleGeometricSequence`: its `r = -1` conjunct must use `IsOscillatory (fun n : ℕ => (-1 : ℝ) ^ n)`
  `ExampleBoundedNotConvergent`: use `IsDivergent (fun n : ℕ => (-1 : ℝ) ^ n)`.

- [Applications.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences/Applications.lean:1) needs import cleanup only:
  replace `import Mathlib.Topology.Algebra.Order.Floor` with `import Mathlib.Algebra.Order.Floor.Ring`.
  No theorem surface change is required.

- Add opt-in bridge modules, and do not import them from [Sequences.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences.lean:1) or [Analysis.lean](/F:/repos/lra-lean/LRA/Analysis.lean:1):
  [Interop/Mathlib.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences/Interop/Mathlib.lean:1),
  [Interop/Mathlib/Convergence.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences/Interop/Mathlib/Convergence.lean:1),
  [Interop/Mathlib/Cauchy.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences/Interop/Mathlib/Cauchy.lean:1),
  [Interop/Mathlib/Divergence.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences/Interop/Mathlib/Divergence.lean:1).
  Exact bridge theorems:
  `ConvergesToIffTendsto`,
  `IsNullIffTendstoZero`,
  `IsCauchyIffCauchySeq`,
  `DivergesToPosInfIffTendstoAtTop`,
  `DivergesToNegInfIffTendstoAtBot`.

## Acceptance Criteria

- `ConvergesTo`, `IsDivergent`, `DivergesToPosInf`, `DivergesToNegInf`, and `IsOscillatory` are owned only by [SequenceDefinitions.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences/SequenceDefinitions.lean:1).
- `IsCauchy` remains the owner in [Cauchy.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences/Cauchy.lean:1); Mathlib `CauchySeq` appears only in `Interop/Mathlib`.
- Outside `LRA/Analysis/Sequences/Interop/**`, no sequence module imports `Mathlib.Topology.*`, `Mathlib.Order.Filter.*`, `Mathlib.Topology.UniformSpace.*`, or `Mathlib.Data.List.TFAE`.
- Outside `Interop/**`, no sequence declaration type or logical-form comment mentions `Filter.Tendsto`, `nhds`, `atTop`, `atBot`, `CauchySeq`, `UniformSpace`, `Set.Ioo`, or `List.TFAE`.
- [Sequences.lean](/F:/repos/lra-lean/LRA/Analysis/Sequences.lean:1) and [Analysis.lean](/F:/repos/lra-lean/LRA/Analysis.lean:1) do not import the new interop router.
- `python scripts/validate_structure.py --path LRA/Analysis/Sequences` passes.
- `lake build LRAAll` passes.

## Blockers Or Dependencies

None. The source-of-truth P0 in [LRAReview.md](/F:/repos/lra-lean/LRAReview.md:85) and the open queue entry in [LRAReview.md](/F:/repos/lra-lean/LRAReview.md:470) can be executed directly from this spec.
