/-
SCRATCH FILE — not wired into the lra-lean project.
Imports only this pass's own scratch files and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Bounding.Bounds`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/bounding/notes/completeness/notes-nested-interval-property.tex
Fourth file of `completeness` (installment 4 of 6 for this chapter).

Structural check: 84 `\begin{remark*}`/`\end{remark*}` (balanced), 14
"Failure modes" occurrences matching the 14 labeled nodes — clean, no
duplication bug.

Math content verified correct on all 14 nodes — this is the standard
nested-closed-bounded-interval package (endpoint monotonicity lemmas ->
cross-endpoint bound lemma -> sup/inf-of-endpoints inequality -> Nested
Interval Theorem -> "the intersection is exactly [alpha,beta]" corollaries
-> vanishing-length sharpening to a unique point/common limit -> the
three counterexample propositions showing open-ness, closedness, and
boundedness are each independently necessary). Hand-verified the two
subtler claims:
  - `cor:nested-intervals-vanishing-length-have-unique-point`'s
    "Moreover x = sup{a_n} = inf{b_n}" follows because
    `lem:endpoint-supremum-infimum-inequality` always gives alpha <= beta,
    and the vanishing-length hypothesis forces beta - alpha <= b_n - a_n
    -> 0, so alpha = beta = x.
  - `cor:unique-point-in-nested-intervals-is-endpoint-limit`'s converse
    direction implicitly uses that the intersection equals exactly
    `[alpha, beta]` (x in intersection of all [a_n,b_n] iff x >= sup a_n
    and x <= inf b_n), so intersection = {x} forces alpha = beta = x,
    and THEN needs "increasing sequence bounded above converges to its
    sup" (the epsilon-characterization argument: for eps > 0, some a_N >
    x - eps by def of sup, and monotonicity carries that bound forward)
    to get lim a_n = x. That underlying convergence fact is not cited in
    this node's `\begin{dependencies}` list (only Closed Interval,
    Bounded Subset of R are listed) — a minor missing-dependency-citation
    gap, not a math error; flagged for awareness, not fixed here.

Two remark-block precision findings (**reported, not auto-fixed**, per
this pass's "report bad/imprecise statements, don't auto-correct content"
policy):
  - `lem:nested-closed-intervals-have-ordered-endpoints`'s theorem
    conclusion is the FULL general statement "for all m,n with n <= m,
    a_n <= a_m <= b_m <= b_n" (arbitrary index gap). But its "Standard
    quantified statement" / "Predicate reading" / "Negated quantified
    statement" / "Negation predicate reading" / "Failure modes" remark
    blocks all only formalize the trivial ONE-STEP case (n and n+1) —
    which is really just unpacking what interval containment means, not
    the lemma's actual (harder, telescoped) conclusion for general m,n.
    Narrower than the theorem it's attached to.
  - `cor:nested-intervals-vanishing-length-have-unique-point`'s remark
    blocks formalize only the existence-and-uniqueness-of-x half of the
    corollary; the "Moreover, x = sup{a_n} = inf{b_n}" clause is entirely
    absent from every remark box. Same pattern as `cor:no-gaps-in-r` in
    the previous file (`notes-order-separation.tex`) — remark boxes that
    quietly drop a "Moreover"/appended clause from the theorem-environment
    statement they're supposed to be unpacking.

Formalized generically where the .tex itself is generic (index-shift
lemmas hold for any `LinearOrder`/`ConditionallyCompleteLinearOrder`-ish
structure in principle, but since the .tex states everything over R and
leans on R's completeness from `endpoint_supremum_infimum_inequality`
onward, kept over R throughout for fidelity and simplicity — no earlier
scratch file in this pass has built a general "nested interval" theory
over abstract `S` to hook into). `IsSupremum`/`IsInfimum` reused from
`SupremaInfima.lean`; `IsUpperBoundOf`/`IsLowerBoundOf` from
`UpperLowerBounds.lean`. Sequence convergence borrows Mathlib's
`Filter.Tendsto _ Filter.atTop (nhds _)`, matching the pattern established
in `CompletenessEquivalences.lean`.
-/

