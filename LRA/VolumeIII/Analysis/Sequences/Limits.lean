/-
Draft module; not yet imported by the active Volume III root.
Imports only this pass's own promoted draft modules and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Sequences.*`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/sequences/notes/convergence/notes-limits.tex
Second file of `convergence` (installment 2 of 3). Structural check:
27/27 balanced remark blocks, 8 labeled theorem nodes — clean.

All 8 theorems are mathematically correct — standard package: uniqueness
of limits, order preservation (weak inequality survives, strict need not),
constant comparison, and three flavors of the squeeze theorem (constant/
degenerate, two-sided, absolute-value/estimate form).

Finding: `thm:uniqueness-of-limits`'s own `[Interpretation]` remark claims
"The Hausdorff remark in the failure mode block is the forward pointer:
when sequences are studied in general topological spaces, uniqueness of
limits is equivalent to the Hausdorff separation axiom" — but there is NO
mention of Hausdorff-ness, or any topological forward-pointer content at
all, anywhere in that node's actual `[Failure modes]` remark (it's just
the standard Exposition + negated-condition boilerplate, textually
identical to `Negated quantified statement`/`Negation predicate reading`
already shown above it). A dangling cross-reference to content that
doesn't exist in the document — the Hausdorff remark this Interpretation
describes was apparently never written (or was written and lost). Worth
adding the missing remark, not fixed here (content authoring, out of
scope for this pass).

