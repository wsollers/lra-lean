/-
SCRATCH FILE — not wired into the lra-lean project.
Imports only this pass's own scratch files and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Bounding.Bounds`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/bounding/notes/completeness/notes-density.tex
Sixth and last file of `completeness` (installment 6 of 6). Its
duplicated-Failure-modes structural bug (5 pairs) was already fixed in the
earlier corpus-wide batch pass; this is the first full math-content audit.
Structural re-check: 74/74 balanced `\begin{remark*}`/`\end{remark*}`, 19
labeled nodes — clean.

All 19 nodes are mathematically correct (this is the standard
density-of-Q/irrationals-in-R package: topological density -> order
density -> Q dense in R -> the eight rational/irrational arithmetic
closure facts -> density of the irrationals -> the four "between two
rationals/irrationals" corollaries -> "no adjacent reals" ->
no-immediate-successor/predecessor -> both types coexist in every
interval). Spot-checked the two least-obvious closure facts by hand:
`lem:nonzero-rational-product-preserves-irrationality` (if `qx` were
rational for nonzero rational `q`, then `x = (qx)/q` would be rational,
contradiction) and `lem:irrational-minus-irrational-need-not-be-irrational`
(the witness `x = y = sqrt 2` gives `x - y = 0 in Q`, correctly showing
irrationality is NOT closed under subtraction — unlike the adjacent lemmas
`rational ± irrational` and `irrational ± rational`, which ARE always
irrational).

UNLIKE `notes-archimedean-property.tex`, this file's remark blocks
(Standard quantified statement / Predicate reading / etc.) are genuinely
consistent with their own theorem-environment boxes throughout — no
content-mismatch or narrowing findings here. The simple arithmetic-closure
lemmas (translation/difference-preserves-rationality,
rational-times-irrational, etc.) consistently carry only
Standard+Predicate+Interpretation (no Negated/Failure-modes blocks) — a
deliberate, consistent lighter treatment for closure facts, matching the
same pattern already seen for closure-style results elsewhere in this
chapter, not an omission.

`IsOrderDenseSubset` formalizes `def:order-dense-subset` generically over
`S`; `def:dense-subset` (general topological density) is genuinely
topological and only used here to motivate order density, so not given
its own theorem below (no proposition in this file's node list actually
needs `closure D = univ` directly — order density is what's used
throughout). Rationality/irrationality of a real number `x` is expressed
as `x ∈ Set.range ((↑) : ℚ → ℝ)` / `x ∉ Set.range ((↑) : ℚ → ℝ)`, matching
Mathlib's standard idiom for "is rational" without inventing a new
predicate name.
-/

import Mathlib.Order.Defs
import Mathlib.Data.Set.Defs
import Mathlib.Data.Rat.Cast.Defs
import Mathlib.Topology.Basic

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Bounding
namespace Scratch

/-- `def:order-dense-subset`. -/
def IsOrderDenseSubset {S : Type*} [Preorder S] (D : Set S) : Prop :=
  ∀ x y : S, x < y → ∃ d ∈ D, x < d ∧ d < y

/-- Shorthand (not a `.tex` label): "`x` is rational," matching Mathlib's
standard idiom rather than inventing a new predicate name. -/
def IsRat (x : ℝ) : Prop := x ∈ Set.range ((↑) : ℚ → ℝ)

/-- `thm:density-of-rationals-in-reals`. -/
theorem density_of_rationals_in_reals {a b : ℝ} (hab : a < b) :
    ∃ q : ℚ, a < (q : ℝ) ∧ (q : ℝ) < b := by
  sorry

/-- `lem:rational-translation-preserves-rationality`. -/
theorem rational_translation_preserves_rationality (r q : ℚ) :
    IsRat ((r : ℝ) + (q : ℝ)) := by
  sorry

/-- `lem:rational-difference-preserves-rationality`. -/
theorem rational_difference_preserves_rationality (r q : ℚ) :
    IsRat ((r : ℝ) - (q : ℝ)) := by
  sorry

