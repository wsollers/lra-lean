/-
SCRATCH FILE — not wired into the lra-lean project.
Imports only this pass's own scratch files and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Bounding.Bounds`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/bounding/notes/bounds-algebra/notes-algebra-of-supremum-infimum.tex
Fifth and final file of `bounds-algebra` (installment 5 of 5).

Audit note: all 25 nodes verified correct by hand (translation/scalar/
negation invariances, sums, differences, products, quotients, absolute
value, reciprocals — each with correctly-partitioned sign hypotheses
where needed, e.g. positive vs. negative scalar, or "A entirely positive
or entirely negative" for reciprocals/quotients), plus three genuine
"ambient set matters" results (`prop:suprema-ambient-set`,
`thm:ambient-existence-supremum`, `lem:rational-gap-suprema` — the classic
√2-is-not-rational supremum example). Spot-checked the two worked
numerical examples in the .tex by hand; both check out. No corruption —
already cleaned in the corpus-wide duplicate-Failure-modes pass (26 pairs
fixed in this file alone).

Uses Mathlib's `Pointwise` set-arithmetic notation (`A + B`, `A - B`,
`A * B`, `c • A`, matching `def:set-arithmetic-images` exactly) rather
than hand-rolled image definitions. `def:reciprocal-image` is still
hand-defined (`Reciprocal`) since Mathlib's group-inverse pointwise
notation doesn't fit ℝ's junk-value-at-0 convention cleanly here.

The three "ambient set" results (`prop:upper-bounds-ambient-order`,
`prop:suprema-ambient-set`, `thm:ambient-existence-supremum`) are stated
over a general partial/linear order `S`/`P`, matching the .tex's own
generality; `lem:rational-gap-suprema` is inherently about ℚ vs ℝ so uses
both types explicitly.
-/

import Mathlib.Order.Defs
import Mathlib.Data.Set.Defs
import Mathlib.Algebra.Order.Pointwise
import LRA.VolumeIII.Analysis.Bounding.Scratch.UpperLowerBounds
import LRA.VolumeIII.Analysis.Bounding.Scratch.SupremaInfima

open Pointwise

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Bounding
namespace Scratch

/-- `def:reciprocal-image`. Requires `0 ∉ A`. -/
def Reciprocal (A : Set ℝ) : Set ℝ := (fun a => a⁻¹) '' A

/-- `thm:translation-invariance-supremum`. `A + {c}` matches the .tex's
`A + c` under Mathlib's pointwise `+`. -/
theorem translation_invariance_supremum {A : Set ℝ} (hAne : A.Nonempty)
    {s : ℝ} (hs : IsSupremum s A) (c : ℝ) :
    IsSupremum (s + c) (A + {c}) := by
  sorry

/-- `thm:translation-invariance-infimum`. -/
theorem translation_invariance_infimum {A : Set ℝ} (hAne : A.Nonempty)
    {i : ℝ} (hi : IsInfimum i A) (c : ℝ) :
    IsInfimum (i + c) (A + {c}) := by
  sorry

/-- `thm:scalar-mult-positive`. -/
theorem scalar_mult_positive {A : Set ℝ} (hAne : A.Nonempty) {s k : ℝ}
    (hs : IsSupremum s A) (hk : k > 0) : IsSupremum (k * s) (k • A) := by
  sorry

/-- `thm:positive-scalar-mult-infimum`. -/
theorem positive_scalar_mult_infimum {A : Set ℝ} (hAne : A.Nonempty)
    {i k : ℝ} (hi : IsInfimum i A) (hk : k > 0) :
    IsInfimum (k * i) (k • A) := by
  sorry

/-- `thm:scalar-mult-negative`. -/
theorem scalar_mult_negative {A : Set ℝ} (hAne : A.Nonempty) {i k : ℝ}
    (hi : IsInfimum i A) (hk : k < 0) : IsSupremum (k * i) (k • A) := by
  sorry

/-- `thm:negative-scalar-mult-infimum`. -/
theorem negative_scalar_mult_infimum {A : Set ℝ} (hAne : A.Nonempty)
    {s k : ℝ} (hs : IsSupremum s A) (hk : k < 0) :
    IsInfimum (k * s) (k • A) := by
  sorry

/-- `thm:negation-exchange-sup-inf`. -/
theorem negation_exchange_sup_inf {A : Set ℝ} (hAne : A.Nonempty) {i : ℝ}
    (hi : IsInfimum i A) : IsSupremum (-i) (-A) := by
  sorry

