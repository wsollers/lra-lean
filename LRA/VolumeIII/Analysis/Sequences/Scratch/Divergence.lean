/-
SCRATCH FILE — not wired into the lra-lean project.
Imports only this pass's own scratch files and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Sequences.*`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/sequences/notes/divergence/notes-divergence.tex
Only file in `divergence`. Structural check: 36/36 balanced remark
blocks, 9 labeled nodes — clean.

All 9 nodes are mathematically correct: divergent sequence (formal
negation of real convergence), divergence to +infinity/-infinity,
oscillatory sequence (divergent AND neither one-directional escape —
correctly captures both bounded oscillation like (-1)^n and unbounded
oscillation), infinite-divergence-implies-real-divergence, two-
subsequential-limits force divergence (a deliberate restatement of
`thm:divergence-by-two-subsequential-limits` from `notes-subsequences.tex`
in this section's own "divergent" vocabulary rather than "does not
converge" — a reasonable bridging theorem, not an accidental duplicate),
unbounded-above/-below sequences have a +-infinity/--infinity
subsequence, and bounded divergence produces two subsequential limits
(the converse-flavored partner to `bolzano_weierstrass_sequences` +
`divergence_by_two_subsequential_limits` — also essentially the key
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

import Mathlib.Order.Defs
import LRA.VolumeIII.Analysis.Sequences.Scratch.SequenceDefinitions
import LRA.VolumeIII.Analysis.Sequences.Scratch.Convergence
import LRA.VolumeIII.Analysis.Sequences.Scratch.NullConstantSequences
import LRA.VolumeIII.Analysis.Sequences.Scratch.Subsequences

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Sequences
namespace Scratch

/-- `def:divergent-sequence`. -/
def IsDivergent (x : RealSequence) : Prop := ¬ ∃ L : ℝ, ConvergesTo x L

/-- `def:diverges-to-positive-infinity`. -/
def DivergesToPosInf (x : RealSequence) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, M < x n

/-- `def:diverges-to-negative-infinity`. -/
def DivergesToNegInf (x : RealSequence) : Prop :=
  ∀ M : ℝ, ∃ N : ℕ, ∀ n ≥ N, x n < M

/-- `def:oscillatory-sequence`. -/
def IsOscillatory (x : RealSequence) : Prop :=
  IsDivergent x ∧ ¬ DivergesToPosInf x ∧ ¬ DivergesToNegInf x

/-- `thm:divergence-to-infinity-implies-real-divergence`. -/
theorem divergence_to_infinity_implies_real_divergence {x : RealSequence}
    (h : DivergesToPosInf x ∨ DivergesToNegInf x) : IsDivergent x := by
  sorry

/-- `thm:two-subsequential-limits-force-divergence`. -/
theorem two_subsequential_limits_force_divergence {x : RealSequence}
    {L K : ℝ} (hLK : L ≠ K) (hL : IsSubsequentialLimit x L)
    (hK : IsSubsequentialLimit x K) : IsDivergent x := by
  sorry

/-- `thm:unbounded-above-has-positive-infinity-subsequence`. -/
theorem unbounded_above_has_positive_infinity_subsequence {x : RealSequence}
    (h : ¬ BoundedAboveSeq x) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧
      DivergesToPosInf (fun k => x (σ k)) := by
  sorry

/-- `thm:unbounded-below-has-negative-infinity-subsequence`. -/
theorem unbounded_below_has_negative_infinity_subsequence {x : RealSequence}
    (h : ¬ BoundedBelowSeq x) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧
      DivergesToNegInf (fun k => x (σ k)) := by
  sorry

/-- `thm:bounded-divergence-produces-two-subsequential-limits`. -/
theorem bounded_divergence_produces_two_subsequential_limits {x : RealSequence}
    (hbdd : BoundedSeq x) (hdiv : IsDivergent x) :
    ∃ L K : ℝ, L ≠ K ∧ IsSubsequentialLimit x L ∧ IsSubsequentialLimit x K := by
  sorry

end Scratch
end Sequences
end Analysis
end VolumeIII
end LRA
