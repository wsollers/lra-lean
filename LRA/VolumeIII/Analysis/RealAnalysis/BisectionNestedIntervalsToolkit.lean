/-
Draft module; not yet imported by the active Volume III root.
Source: real-analysis/notes/proof-techniques/bisection-nested-intervals.tex
(§4 of the proof-techniques subsection).

Audit note: `thm:nested-interval-property` here is this chapter's own
restatement of NIP — the SAME underlying fact as the Completeness
chapter's own `thm:nested-interval-property` content (see
`Bounding/NestedIntervalProperty.lean`, formalized earlier in
this pass). Both get their own Lean statement since they are distinct
labeled nodes in distinct chapters. `def:bisection-sequence` is a
schema/template (branches on an unspecified property `P`), not a single
theorem -- not directly formalized as its own statement; its two concrete
instantiations (`prop:ivt-bisection`, `BwBisection` in
`PredicateWalkingToolkit.lean`) are what get formalized.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Topology.Order.Basic
import Mathlib.Topology.Instances.Real.Lemmas

namespace LRA.VolumeIII.Analysis.RealAnalysis

-- `thm:nested-interval-property`
/-- If `a b : ℕ → ℝ`, `hle : ∀ n, a n ≤ b n`, and `hnest : ∀ n, a n ≤ a (n + 1) ∧ b (n + 1) ≤ b n`.
Then `∃ x : ℝ, ∀ n, a n ≤ x ∧ x ≤ b n`. -/
theorem NestedIntervalProperty (a b : ℕ → ℝ)
    (hle : ∀ n, a n ≤ b n)
    (hnest : ∀ n, a n ≤ a (n + 1) ∧ b (n + 1) ≤ b n) :
    ∃ x : ℝ, ∀ n, a n ≤ x ∧ x ≤ b n := by
  sorry

/-- Let `a b L : ℝ`. If `f : ℝ → ℝ`, `hab : a < b`, `hf : ContinuousOn f (Set.Icc a b)`, and `hL :
(f a < L ∧ L < f b) ∨ (f a > L ∧ L > f b)`. Then `∃ c ∈ Set.Ioo a b, f c = L`. -/
theorem IvtBisection (f : ℝ → ℝ) (a b L : ℝ) (hab : a < b)
    (hf : ContinuousOn f (Set.Icc a b))
    (hL : (f a < L ∧ L < f b) ∨ (f a > L ∧ L > f b)) :
    ∃ c ∈ Set.Ioo a b, f c = L := by
  sorry

/-- The theorem asserts `¬ ∃ x : ℕ → ℝ, Function.Surjective x`. -/
theorem RUncountable : ¬ ∃ x : ℕ → ℝ, Function.Surjective x := by
  sorry

end LRA.VolumeIII.Analysis.RealAnalysis
