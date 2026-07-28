/-
Draft module; not yet imported by the active Volume III root.
Imports only this pass's own promoted draft modules and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Sequences.*`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/sequences/notes/subsequences/notes-subsequences.tex
Only file in `subsequences`. Structural check: 60/60 balanced remark
blocks, 18 labeled nodes — clean, and the block count is exactly
accounted for: 2 defs get the full 6-block suite (Standard/Predicate/
Negated/Negation-predicate/Failure-modes/Interpretation), 2 defs and all
14 theorems get the lighter 3-block treatment (Standard/Predicate/
Interpretation) — 12 + 6 + 42 = 60. This is a deliberate, consistent
house-style choice (light treatment for one-directional/characterization
statements), not a missing-block bug.

All 18 nodes are mathematically correct — the standard package:
strictly-increasing index maps, subsequences, subsequential (cluster)
limits, "has a convergent subsequence," index domination (k <= sigma(k)),
subsequences preserve limits, uniqueness of the subsequential limit of a
convergent sequence, divergence-by-two-subsequential-limits, boundedness
and monotonicity passing to subsequences, subsequence-of-subsequence,
eventual/frequent properties passing to (or yielding) subsequences,
subsequential limits respecting bounds, squeeze passing to subsequences,
the Monotone Subsequence Theorem (peak-point dichotomy), Bolzano–
Weierstrass for sequences, and sequential compactness of [a,b]. The
dependency chain for Bolzano–Weierstrass itself is complete and exactly
right: bounded sequence -> monotone subsequence theorem -> that
subsequence is still bounded (boundedness passes to subsequences) ->
converges by the Monotone Convergence Theorem (bounded-monotone-sequence-
equivalences).

