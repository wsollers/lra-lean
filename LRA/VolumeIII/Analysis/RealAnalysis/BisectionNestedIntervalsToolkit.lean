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
theorem — not directly formalized as its own statement; its two concrete
instantiations (`prop:ivt-bisection`, `BwBisection` in
`PredicateWalkingToolkit.lean`) are what get formalized.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Topology.Order.Basic
import Mathlib.Topology.Instances.Real.Lemmas

namespace LRA
namespace VolumeIII
namespace Analysis
namespace RealAnalysis

/-- `thm:nested-interval-property`, this chapter's restatement: nested
closed bounded intervals `[a_n,b_n]` have nonempty intersection. -/
theorem NestedIntervalProperty (a b : ℕ → ℝ)
    (hle : ∀ n, a n ≤ b n)
    (hnest : ∀ n, a n ≤ a (n + 1) ∧ b (n + 1) ≤ b n) :
    ∃ x : ℝ, ∀ n, a n ≤ x ∧ x ≤ b n := by
  sorry

/-- `prop:ivt-bisection`. The Intermediate Value Theorem, proved via the
bisection route (property-propagation on a sign change, closed by NIP)
rather than the sup-based `K = {x : f(x) ≤ 0}` route mentioned as the
alternative "AoC path" in the same remark. -/
theorem IvtBisection (f : ℝ → ℝ) (a b L : ℝ) (hab : a < b)
    (hf : ContinuousOn f (Set.Icc a b))
    (hL : (f a < L ∧ L < f b) ∨ (f a > L ∧ L > f b)) :
    ∃ c ∈ Set.Ioo a b, f c = L := by
  sorry

/-- `prop:r-uncountable`. `ℝ` is uncountable, proved via nested-interval
diagonalisation (the geometric form of Cantor's diagonal argument): no
sequence `x : ℕ → ℝ` can be surjective. -/
theorem RUncountable : ¬ ∃ x : ℕ → ℝ, Function.Surjective x := by
  sorry

end RealAnalysis
end Analysis
end VolumeIII
end LRA