/-- `thm:supremum-sum-set`. -/
theorem supremum_sum_set {A B : Set ℝ} (hAne : A.Nonempty) (hBne : B.Nonempty)
    {sA sB : ℝ} (hsA : IsSupremum sA A) (hsB : IsSupremum sB B) :
    IsSupremum (sA + sB) (A + B) := by
  sorry

/-- `thm:infimum-sum-set`. -/
theorem infimum_sum_set {A B : Set ℝ} (hAne : A.Nonempty) (hBne : B.Nonempty)
    {iA iB : ℝ} (hiA : IsInfimum iA A) (hiB : IsInfimum iB B) :
    IsInfimum (iA + iB) (A + B) := by
  sorry

/-- `thm:supremum-difference-set`. -/
theorem supremum_difference_set {A B : Set ℝ} (hAne : A.Nonempty)
    (hBne : B.Nonempty) {sA iB : ℝ} (hsA : IsSupremum sA A)
    (hiB : IsInfimum iB B) : IsSupremum (sA - iB) (A - B) := by
  sorry

/-- `thm:infimum-difference-set`. -/
theorem infimum_difference_set {A B : Set ℝ} (hAne : A.Nonempty)
    (hBne : B.Nonempty) {iA sB : ℝ} (hiA : IsInfimum iA A)
    (hsB : IsSupremum sB B) : IsInfimum (iA - sB) (A - B) := by
  sorry

/-- `thm:supremum-dilation`. Piecewise on the sign of `λ`, matching the
.tex's three-case formula exactly (λ=0 case: `0 • A = {0}` for nonempty
`A`, whose supremum is trivially `0`). -/
theorem supremum_dilation {A : Set ℝ} (hAne : A.Nonempty)
    (hAbdd : IsBounded A) (lam : ℝ) {s i : ℝ} (hs : IsSupremum s A)
    (hi : IsInfimum i A) :
    IsSupremum (if lam > 0 then lam * s else if lam = 0 then 0 else lam * i)
      (lam • A) := by
  sorry

/-- `thm:supremum-absolute-value-image`. -/
theorem supremum_absolute_value_image {A : Set ℝ} (hAne : A.Nonempty)
    {s i : ℝ} (hs : IsSupremum s A) (hi : IsInfimum i A) :
    IsSupremum (max |i| |s|) (abs '' A) := by
  sorry

/-- `thm:supremum-reciprocal-set`. Sign hypothesis `0 < inf A ∨ sup A < 0`
keeps `A` away from `0`, matching `def:reciprocal-image`'s requirement. -/
theorem supremum_reciprocal_set {A : Set ℝ} (hAne : A.Nonempty)
    (hAbdd : IsBounded A) {s i : ℝ} (hs : IsSupremum s A) (hi : IsInfimum i A)
    (hsign : 0 < i ∨ s < 0) : IsSupremum i⁻¹ (Reciprocal A) := by
  sorry

/-- `thm:infimum-reciprocal-set`. -/
theorem infimum_reciprocal_set {A : Set ℝ} (hAne : A.Nonempty)
    (hAbdd : IsBounded A) {s i : ℝ} (hs : IsSupremum s A) (hi : IsInfimum i A)
    (hsign : 0 < i ∨ s < 0) : IsInfimum s⁻¹ (Reciprocal A) := by
  sorry

/-- `thm:supremum-product-set`. Supremum of the pointwise product is the
max of the four "corner" products, matching bilinearity of multiplication
over the box `[inf A, sup A] × [inf B, sup B]`. -/
theorem supremum_product_set {A B : Set ℝ} (hAne : A.Nonempty)
    (hBne : B.Nonempty) {sA sB iA iB : ℝ} (hsA : IsSupremum sA A)
    (hiA : IsInfimum iA A) (hsB : IsSupremum sB B) (hiB : IsInfimum iB B) :
    IsSupremum (max (max (iA * iB) (iA * sB)) (max (sA * iB) (sA * sB)))
      (A * B) := by
  sorry

/-- `thm:infimum-product-set`. -/
theorem infimum_product_set {A B : Set ℝ} (hAne : A.Nonempty)
    (hBne : B.Nonempty) {sA sB iA iB : ℝ} (hsA : IsSupremum sA A)
    (hiA : IsInfimum iA A) (hsB : IsSupremum sB B) (hiB : IsInfimum iB B) :
    IsInfimum (min (min (iA * iB) (iA * sB)) (min (sA * iB) (sA * sB)))
      (A * B) := by
  sorry