/-- `lem:nonzero-rational-product-preserves-irrationality`. -/
theorem nonzero_rational_product_preserves_irrationality {q : ℚ} (hq : q ≠ 0)
    {x : ℝ} (hx : ¬ IsRat x) : ¬ IsRat ((q : ℝ) * x) := by
  sorry

/-- `lem:rational-translation-preserves-irrationality`. -/
theorem rational_translation_preserves_irrationality {q : ℚ} {x : ℝ}
    (hx : ¬ IsRat x) : ¬ IsRat ((q : ℝ) + x) := by
  sorry

/-- `lem:irrational-minus-irrational-need-not-be-irrational`. Witnessed by
`x = y = √2`, per the .tex's own example. -/
theorem irrational_minus_irrational_need_not_be_irrational :
    ∃ x y : ℝ, ¬ IsRat x ∧ ¬ IsRat y ∧ IsRat (x - y) := by
  sorry

/-- `lem:rational-minus-irrational-is-irrational`. -/
theorem rational_minus_irrational_is_irrational {q : ℚ} {x : ℝ}
    (hx : ¬ IsRat x) : ¬ IsRat ((q : ℝ) - x) := by
  sorry

/-- `lem:irrational-plus-rational-is-irrational`. -/
theorem irrational_plus_rational_is_irrational {x : ℝ} {q : ℚ}
    (hx : ¬ IsRat x) : ¬ IsRat (x + (q : ℝ)) := by
  sorry

/-- `lem:irrational-minus-rational-is-irrational`. -/
theorem irrational_minus_rational_is_irrational {x : ℝ} {q : ℚ}
    (hx : ¬ IsRat x) : ¬ IsRat (x - (q : ℝ)) := by
  sorry

/-- `thm:density-of-irrationals-in-reals`. -/
theorem density_of_irrationals_in_reals {a b : ℝ} (hab : a < b) :
    ∃ s : ℝ, ¬ IsRat s ∧ a < s ∧ s < b := by
  sorry

/-- `thm:irrational-between-any-two-rationals`. -/
theorem irrational_between_any_two_rationals {r s : ℚ} (hrs : r < s) :
    ∃ x : ℝ, ¬ IsRat x ∧ (r : ℝ) < x ∧ x < (s : ℝ) := by
  sorry

/-- `thm:rational-between-any-two-irrationals`. -/
theorem rational_between_any_two_irrationals {x y : ℝ} (hx : ¬ IsRat x)
    (hy : ¬ IsRat y) (hxy : x < y) : ∃ q : ℚ, x < (q : ℝ) ∧ (q : ℝ) < y := by
  sorry

/-- `lem:small-irrational-positive-number`. -/
theorem small_irrational_positive_number {ε : ℝ} (hε : ε > 0) :
    ∃ η : ℝ, ¬ IsRat η ∧ 0 < η ∧ η < ε := by
  sorry

/-- `cor:no-adjacent-real-numbers`. -/
theorem no_adjacent_real_numbers {a b : ℝ} (hab : a < b) :
    ∃ c : ℝ, a < c ∧ c < b := by
  sorry

/-- `thm:no-immediate-successors-in-r`. -/
theorem no_immediate_successors_in_r (a : ℝ) :
    ¬ ∃ m : ℝ, a < m ∧ ∀ x : ℝ, a < x → m ≤ x := by
  sorry

/-- `thm:no-immediate-predecessors-in-r`. -/
theorem no_immediate_predecessors_in_r (a : ℝ) :
    ¬ ∃ m : ℝ, m < a ∧ ∀ x : ℝ, x < a → x ≤ m := by
  sorry

/-- `cor:every-open-interval-contains-rational-and-irrational`. -/
theorem every_open_interval_contains_rational_and_irrational {a b : ℝ}
    (hab : a < b) :
    (∃ q : ℚ, a < (q : ℝ) ∧ (q : ℝ) < b) ∧ (∃ s : ℝ, ¬ IsRat s ∧ a < s ∧ s < b) := by
  sorry

end Scratch
end Bounding
end Analysis
end VolumeIII
end LRA
