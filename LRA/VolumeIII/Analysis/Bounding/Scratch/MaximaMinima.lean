/-
SCRATCH FILE — not wired into the lra-lean project.
Imports only this pass's own scratch files and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Bounding.Bounds`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/bounding/notes/bounds-extremals/notes-maxima-minima.tex
Installment 3 of 5 for bounds-extremals.

Audit note: this file was clean on read — no corruption pattern like the
one found and fixed in notes-suprema-infima.tex. All 8 nodes checked out:
`def:maximum`/`def:minimum` (with an explicit, correct empty-set
convention), both uniqueness propositions, both "attained bound implies
supremum/infimum" propositions, and both "supremum/infimum that lands in
the set is the max/min" converse propositions.

`IsMaximum`/`IsMinimum` need only `[LE S]` (matching the .tex's own
`m∈A ∧ ∀a∈A, a≤m` definition, which needs no more than an order relation);
uniqueness needs `[PartialOrder S]` for antisymmetry, same as the
Supremum/Infimum uniqueness proofs in the previous installment. Written
generally over `S` rather than literally ℝ, same rationale as before:
`S := ℝ` recovers the .tex's literal statements.
-/

import Mathlib.Order.Defs
import Mathlib.Data.Set.Defs
import LRA.VolumeIII.Analysis.Bounding.Scratch.UpperLowerBounds
import LRA.VolumeIII.Analysis.Bounding.Scratch.SupremaInfima

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Bounding
namespace Scratch

variable {S : Type*}

/-- `def:maximum`. `m` is the maximum of `A` if it belongs to `A` and is an
upper bound of `A`. The .tex's "Empty-set convention" remark (no element of
`∅` can attain the bound) falls out for free here: `m ∈ (∅ : Set S)` is
`False`, so `IsMaximum m ∅` is never satisfiable. -/
def IsMaximum [LE S] (m : S) (A : Set S) : Prop :=
  m ∈ A ∧ IsUpperBoundOf m A

/-- `def:minimum`. -/
def IsMinimum [LE S] (n : S) (A : Set S) : Prop :=
  n ∈ A ∧ IsLowerBoundOf n A

/-- `prop:uniqueness-of-the-maximum`. -/
theorem uniqueness_of_the_maximum [PartialOrder S] {A : Set S} {m1 m2 : S}
    (h1 : IsMaximum m1 A) (h2 : IsMaximum m2 A) : m1 = m2 := by
  sorry

/-- `prop:uniqueness-of-the-minimum`. -/
theorem uniqueness_of_the_minimum [PartialOrder S] {A : Set S} {n1 n2 : S}
    (h1 : IsMinimum n1 A) (h2 : IsMinimum n2 A) : n1 = n2 := by
  sorry

/-- `prop:maximum-implies-supremum`. An attained upper bound is automatically
least among upper bounds: any other upper bound must dominate the attained
element itself. -/
theorem maximum_implies_supremum [PartialOrder S] {A : Set S} {m : S}
    (h : IsMaximum m A) : IsSupremum m A := by
  sorry

/-- `prop:minimum-implies-infimum`. -/
theorem minimum_implies_infimum [PartialOrder S] {A : Set S} {n : S}
    (h : IsMinimum n A) : IsInfimum n A := by
  sorry

/-- `prop:supremum-in-the-set-is-the-maximum`. Converse direction: a
supremum that happens to belong to the set is automatically the maximum.
Needs no extra hypotheses beyond `IsSupremum` + membership — the .tex's
"nonempty and bounded above" phrasing is just how `s = sup A` is introduced
in prose, already baked into `hs : IsSupremum s A` here. -/
theorem supremum_in_the_set_is_the_maximum [Preorder S] {A : Set S} {s : S}
    (hs : IsSupremum s A) (hmem : s ∈ A) : IsMaximum s A :=
  ⟨hmem, hs.1⟩

/-- `prop:infimum-in-the-set-is-the-minimum`. -/
theorem infimum_in_the_set_is_the_minimum [Preorder S] {A : Set S} {i : S}
    (hi : IsInfimum i A) (hmem : i ∈ A) : IsMinimum i A :=
  ⟨hmem, hi.1⟩

/-- `cor:maximum-iff-supremum-in-the-set`. Added in this pass — bundles
`maximum_implies_supremum` (+ `uniqueness_of_the_supremum`, to pin the
maximum down as equal to `s`) and `supremum_in_the_set_is_the_maximum` into
a single iff, matching the .tex's decision to state the two directions
separately but never combine them. Kept as `sorry` per house proof policy;
the forward direction needs `uniqueness_of_the_supremum` from the previous
installment, the backward direction is exactly
`supremum_in_the_set_is_the_maximum` above. -/
theorem maximum_iff_supremum_mem [PartialOrder S] {A : Set S} {s : S}
    (hs : IsSupremum s A) : (∃ m, IsMaximum m A) ↔ s ∈ A := by
  sorry

end Scratch
end Bounding
end Analysis
end VolumeIII
end LRA
