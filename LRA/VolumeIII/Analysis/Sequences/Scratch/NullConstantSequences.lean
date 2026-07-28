/-
SCRATCH FILE — not wired into the lra-lean project.
Imports only this pass's own scratch files and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Sequences.*`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/sequences/notes/definition/notes-null-constant-sequences.tex
Second file of `definition` (installment 2 of 2). Structural check: 81/81
balanced remark blocks, 21 labeled nodes — clean, no duplication bug.

All 21 nodes are mathematically correct — standard package: constant /
null / ultimately-constant sequences, their convergence facts, the
"convergence = null tail-shift" translation lemma, tail-invariance of
convergence, and one-/two-sided boundedness with the tail and
absolute-value reformulations.

Two minor findings, reported not fixed:
  - `thm:difference-from-limit-is-null`'s "Standard quantified statement"
    remark shows the LEFT side (`ConvergesTo`) and RIGHT side (`IsNull`)
    as the exact same displayed formula `forall eps exists N forall n>=N,
    |x_n - L| < eps`. This is NOT a copy-paste bug — it's mathematically
    correct and rather the point: unpacking `IsNull` applied to the
    sequence `(x_n - L)` literally produces the same predicate as
    `ConvergesTo(x_n, L)`, which is exactly why this theorem is close to
    definitional. Flagged only so it isn't mistaken for the
    leftover-formula corruption pattern from the Bounds pass — this one
    is correct as written.
  - `thm:absolute-bound-upper-lower-bounds` and
    `thm:upper-lower-bounds-absolute-bound` both have "Predicate reading"
    remarks that are verbatim copies of their own "Standard quantified
    statement" remarks (including the prose header), rather than
    translating into the corpus's named predicates
    (`Bounded`/`BoundedAbove`/`BoundedBelow`) the way every other node in
    this file does. Not wrong math, just not doing a Predicate reading's
    job — minor authoring gap.
  - The three "Eventually ... Tail Formulation" theorems' Predicate
    readings use an `Eventually(x_n, P)` operator that isn't formally
    defined anywhere in this file (or earlier) — presumably intended to
    be introduced in the upcoming `tails` section (the very next section
    per `notes/index.tex`). One-section forward reference, not a bug.

Formalized generic sequence predicates below (`IsConstant`, `IsNull`,
`IsUltimatelyConstant`, `BoundedAboveSeq`, `BoundedBelowSeq`,
`BoundedSeq`) scoped to `RealSequence` from `SequenceDefinitions.lean`;
convergence reuses Mathlib's `Filter.Tendsto _ Filter.atTop (nhds _)`
rather than inventing a project `ConvergesTo` predicate, matching the
forward-dependency handling established in the Bounds pass (the project's
own `def:convergent-sequence` hasn't been read yet — it's the very next
section, `convergence`).
-/

import Mathlib.Order.Defs
import Mathlib.Topology.Instances.Real.Lemmas
import Mathlib.Order.Filter.AtTopBot.Basic
import LRA.VolumeIII.Analysis.Sequences.Scratch.SequenceDefinitions

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Sequences
namespace Scratch

/-- `def:constant-sequence`. -/
def IsConstant (x : RealSequence) (c : ℝ) : Prop := ∀ n, x n = c

/-- `def:null-sequence`. -/
def IsNull (x : RealSequence) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |x n| < ε

/-- `def:ultimately-constant-sequence`. -/
def IsUltimatelyConstant (x : RealSequence) (c : ℝ) : Prop :=
  ∃ N : ℕ, ∀ n ≥ N, x n = c

/-- `def:sequence-bounded-above`. -/
def BoundedAboveSeq (x : RealSequence) : Prop := ∃ M : ℝ, ∀ n, x n ≤ M

/-- `def:sequence-bounded-below`. -/
def BoundedBelowSeq (x : RealSequence) : Prop := ∃ m : ℝ, ∀ n, m ≤ x n

/-- `def:bounded-sequence`. -/
def BoundedSeq (x : RealSequence) : Prop := ∃ M > 0, ∀ n, |x n| ≤ M