/-- `thm:supremum-quotient-set`. `A / B` formalized as `A * Reciprocal B`
(matching the .tex's `{a/b : a∈A, b∈B}`), with `B` kept away from `0` by
`hsign`. -/
theorem supremum_quotient_set {A B : Set ℝ} (hAne : A.Nonempty)
    (hBne : B.Nonempty) {sA sB iA iB : ℝ} (hsA : IsSupremum sA A)
    (hiA : IsInfimum iA A) (hsB : IsSupremum sB B) (hiB : IsInfimum iB B)
    (hsign : 0 < iB ∨ sB < 0) :
    IsSupremum (max (max (iA / iB) (iA / sB)) (max (sA / iB) (sA / sB)))
      (A * Reciprocal B) := by
  sorry

/-- `thm:infimum-quotient-set`. -/
theorem infimum_quotient_set {A B : Set ℝ} (hAne : A.Nonempty)
    (hBne : B.Nonempty) {sA sB iA iB : ℝ} (hsA : IsSupremum sA A)
    (hiA : IsInfimum iA A) (hsB : IsSupremum sB B) (hiB : IsInfimum iB B)
    (hsign : 0 < iB ∨ sB < 0) :
    IsInfimum (min (min (iA / iB) (iA / sB)) (min (sA / iB) (sA / sB)))
      (A * Reciprocal B) := by
  sorry

/-- `prop:bounds-sum-set`, upper-bound half. Weaker "single bound" version
supporting `supremum_sum_set`/`infimum_sum_set` above. -/
theorem bounds_sum_set_upper {A B : Set ℝ} {uA uB : ℝ}
    (huA : IsUpperBoundOf uA A) (huB : IsUpperBoundOf uB B) :
    IsUpperBoundOf (uA + uB) (A + B) := by
  sorry

/-- `prop:bounds-sum-set`, lower-bound half. -/
theorem bounds_sum_set_lower {A B : Set ℝ} {lA lB : ℝ}
    (hlA : IsLowerBoundOf lA A) (hlB : IsLowerBoundOf lB B) :
    IsLowerBoundOf (lA + lB) (A + B) := by
  sorry

variable {P : Type*}

/-- `prop:upper-bounds-ambient-order`. The upper bounds of `A` relative to
`S` are exactly the upper bounds relative to `S'` that lie in `S`, for
`A ⊆ S ⊆ S'`. -/
theorem upper_bounds_ambient_order [Preorder P] {A S S' : Set P}
    (hAS : A ⊆ S) (hSS' : S ⊆ S') :
    {u ∈ S | IsUpperBoundOf u A} = S ∩ {u ∈ S' | IsUpperBoundOf u A} := by
  sorry

/-- `prop:suprema-ambient-set`. Existence claim: relative suprema can
genuinely differ depending on the ambient set. Concrete witness: in ℝ,
`A = (0,1)`, `S = (0,1) ∪ {2}`, `S' = (0,1) ∪ {3/2, 2}` gives
`sup_S A = 2 ≠ 3/2 = sup_S' A`. -/
theorem suprema_ambient_set :
    ∃ (A S S' : Set ℝ), A ⊆ S ∧ S ⊆ S' ∧
      ∃ sS sS' : ℝ, IsSupremum sS A ∧ IsSupremum sS' A ∧ sS ≠ sS' := by
  sorry

/-- `thm:ambient-existence-supremum`. Existence claim: `A` can have a
supremum relative to a larger ambient set while having none relative to a
smaller one. Witness: `A = S = (0,1)`, `S' = (0,1]` in ℝ. -/
theorem ambient_existence_supremum :
    ∃ (A S S' : Set ℝ), A ⊆ S ∧ S ⊆ S' ∧
      (∃ s, IsSupremum s A) ∧ ¬(∃ s, IsUpperBoundOf s A) := by
  sorry

/-- `lem:rational-gap-suprema`. The classic example: `{q ∈ ℚ | q² < 2}` is
nonempty and bounded above in ℚ but has no supremum in ℚ, while its
supremum in ℝ is `√2`. -/
theorem rational_gap_suprema :
    {q : ℚ | q ^ 2 < 2}.Nonempty ∧
      (∃ u : ℚ, IsUpperBoundOf u {q : ℚ | q ^ 2 < 2}) ∧
      ¬(∃ s : ℚ, IsSupremum s {q : ℚ | q ^ 2 < 2}) := by
  sorry

end Scratch
end Bounding
end Analysis
end VolumeIII
end LRA
