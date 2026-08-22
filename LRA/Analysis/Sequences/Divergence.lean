/-
Draft module; not yet imported by the active Volume III root.
Imports only this pass's own promoted draft modules and Mathlib — nothing from the
real `LRA.Analysis.Sequences.*`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/sequences/notes/divergence/notes-divergence.tex
Only file in `divergence`. Structural check: 36/36 balanced remark
blocks, 9 labeled nodes — clean.

All 9 nodes are mathematically correct: divergent sequence (formal
negation of real convergence), divergence to positive and negative
infinity, oscillatory sequence (divergent AND neither one-directional
escape — correctly captures both bounded oscillation like `(-1)^n` and
unbounded oscillation), infinite-divergence-implies-real-divergence,
two-subsequential-limits force divergence, unbounded-above and
unbounded-below sequences having one-sided divergent subsequences, and
bounded divergence producing two subsequential limits.

The divergence predicates themselves now live in
`SequenceDefinitions.lean`, so this file only proves theorems about that
native vocabulary.
-/

import LRA.Analysis.Sequences.SequenceDefinitions
import LRA.Analysis.Sequences.Convergence
import LRA.Analysis.Sequences.NullConstantSequences
import LRA.Analysis.Sequences.Subsequences

namespace LRA.Analysis.Sequences

-- `thm:divergence-to-infinity-implies-real-divergence`
/-- Let `x : RealSequence`. If `x` diverges to positive or negative infinity, then
`x` is divergent as a real sequence.

Logical form:

```lean
theorem DivergenceToInfinityImpliesRealDivergence {x : RealSequence}
    (h : DivergesToPosInf x ∨ DivergesToNegInf x) : IsDivergent x
```
-/
theorem DivergenceToInfinityImpliesRealDivergence {x : RealSequence}
    (h : DivergesToPosInf x ∨ DivergesToNegInf x) : IsDivergent x := by
  sorry

-- `thm:two-subsequential-limits-force-divergence`
/-- Let `x` be a real sequence with two distinct subsequential limits `L` and `K`.
Then `x` is divergent.

Logical form:

```lean
theorem TwoSubsequentialLimitsForceDivergence {x : RealSequence}
    {L K : ℝ} (hLK : L ≠ K) (hL : IsSubsequentialLimit x L)
    (hK : IsSubsequentialLimit x K) : IsDivergent x
```
-/
theorem TwoSubsequentialLimitsForceDivergence {x : RealSequence}
    {L K : ℝ} (hLK : L ≠ K) (hL : IsSubsequentialLimit x L)
    (hK : IsSubsequentialLimit x K) : IsDivergent x := by
  sorry

-- `thm:unbounded-above-has-positive-infinity-subsequence`
/-- Let `x` be a real sequence that is not bounded above. Then some subsequence of
`x` diverges to positive infinity.

Logical form:

```lean
theorem UnboundedAboveHasPositiveInfinitySubsequence {x : RealSequence}
    (h : ¬ BoundedAboveSeq x) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧
      DivergesToPosInf (fun k => x (σ k))
```
-/
theorem UnboundedAboveHasPositiveInfinitySubsequence {x : RealSequence}
    (h : ¬ BoundedAboveSeq x) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧
      DivergesToPosInf (fun k => x (σ k)) := by
  sorry

-- `thm:unbounded-below-has-negative-infinity-subsequence`
/-- Let `x` be a real sequence that is not bounded below. Then some subsequence of
`x` diverges to negative infinity.

Logical form:

```lean
theorem UnboundedBelowHasNegativeInfinitySubsequence {x : RealSequence}
    (h : ¬ BoundedBelowSeq x) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧
      DivergesToNegInf (fun k => x (σ k))
```
-/
theorem UnboundedBelowHasNegativeInfinitySubsequence {x : RealSequence}
    (h : ¬ BoundedBelowSeq x) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧
      DivergesToNegInf (fun k => x (σ k)) := by
  sorry

-- `thm:bounded-divergence-produces-two-subsequential-limits`
/-- Let `x` be a bounded divergent real sequence. Then `x` has two distinct
subsequential limits.

Logical form:

```lean
theorem BoundedDivergenceProducesTwoSubsequentialLimits {x : RealSequence}
    (hbdd : BoundedSeq x) (hdiv : IsDivergent x) :
    ∃ L K : ℝ, L ≠ K ∧ IsSubsequentialLimit x L ∧ IsSubsequentialLimit x K
```
-/
theorem BoundedDivergenceProducesTwoSubsequentialLimits {x : RealSequence}
    (hbdd : BoundedSeq x) (hdiv : IsDivergent x) :
    ∃ L K : ℝ, L ≠ K ∧ IsSubsequentialLimit x L ∧ IsSubsequentialLimit x K := by
  sorry

end LRA.Analysis.Sequences