/-- `thm:constant-sequence-convergence`. -/
theorem constant_sequence_convergence {x : RealSequence} {c : ℝ}
    (h : IsConstant x c) : Filter.Tendsto x Filter.atTop (nhds c) := by
  sorry

/-- `thm:zero-sequence-is-null`. -/
theorem zero_sequence_is_null {x : RealSequence} (h : IsConstant x 0) :
    IsNull x := by
  sorry

/-- `thm:constant-null-sequence`. -/
theorem constant_null_sequence {x : RealSequence} {c : ℝ}
    (h : IsConstant x c) : IsNull x ↔ c = 0 := by
  sorry

/-- `thm:difference-from-limit-is-null`. -/
theorem difference_from_limit_is_null (x : RealSequence) (L : ℝ) :
    Filter.Tendsto x Filter.atTop (nhds L) ↔ IsNull (fun n => x n - L) := by
  sorry

/-- `thm:ultimately-constant-sequence-convergence`. -/
theorem ultimately_constant_sequence_convergence {x : RealSequence} {c : ℝ}
    (h : IsUltimatelyConstant x c) :
    Filter.Tendsto x Filter.atTop (nhds c) := by
  sorry

/-- `thm:constant-implies-ultimately-constant`. -/
theorem constant_implies_ultimately_constant {x : RealSequence} {c : ℝ}
    (h : IsConstant x c) : IsUltimatelyConstant x c := by
  sorry

/-- `thm:ultimately-zero-sequence-is-null`. -/
theorem ultimately_zero_sequence_is_null {x : RealSequence}
    (h : IsUltimatelyConstant x 0) : IsNull x := by
  sorry

/-- `thm:ultimately-constant-null-sequence`. -/
theorem ultimately_constant_null_sequence {x : RealSequence} {c : ℝ}
    (h : IsUltimatelyConstant x c) : IsNull x ↔ c = 0 := by
  sorry

/-- `thm:tail-equality-preserves-convergence`. -/
theorem tail_equality_preserves_convergence {x y : RealSequence}
    (h : ∃ N₀ : ℕ, ∀ n ≥ N₀, x n = y n) (L : ℝ) :
    Filter.Tendsto x Filter.atTop (nhds L) ↔
      Filter.Tendsto y Filter.atTop (nhds L) := by
  sorry

/-- `thm:eventually-bounded-above-tail-formulation`. -/
theorem eventually_bounded_above_tail_formulation (x : RealSequence) :
    BoundedAboveSeq x ↔ ∃ N₀ : ℕ, ∃ M : ℝ, ∀ n ≥ N₀, x n ≤ M := by
  sorry

/-- `thm:eventually-bounded-below-tail-formulation`. -/
theorem eventually_bounded_below_tail_formulation (x : RealSequence) :
    BoundedBelowSeq x ↔ ∃ N₀ : ℕ, ∃ m : ℝ, ∀ n ≥ N₀, m ≤ x n := by
  sorry

/-- `thm:eventually-bounded-tail-formulation`. -/
theorem eventually_bounded_tail_formulation (x : RealSequence) :
    BoundedSeq x ↔ ∃ N₀ : ℕ, ∃ M > 0, ∀ n ≥ N₀, |x n| ≤ M := by
  sorry

/-- `thm:bounded-sequence-bounded-above-below`. -/
theorem bounded_sequence_bounded_above_below (x : RealSequence) :
    BoundedSeq x ↔ (BoundedAboveSeq x ∧ BoundedBelowSeq x) := by
  sorry

/-- `thm:absolute-bound-upper-lower-bounds`. -/
theorem absolute_bound_upper_lower_bounds {x : RealSequence} {K : ℝ}
    (hK : K > 0) (h : ∀ n, |x n| ≤ K) : ∀ n, -K ≤ x n ∧ x n ≤ K := by
  sorry

/-- `thm:upper-lower-bounds-absolute-bound`. -/
theorem upper_lower_bounds_absolute_bound {x : RealSequence} {m M : ℝ}
    (h : ∀ n, m ≤ x n ∧ x n ≤ M) : ∃ K > 0, ∀ n, |x n| ≤ K := by
  sorry

end Scratch
end Sequences
end Analysis
end VolumeIII
end LRA
