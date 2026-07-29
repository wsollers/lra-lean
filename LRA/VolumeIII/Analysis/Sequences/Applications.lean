/-
Draft module; not yet imported by the active Volume III root.
Imports only this pass's own promoted draft modules and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Sequences.*`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/sequences/notes/applications/notes-applications.tex
Only file in `applications` — the LAST section of `notes/sequences/
index.tex`, closing out the Sequences chapter with worked numerical
capstones. Structural check: 20/20 balanced remark blocks, 8 labeled
nodes — clean, and the block count is exactly accounted for: all 4
"definition by formula" nodes get the light 2-block treatment (Standard
+ Interpretation, no Predicate reading — matching the same style already
seen for `def:tail-supremum-sequence` etc.), all 4 theorems get the
3-block treatment (Standard + Predicate + Interpretation) —
4*2 + 4*3 = 20.

All 8 nodes are mathematically correct, no findings: the Newton iteration
for sqrt(2) (`x_1=3/2`, `x_{n+1}=(x_n+2/x_n)/2`) converges to `sqrt(2)`
(decreasing-after-the-first-term + bounded-below-by-sqrt(2) via MCT, then
passing the recursion to the limit); the factorial partial sums converge
to `e` (Cauchy criterion route); the compound-interest sequence
`(1+1/n)^n` converges to the same `e` (squeeze route, a genuinely
different proof technique reaching the same constant — nice pedagogical
pairing); and decimal truncations `floor(10^n * alpha)/10^n` converge to
`alpha` (squeeze via the `10^{-n}` truncation-error bound). This section
is intentionally lighter-weight worked-example capstone content (like
`examples-counterexamples` earlier), not meant to be exhaustive — no
addition candidates proposed.

Indexing note: the project's own convention starts sequences at `n=1`
(explicit in this file's `x_1 := 3/2`, `c_n := (1+1/n)^n` needing `n>=1`
to avoid division by zero, etc. — matches the `n>=1` convention already
noted in earlier files this pass). Lean's `ℕ` starts at `0`, so the
recursive/formula definitions below are shifted by one index throughout
(Lean index `0` = project index `1`) rather than force-fitting a
1-indexed type — the same handling used everywhere else in this pass.
-/

import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.Topology.Algebra.Order.Floor
import LRA.VolumeIII.Analysis.Sequences.SequenceDefinitions
import LRA.VolumeIII.Analysis.Sequences.Convergence

namespace LRA.VolumeIII.Analysis.Sequences

/-- `def:newton-sequence-sqrt-two`. Lean index `0` = project's `x_1`. -/
noncomputable def NewtonSeqSqrtTwo : ℕ → ℝ
  | 0 => 3 / 2
  | n + 1 => (NewtonSeqSqrtTwo n + 2 / NewtonSeqSqrtTwo n) / 2

/-- `thm:newton-approximation-sqrt-two`. -/
theorem NewtonApproximationSqrtTwo :
    ConvergesTo NewtonSeqSqrtTwo (Real.sqrt 2) := by
  sorry

/-- `def:factorial-partial-sums`. -/
noncomputable def FactorialPartialSums : RealSequence :=
  fun n => ∑ k ∈ Finset.range (n + 1), (1 : ℝ) / (Nat.factorial k)

/-- `thm:factorial-partial-sums-approximate-e`. Uses Mathlib's `Real.exp 1`
for the project's `def:number-e`. -/
theorem FactorialPartialSumsApproximateE :
    ConvergesTo FactorialPartialSums (Real.exp 1) := by
  sorry

/-- `def:compound-interest-sequence`. Lean index `n` = project's index
`n+1`, so the exponent/denominator is `n+1` throughout to avoid dividing
by the Lean-`0` index. -/
noncomputable def CompoundInterestSeq : RealSequence :=
  fun n => (1 + 1 / ((n : ℝ) + 1)) ^ (n + 1)

/-- `thm:compound-interest-approximation-e`. -/
theorem CompoundInterestApproximationE :
    ConvergesTo CompoundInterestSeq (Real.exp 1) := by
  sorry

/-- `def:decimal-truncation-sequence`. -/
noncomputable def DecimalTruncationSeq (α : ℝ) : RealSequence :=
  fun n => (⌊10 ^ n * α⌋ : ℝ) / 10 ^ n

/-- `thm:decimal-truncations-converge`. -/
theorem DecimalTruncationsConverge (α : ℝ) :
    ConvergesTo (DecimalTruncationSeq α) α := by
  sorry

end LRA.VolumeIII.Analysis.Sequences