Finding A (see ISSUES.md #21): `thm:squeeze-passes-to-subsequences`'s
dependency list cites `thm:sequence-squeeze-theorem`, but the theorem's
own conclusion is purely about the inequality `a_sigma(k) <= x_sigma(k) <=
b_sigma(k)` persisting on a tail of the subsequence — it says nothing
about convergence, and only needs `thm:eventual-properties-pass-to-
subsequences` (already cited, and sufficient on its own applied to the
compound property `a_n <= x_n <= b_n`). Citing the squeeze theorem here
looks backward: this theorem is naturally a supporting LEMMA for later
transferring squeeze-theorem CONCLUSIONS to subsequences, not something
that consumes the squeeze theorem to prove itself. Not fixed here.

Finding B (see ISSUES.md #22): `thm:eventual-properties-pass-to-
subsequences` and `thm:frequent-properties-yield-subsequences` are both
stated for a fully abstract property `P(n)` of indices — no sequence
`x_n` appears anywhere in either theorem's actual statement. But both
nodes' "Predicate reading" remarks write `Eventually(x_n, P)` /
`Frequently(x_n, P)`, introducing sequence notation that isn't part of
the theorem at all (apparently copied from the sequence-specific template
used elsewhere in this file without stripping the `x_n`). Purely
notational, not a math error — the abstract theorems are formalized
below exactly as stated, ignoring the stray `x_n` in the predicate
reading. Not fixed here.

Addition candidate (proposed, NOT yet added to ADDITIONS.md pending your
call): the "subsequence principle" / Urysohn-style convergence test --
"(x_n) -> L iff every subsequence of (x_n) has a further subsequence
converging to L" -- is a very standard and useful two-line consequence of
Bolzano-Weierstrass + divergence-by-two-subsequential-limits, and is
often the cleanest way to prove convergence when a direct epsilon-N
argument is awkward but subsequence extraction is easy. Nothing in this
file (or, per this pass's earlier read-through, in the `convergence`
section) states it. Not formalized below -- your call whether to add it.
-/

import Mathlib.Order.Basic
import LRA.VolumeIII.Analysis.Sequences.SequenceDefinitions
import LRA.VolumeIII.Analysis.Sequences.Convergence
import LRA.VolumeIII.Analysis.Sequences.NullConstantSequences
import LRA.VolumeIII.Analysis.Sequences.Monotonicity

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Sequences

/-- `def:strictly-increasing-index-map`. -/
def IsStrictlyIncreasingIndexMap (σ : ℕ → ℕ) : Prop :=
  ∀ k l : ℕ, k < l → σ k < σ l

/-- `def:subsequence-of-sequence`. -/
def IsSubsequenceOf (y x : RealSequence) : Prop :=
  ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧ ∀ k, y k = x (σ k)

/-- `def:subsequential-limit`. -/
def IsSubsequentialLimit (x : RealSequence) (L : ℝ) : Prop :=
  ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧ ConvergesTo (fun k => x (σ k)) L

/-- `def:has-convergent-subsequence`. -/
def HasConvergentSubsequence (x : RealSequence) : Prop :=
  ∃ L : ℝ, IsSubsequentialLimit x L

/-- `thm:subsequence-indices-dominate-identity`. -/
theorem SubsequenceIndicesDominateIdentity {σ : ℕ → ℕ}
    (h : IsStrictlyIncreasingIndexMap σ) : ∀ k, k ≤ σ k := by
  sorry

/-- `thm:subsequences-preserve-limits`. -/
theorem SubsequencesPreserveLimits {x : RealSequence} {L : ℝ} {σ : ℕ → ℕ}
    (hx : ConvergesTo x L) (hσ : IsStrictlyIncreasingIndexMap σ) :
    ConvergesTo (fun k => x (σ k)) L := by
  sorry

/-- `thm:subsequential-limit-of-convergent-sequence`. -/
theorem SubsequentialLimitOfConvergentSequence {x : RealSequence}
    {L K : ℝ} (hL : ConvergesTo x L) (hK : IsSubsequentialLimit x K) :
    K = L := by
  sorry

/-- `thm:divergence-by-two-subsequential-limits`. -/
theorem DivergenceByTwoSubsequentialLimits {x : RealSequence}
    {L K : ℝ} (hL : IsSubsequentialLimit x L) (hK : IsSubsequentialLimit x K)
    (hLK : L ≠ K) : ¬ ∃ A, ConvergesTo x A := by
  sorry

/-- `thm:boundedness-passes-to-subsequences`. -/
theorem BoundednessPassesToSubsequences {x : RealSequence} {σ : ℕ → ℕ}
    (hx : BoundedSeq x) (hσ : IsStrictlyIncreasingIndexMap σ) :
    BoundedSeq (fun k => x (σ k)) := by
  sorry

/-- `thm:monotonicity-passes-to-subsequences`, increasing half. -/
theorem MonotonicityPassesToSubsequencesIncr {x : RealSequence}
    {σ : ℕ → ℕ} (hx : IsIncreasing x) (hσ : IsStrictlyIncreasingIndexMap σ) :
    IsIncreasing (fun k => x (σ k)) := by
  sorry

/-- `thm:monotonicity-passes-to-subsequences`, decreasing half. -/
theorem MonotonicityPassesToSubsequencesDecr {x : RealSequence}
    {σ : ℕ → ℕ} (hx : IsDecreasing x) (hσ : IsStrictlyIncreasingIndexMap σ) :
    IsDecreasing (fun k => x (σ k)) := by
  sorry

/-- `thm:subsequence-of-subsequence`. -/
theorem SubsequenceOfSubsequence {x : RealSequence} {σ τ : ℕ → ℕ}
    (hσ : IsStrictlyIncreasingIndexMap σ) (hτ : IsStrictlyIncreasingIndexMap τ) :
    IsSubsequenceOf (fun k => x (σ (τ k))) x := by
  sorry

/-- `thm:eventual-properties-pass-to-subsequences`. Stated for a fully
abstract index property `P` — no sequence involved, matching the actual
`.tex` statement (see Finding B above re: the Predicate reading's stray
`x_n`). -/
theorem EventualPropertiesPassToSubsequences {P : ℕ → Prop} {σ : ℕ → ℕ}
    (h : ∃ N : ℕ, ∀ n ≥ N, P n) (hσ : IsStrictlyIncreasingIndexMap σ) :
    ∃ K : ℕ, ∀ k ≥ K, P (σ k) := by
  sorry

/-- `thm:frequent-properties-yield-subsequences`. -/
theorem FrequentPropertiesYieldSubsequences {P : ℕ → Prop}
    (h : ∀ N : ℕ, ∃ n ≥ N, P n) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧ ∀ k, P (σ k) := by
  sorry

/-- `thm:subsequential-limits-respect-bounds`. -/
theorem SubsequentialLimitsRespectBounds {x : RealSequence} {L m M : ℝ}
    (hL : IsSubsequentialLimit x L) (h : ∀ n, m ≤ x n ∧ x n ≤ M) :
    m ≤ L ∧ L ≤ M := by
  sorry

/-- `thm:squeeze-passes-to-subsequences`. See Finding A above re: the
`.tex`'s own (likely backward) dependency citation. -/
theorem SqueezePassesToSubsequences {a x b : RealSequence} {σ : ℕ → ℕ}
    (h : ∃ N : ℕ, ∀ n ≥ N, a n ≤ x n ∧ x n ≤ b n)
    (hσ : IsStrictlyIncreasingIndexMap σ) :
    ∃ K : ℕ, ∀ k ≥ K, a (σ k) ≤ x (σ k) ∧ x (σ k) ≤ b (σ k) := by
  sorry

/-- `thm:monotone-subsequence-theorem`. -/
theorem MonotoneSubsequenceTheorem (x : RealSequence) :
    ∃ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ ∧
      (IsIncreasing (fun k => x (σ k)) ∨ IsDecreasing (fun k => x (σ k))) := by
  sorry

/-- `thm:bolzano-weierstrass-sequences`. -/
theorem BolzanoWeierstrassSequences {x : RealSequence} (h : BoundedSeq x) :
    HasConvergentSubsequence x := by
  sorry

/-- `thm:sequential-compactness-closed-bounded-interval`. -/
theorem SequentialCompactnessClosedBoundedInterval {a b : ℝ} {x : RealSequence}
    (hab : a ≤ b) (hx : ∀ n, a ≤ x n ∧ x n ≤ b) :
    ∃ σ : ℕ → ℕ, ∃ L : ℝ, IsStrictlyIncreasingIndexMap σ ∧
      ConvergesTo (fun k => x (σ k)) L ∧ a ≤ L ∧ L ≤ b := by
  sorry

/-- ADDITION (not a `.tex` label — see `ADDITIONS.md` item 6). The
"subsequence principle": `(x_n) -> L` iff every subsequence of `(x_n)`
has a further subsequence converging to `L`. Forward direction is
`SubsequencesPreserveLimits` with `τ = id`; backward direction is by
contradiction via `FrequentPropertiesYieldSubsequences` (thread an
`ε`-escaping tail into a subsequence none of whose further subsequences
can converge to `L`). Both ingredients already live in this file. -/
theorem SubsequencePrinciple {x : RealSequence} {L : ℝ} :
    ConvergesTo x L ↔
      ∀ σ : ℕ → ℕ, IsStrictlyIncreasingIndexMap σ →
        ∃ τ : ℕ → ℕ, IsStrictlyIncreasingIndexMap τ ∧
          ConvergesTo (fun k => x (σ (τ k))) L := by
  sorry

/-- ADDITION (not a `.tex` label — see `ADDITIONS.md` item 7). For a
*bounded* sequence, converging to `L` is equivalent to `L` being its
*only* subsequential limit. Existence of some subsequential limit is
`BolzanoWeierstrassSequences` (needs boundedness — without it,
"unique subsequential limit" is vacuous for a sequence with none, e.g.
`x_n = n`); uniqueness rules out a second one via
`DivergenceByTwoSubsequentialLimits`. Both ingredients already live
in this file. -/
theorem BoundedSequenceConvergesIffUniqueSubsequentialLimit
    {x : RealSequence} {L : ℝ} (hbdd : BoundedSeq x) :
    ConvergesTo x L ↔
      (IsSubsequentialLimit x L ∧ ∀ K, IsSubsequentialLimit x K → K = L) := by
  sorry

end Sequences
end Analysis
end VolumeIII
end LRA
