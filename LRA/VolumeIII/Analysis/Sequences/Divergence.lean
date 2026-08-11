/-
Draft module; not yet imported by the active Volume III root.
Imports only this pass's own promoted draft modules and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Sequences.*`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/sequences/notes/divergence/notes-divergence.tex
Only file in `divergence`. Structural check: 36/36 balanced remark
blocks, 9 labeled nodes — clean.

All 9 nodes are mathematically correct: divergent sequence (formal
negation of real convergence), divergence to +infinity and -infinity,
oscillatory sequence (divergent AND neither one-directional escape —
correctly captures both bounded oscillation like (-1)^n and unbounded
oscillation), infinite-divergence-implies-real-divergence, two-
subsequential-limits force divergence (a deliberate restatement of
`thm:divergence-by-two-subsequential-limits` from `notes-subsequences.tex`
in this section's own "divergent" vocabulary rather than "does not
converge" — a reasonable bridging theorem, not an accidental duplicate),
unbounded-above and unbounded-below sequences have a positive- or negative-infinity
subsequence, and bounded divergence produces two subsequential limits
(the converse-flavored partner to `BolzanoWeierstrassSequences` +
`DivergenceByTwoSubsequentialLimits` — also essentially the key
lemma behind this pass's own `bounded_sequence_converges_iff_unique_
subsequential_limit` addition in `Subsequences.lean`; worth noting this
theorem is arguably a MORE direct route to that addition's hard direction
than the two-theorem chain cited there, though both work).

Finding (see ISSUES.md #23): `thm:unbounded-above-has-positive-infinity-
subsequence` and `thm:unbounded-below-has-negative-infinity-subsequence`
both need "unboundedness (above/below) passes to every tail" to actually
carry out the construction (build the index map by picking, at each
step, a later term exceeding the next threshold) — if some tail *were*
bounded above by M', the whole sequence would be bounded above by
max(M', x_0, ..., x_{N-1}), contradicting unboundedness. Neither
dependency list states this (admittedly one-line) fact. Not fixed here.

`DivergesToPosInf`/`DivergesToNegInf` reuse the `Eventually`-style
`∃N, ∀n≥N, ...` pattern established throughout this pass rather than
Mathlib's `Filter.Tendsto _ Filter.atTop Filter.atTop`, matching house
style now that the project's own vocabulary is being tracked as citable
content (same choice made for `ConvergesTo` itself).
-/

import Mathlib.Order.Basic
import LRA.VolumeIII.Analysis.Sequences.SequenceDefinitions
import LRA.VolumeIII.Analysis.Sequences.Convergence
import LRA.VolumeIII.Analysis.Sequences.NullConstantSequences
import LRA.VolumeIII.Analysis.Sequences.Subsequences

namespace LRA.VolumeIII.Analysis.Sequences

/-- `def:divergent-sequence`.

Logical form:

```lean
def IsDivergent (x : RealSequence) : Prop := ¬ ∃ L : ℝ, ConvergesTo x L
```
-/
def IsDivergent (x : RealSequence) : Prop := ¬ ∃ L : ℝ, ConvergesTo x L

/-- `def:diverges-to-positive-infinity`.

Logical form:

```lean
def DivergesToPosInf (x : RealSequence) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, M < x n
```
-/
def DivergesToPosInf (x : RealSequence) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, M < x n

/-- `def:diverges-to-negative-infinity`.

Logical form:

```lean
def DivergesToNegInf (x : RealSequence) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, x n < M
```
-/
def DivergesToNegInf (x : RealSequence) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, x n < M

/-- `def:oscillatory-sequence`.

Logical form:

```lean
def IsOscillatory (x : RealSequence) : Prop :=
  IsDivergent x ∧ ¬ DivergesToPosInf x ∧ ¬ DivergesToNegInf x
```
-/
def IsOscillatory (x : RealSequence) : Prop :=
  IsDivergent x ∧ ¬ DivergesToPosInf x ∧ ¬ DivergesToNegInf x

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

end LRA.VolumeIII.Analysis.Sequences