Non-bug worth noting: `thm:constant-squeeze-theorem` ("If eventually
`L <= x_n <= L`, then `x_n -> L`") is really just "eventually `x_n = L`
implies `x_n -> L`" written via a degenerate sandwich — which is exactly
`UltimatelyConstantSequenceConvergence` from
`NullConstantSequences.lean` (the Sequences chapter's `definition`
section), specialized to `c = L`. The .tex is self-aware of this ("this is the
degenerate squeeze theorem... eventual equality... is enough") and it
reads as deliberate scaffolding toward the general squeeze theorem two
nodes later, not an accidental duplicate — kept as its own theorem below
per the project's stated tolerance for practice-value near-duplicates.

All content now cites the project's own `ConvergesTo` (from
`Convergence.lean`), matching house style now that the real definition
has been read — no more `Filter.Tendsto` placeholders in this file's
scope. `Eventually(x_n, P n)` is still not formally defined anywhere in
the .tex (forward reference to the upcoming `tails` section); modeled
directly as `∃ N₀, ∀ n ≥ N₀, P n` inline, matching the same handling used
in `NullConstantSequences.lean`.
-/

import Mathlib.Order.Basic
import LRA.VolumeIII.Analysis.Sequences.SequenceDefinitions
import LRA.VolumeIII.Analysis.Sequences.Convergence
import LRA.VolumeIII.Analysis.Sequences.NullConstantSequences

namespace LRA.VolumeIII.Analysis.Sequences

/-- `thm:uniqueness-of-limits`. -/
theorem UniquenessOfLimits {x : RealSequence} {L K : ℝ}
    (hL : ConvergesTo x L) (hK : ConvergesTo x K) : L = K := by
  sorry

/-- `thm:limit-preserves-eventual-order`. -/
theorem LimitPreservesEventualOrder {x y : RealSequence} {L M : ℝ}
    (hL : ConvergesTo x L) (hM : ConvergesTo y M)
    (h : ∃ N₀ : ℕ, ∀ n ≥ N₀, x n ≤ y n) : L ≤ M := by
  sorry

/-- `thm:strict-limit-separation-gives-eventual-order`. -/
theorem StrictLimitSeparationGivesEventualOrder {x y : RealSequence}
    {A B : ℝ} (hA : ConvergesTo x A) (hB : ConvergesTo y B) (hAB : A < B) :
    ∃ N : ℕ, ∀ n ≥ N, x n < y n := by
  sorry

/-- `thm:eventual-strict-comparison-preserves-weak-limit-order`, part (a). -/
theorem EventualStrictComparisonPreservesWeakLimitOrderLt
    {x y : RealSequence} {A B : ℝ} (hA : ConvergesTo x A)
    (hB : ConvergesTo y B) (h : ∃ N : ℕ, ∀ n ≥ N, x n < y n) : A ≤ B := by
  sorry

/-- `thm:eventual-strict-comparison-preserves-weak-limit-order`, part (b). -/
theorem EventualStrictComparisonPreservesWeakLimitOrderGt
    {x y : RealSequence} {A B : ℝ} (hA : ConvergesTo x A)
    (hB : ConvergesTo y B) (h : ∃ N : ℕ, ∀ n ≥ N, x n > y n) : A ≥ B := by
  sorry

/-- `thm:constant-comparison-sequence-limits`, part (a). -/
theorem ConstantComparisonSequenceLimitsLe {x : RealSequence} {A B : ℝ}
    (hA : ConvergesTo x A) (h : ∃ N : ℕ, ∀ n ≥ N, x n ≤ B) : A ≤ B := by
  sorry

/-- `thm:constant-comparison-sequence-limits`, part (b). -/
theorem ConstantComparisonSequenceLimitsLt {x : RealSequence} {A B : ℝ}
    (hA : ConvergesTo x A) (h : ∃ N : ℕ, ∀ n ≥ N, x n < B) : A ≤ B := by
  sorry

/-- `thm:constant-comparison-sequence-limits`, part (c). -/
theorem ConstantComparisonSequenceLimitsGe {x : RealSequence} {A B : ℝ}
    (hA : ConvergesTo x A) (h : ∃ N : ℕ, ∀ n ≥ N, x n ≥ B) : A ≥ B := by
  sorry

/-- `thm:constant-comparison-sequence-limits`, part (d). -/
theorem ConstantComparisonSequenceLimitsGt {x : RealSequence} {A B : ℝ}
    (hA : ConvergesTo x A) (h : ∃ N : ℕ, ∀ n ≥ N, x n > B) : A ≥ B := by
  sorry

/-- `thm:constant-squeeze-theorem`. -/
theorem ConstantSqueezeTheorem {x : RealSequence} {L : ℝ}
    (h : ∃ N₀ : ℕ, ∀ n ≥ N₀, L ≤ x n ∧ x n ≤ L) : ConvergesTo x L := by
  sorry

/-- `thm:sequence-squeeze-theorem`. -/
theorem SequenceSqueezeTheorem {a x b : RealSequence} {L : ℝ}
    (ha : ConvergesTo a L) (hb : ConvergesTo b L)
    (h : ∃ N₀ : ℕ, ∀ n ≥ N₀, a n ≤ x n ∧ x n ≤ b n) : ConvergesTo x L := by
  sorry

/-- `thm:absolute-value-squeeze-theorem`. -/
theorem AbsoluteValueSqueezeTheorem {x u : RealSequence} {L : ℝ}
    (hu : ConvergesTo u 0) (h : ∃ N₀ : ℕ, ∀ n ≥ N₀, |x n - L| ≤ u n) :
    ConvergesTo x L := by
  sorry

/-- ADDITION (not a `.tex` label — see `ADDITIONS.md` item 4). Every
convergent sequence is bounded. Invoked by name twice already in the
read-order (`ex:sequence-natural` in `SequenceDefinitions.lean`'s source,
and `thm:limit-of-a-product`'s own Interpretation remark in
`AlgebraOfLimits.lean`'s source) but never proved as its own citable
theorem anywhere in the .tex read so far. Proof idea: taking `ε = 1` in
the convergence definition gives a tail (from some `N` on) trapped within
`[L-1, L+1]`; the finitely many terms before `N` have their own maximum
absolute value (a finite set of reals always has one); take the larger of
the two bounds. -/
theorem ConvergentSequenceIsBounded {x : RealSequence} {L : ℝ}
    (h : ConvergesTo x L) : BoundedSeq x := by
  sorry

end LRA.VolumeIII.Analysis.Sequences