import Mathlib.Order.Defs
import Mathlib.Data.Set.Defs
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.VolumeIII.Analysis.Bounding.Scratch.UpperLowerBounds
import LRA.VolumeIII.Analysis.Bounding.Scratch.SupremaInfima

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Bounding
namespace Scratch

variable (a b : ℕ → ℝ)

/-- Standing hypotheses shorthand (not a `.tex` label): `a n ≤ b n`
pointwise, and `[a (n+1), b (n+1)] ⊆ [a n, b n]` for every `n`. Bundled
into a `structure` purely to cut down repetition across the theorems
below — every theorem in this file states it out again explicitly in its
hypotheses rather than taking this structure directly, matching how the
.tex re-states the two hypotheses in every lemma box. -/
def IsNestedClosedIntervalFamily : Prop :=
  (∀ n, a n ≤ b n) ∧ (∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))

/-- `lem:nested-closed-intervals-have-ordered-endpoints`. Stated at full
generality (arbitrary `n ≤ m`), matching the theorem-environment
conclusion — NOT the narrower one-step form the .tex's own remark blocks
formalize (see audit note above). -/
theorem nested_closed_intervals_have_ordered_endpoints
    (h1 : ∀ n, a n ≤ b n)
    (h2 : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {m n : ℕ} (hnm : n ≤ m) : a n ≤ a m ∧ a m ≤ b m ∧ b m ≤ b n := by
  sorry

/-- `lem:left-endpoints-nested-intervals-increasing`. -/
theorem left_endpoints_nested_intervals_increasing
    (h1 : ∀ n, a n ≤ b n)
    (h2 : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ n, a n ≤ a (n + 1) := by
  sorry

/-- `lem:right-endpoints-nested-intervals-decreasing`. -/
theorem right_endpoints_nested_intervals_decreasing
    (h1 : ∀ n, a n ≤ b n)
    (h2 : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ n, b (n + 1) ≤ b n := by
  sorry

/-- `lem:left-endpoints-bounded-above-by-right-endpoints`. -/
theorem left_endpoints_bounded_above_by_right_endpoints
    (h1 : ∀ n, a n ≤ b n)
    (h2 : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ m n, a n ≤ b m := by
  sorry

/-- `lem:endpoint-supremum-infimum-inequality`. -/
theorem endpoint_supremum_infimum_inequality
    (h1 : ∀ n, a n ≤ b n)
    (h2 : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {α β : ℝ} (hα : IsSupremum α (Set.range a)) (hβ : IsInfimum β (Set.range b)) :
    α ≤ β := by
  sorry

/-- `thm:nested-interval-theorem`. -/
theorem nested_interval_theorem
    (h1 : ∀ n, a n ≤ b n)
    (h2 : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {α β : ℝ} (hα : IsSupremum α (Set.range a)) (hβ : IsInfimum β (Set.range b)) :
    α ≤ β ∧ (⋂ n, Set.Icc (a n) (b n)).Nonempty ∧
      ∃ x : ℝ, ∀ n, a n ≤ x ∧ x ≤ b n := by
  sorry

/-- `cor:nested-interval-intersection-contains-endpoint-supremum`. -/
theorem nested_interval_intersection_contains_endpoint_supremum
    (h1 : ∀ n, a n ≤ b n)
    (h2 : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {α : ℝ} (hα : IsSupremum α (Set.range a)) :
    (∀ n, a n ≤ α ∧ α ≤ b n) ∧ α ∈ ⋂ n, Set.Icc (a n) (b n) := by
  sorry

/-- `cor:nested-interval-intersection-contains-endpoint-infimum`. -/
theorem nested_interval_intersection_contains_endpoint_infimum
    (h1 : ∀ n, a n ≤ b n)
    (h2 : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {β : ℝ} (hβ : IsInfimum β (Set.range b)) :
    (∀ n, a n ≤ β ∧ β ≤ b n) ∧ β ∈ ⋂ n, Set.Icc (a n) (b n) := by
  sorry

/-- `cor:nested-intervals-vanishing-length-have-unique-point`. Includes the
"Moreover, `x = sup {a_n} = inf {b_n}`" clause that the .tex's own remark
blocks for this node omit (see audit note above) — the full
theorem-environment statement, not the narrower remark-box version. -/
theorem nested_intervals_vanishing_length_have_unique_point
    (h1 : ∀ n, a n ≤ b n)
    (h2 : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    (hvanish : ∀ ε > 0, ∃ N, ∀ n ≥ N, 0 ≤ b n - a n ∧ b n - a n < ε) :
    ∃! x : ℝ, (∀ n, a n ≤ x ∧ x ≤ b n) ∧
      (IsSupremum x (Set.range a) ∧ IsInfimum x (Set.range b)) := by
  sorry

/-- `cor:nested-intervals-vanishing-length-have-equal-endpoint-limits`. -/
theorem nested_intervals_vanishing_length_have_equal_endpoint_limits
    (h1 : ∀ n, a n ≤ b n)
    (h2 : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    (hvanish : ∀ ε > 0, ∃ N, ∀ n ≥ N, b n - a n < ε) :
    ∃ x : ℝ, Filter.Tendsto a Filter.atTop (nhds x) ∧
      Filter.Tendsto b Filter.atTop (nhds x) := by
  sorry

/-- `cor:unique-point-in-nested-intervals-is-endpoint-limit`. Converse
direction: intersection is a known singleton `{x}` (vanishing length is
not assumed directly, only derived — see audit note above on the implicit
"increasing bounded sequence converges to its sup" step this needs). -/
theorem unique_point_in_nested_intervals_is_endpoint_limit
    (h1 : ∀ n, a n ≤ b n)
    (h2 : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {x : ℝ} (hx : (⋂ n, Set.Icc (a n) (b n)) = {x}) :
    Filter.Tendsto a Filter.atTop (nhds x) ∧
      Filter.Tendsto b Filter.atTop (nhds x) := by
  sorry

/-- `prop:open-nested-intervals-need-not-have-nonempty-intersection`.
Witnessed concretely by `I_n = (0, 1/n)`, per the .tex's own example. -/
theorem open_nested_intervals_need_not_have_nonempty_intersection :
    ∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧
      (∀ n, Set.Ioo (a (n + 1)) (b (n + 1)) ⊆ Set.Ioo (a n) (b n)) ∧
      (⋂ n, Set.Ioo (a n) (b n)) = ∅ := by
  sorry

/-- `prop:closedness-is-necessary-in-nested-interval-theorem`. Witnessed
by `I_n = (0, 1/n]`. Stated with `Set.Ioc` (half-open) to match "not all
closed" — the .tex's actual example is entirely half-open, not merely
"some" interval failing to be closed. -/
theorem closedness_is_necessary_in_nested_interval_theorem :
    ∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧
      (∀ n, Set.Ioc (a (n + 1)) (b (n + 1)) ⊆ Set.Ioc (a n) (b n)) ∧
      (⋂ n, Set.Ioc (a n) (b n)) = ∅ := by
  sorry

/-- `prop:boundedness-is-necessary-in-nested-interval-theorem`. Witnessed
by `I_n = [n, ∞)`. -/
theorem boundedness_is_necessary_in_nested_interval_theorem :
    ∃ a : ℕ → ℝ, (∀ n, Set.Ici (a (n + 1)) ⊆ Set.Ici (a n)) ∧
      (⋂ n, Set.Ici (a n)) = ∅ := by
  sorry

end Scratch
end Bounding
end Analysis
end VolumeIII
end LRA
