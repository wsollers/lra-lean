/-
SCRATCH FILE — not wired into the lra-lean project.
Imports only this pass's own scratch files and Mathlib — nothing from the
real `LRA.VolumeIII.Analysis.Bounding.Bounds`, so this can be freely
refactored or discarded without touching the working project.
Source: volume-iii/book-analysis-i/bounding/notes/bounds-extremals/notes-suprema-infima.tex
Installment 2 of 5 for bounds-extremals.

Audit note: the .tex source's "Failure modes" remark blocks are corrupted
for 14 of this file's 20 nodes (a leftover uniqueness-of-infimum formula
pasted verbatim into unrelated entries) — flagged separately, not encoded
here since Failure-modes content isn't formalized as Lean statements at
all; it doesn't affect the definitions/theorems below.

`Supremum`/`Infimum` are written over a general partially ordered set `S`
matching the .tex Definition prose (not narrowed to ℝ, per the earlier
audit finding that the .tex's own remark blocks incorrectly narrow to ℝ
while the Definition itself does not).
-/

import Mathlib.Order.Defs
import Mathlib.Data.Set.Defs
import LRA.VolumeIII.Analysis.Bounding.Scratch.UpperLowerBounds

namespace LRA
namespace VolumeIII
namespace Analysis
namespace Bounding
namespace Scratch

variable {S : Type*}

/-- `def:supremum`. `s` is the supremum of `A` if it is an upper bound of
`A` and no smaller element of `S` is an upper bound of `A`. -/
def IsSupremum [Preorder S] (s : S) (A : Set S) : Prop :=
  IsUpperBoundOf s A ∧ ∀ u, IsUpperBoundOf u A → s ≤ u

/-- `def:infimum`. `i` is the infimum of `A` if it is a lower bound of `A`
and no larger element of `S` is a lower bound of `A`. -/
def IsInfimum [Preorder S] (i : S) (A : Set S) : Prop :=
  IsLowerBoundOf i A ∧ ∀ l, IsLowerBoundOf l A → l ≤ i

/-- `prop:uniqueness-of-the-supremum`. -/
theorem uniqueness_of_the_supremum [PartialOrder S] {A : Set S} {s t : S}
    (hs : IsSupremum s A) (ht : IsSupremum t A) : s = t := by
  sorry

/-- `prop:uniqueness-of-the-infimum`. -/
theorem uniqueness_of_the_infimum [PartialOrder S] {A : Set S} {i j : S}
    (hi : IsInfimum i A) (hj : IsInfimum j A) : i = j := by
  sorry

/-- `prop:upper-bound-property-of-supremum`. -/
theorem upper_bound_property_of_supremum [Preorder S] {A : Set S} {s : S}
    (h : IsSupremum s A) : IsUpperBoundOf s A :=
  h.1

/-- `prop:lower-bound-property-of-infimum`. -/
theorem lower_bound_property_of_infimum [Preorder S] {A : Set S} {i : S}
    (h : IsInfimum i A) : IsLowerBoundOf i A :=
  h.1

/-- `lem:subset-inclusion-preserves-upper-bounds`. -/
theorem subset_inclusion_preserves_upper_bounds [Preorder S] {A B : Set S}
    {u : S} (hAB : A ⊆ B) (hu : IsUpperBoundOf u B) : IsUpperBoundOf u A := by
  sorry

/-- `lem:subset-inclusion-preserves-lower-bounds`. -/
theorem subset_inclusion_preserves_lower_bounds [Preorder S] {A B : Set S}
    {l : S} (hAB : A ⊆ B) (hl : IsLowerBoundOf l B) : IsLowerBoundOf l A := by
  sorry

/-- `thm:supremum-is-monotone-under-inclusion`. Written generally over `S`
rather than literally ℝ, matching the general lemmas it depends on; ℝ is
recovered by instantiating `S := ℝ`. -/
theorem supremum_monotone_under_inclusion [PartialOrder S] {A B : Set S}
    {sA sB : S} (hAB : A ⊆ B) (hsA : IsSupremum sA A) (hsB : IsSupremum sB B) :
    sA ≤ sB := by
  sorry

/-- `thm:infimum-is-monotone-under-inclusion` (source titles it "antitone"
in the theorem statement itself — `inf B ≤ inf A`, consistent naming
would be "Infimum Is Antitone Under Inclusion" throughout, currently the
box title and the theorem title disagree: box says "Monotone", theorem
says "Antitone". Minor naming inconsistency, flagged here, not fixed in
this pass.) -/
theorem infimum_antitone_under_inclusion [PartialOrder S] {A B : Set S}
    {iA iB : S} (hAB : A ⊆ B) (hiA : IsInfimum iA A) (hiB : IsInfimum iB B) :
    iB ≤ iA := by
  sorry

/-- `prop:upper-bound-comparison-with-the-supremum`. -/
theorem upper_bound_comparison_with_the_supremum [PartialOrder S] {A : Set S}
    {s : S} (hs : IsSupremum s A) (u : S) :
    IsUpperBoundOf u A ↔ s ≤ u := by
  sorry

/-- `prop:lower-bound-comparison-with-the-infimum`. -/
theorem lower_bound_comparison_with_the_infimum [PartialOrder S] {A : Set S}
    {i : S} (hi : IsInfimum i A) (l : S) :
    IsLowerBoundOf l A ↔ l ≤ i := by
  sorry

/-- `prop:every-element-lies-below-the-supremum`. Restates
`upper_bound_property_of_supremum` pointwise; kept as its own theorem
since the .tex states it separately (deliberate reinforcement, not an
error — flagged as intentional near-duplication, matching the "more
practice theorems than strictly necessary is fine" project goal). -/
theorem every_element_lies_below_the_supremum [Preorder S] {A : Set S} {s : S}
    (hs : IsSupremum s A) : ∀ x ∈ A, x ≤ s :=
  hs.1

/-- `prop:every-element-lies-above-the-infimum`. -/
theorem every_element_lies_above_the_infimum [Preorder S] {A : Set S} {i : S}
    (hi : IsInfimum i A) : ∀ x ∈ A, i ≤ x :=
  hi.1

/-- `thm:infimum-less-than-supremum`. Needs `A` bounded on *both* sides
(both `hi` and `hs` witnessed) — correctly required in the .tex, since
the statement is meaningless if either extremum doesn't exist. -/
theorem infimum_le_supremum [PartialOrder S] {A : Set S} {i s : S}
    (hi : IsInfimum i A) (hs : IsSupremum s A) : i ≤ s := by
  sorry

/-- `prop:supremum-need-not-belong-to-the-set`. An existence witness, not
a universal claim — stated over ℝ specifically since it needs a concrete
example (e.g. the open interval `(0,1)`), unlike the general lemmas above. -/
theorem supremum_need_not_belong_to_the_set :
    ∃ (A : Set ℝ) (s : ℝ), A.Nonempty ∧ IsSupremum s A ∧ s ∉ A := by
  sorry

/-- `prop:infimum-need-not-belong-to-the-set`. -/
theorem infimum_need_not_belong_to_the_set :
    ∃ (A : Set ℝ) (i : ℝ), A.Nonempty ∧ IsInfimum i A ∧ i ∉ A := by
  sorry

/-- `prop:order-comparison-of-suprema`. -/
theorem order_comparison_of_suprema [PartialOrder S] {A B : Set S} {sA sB : S}
    (hsA : IsSupremum sA A) (hsB : IsSupremum sB B)
    (hdom : ∀ a ∈ A, ∃ b ∈ B, a ≤ b) : sA ≤ sB := by
  sorry

/-- `thm:lub-property-implies-existence-of-suprema`. Genuinely ℝ-specific:
this is where the completeness axiom actually gets used, unlike the
general lemmas above which hold in any partially ordered set. -/
theorem lub_property_implies_existence_of_suprema {A : Set ℝ}
    (hne : A.Nonempty) (hbdd : ∃ u, IsUpperBoundOf u A) :
    ∃! s : ℝ, IsSupremum s A := by
  sorry

/-- `thm:glb-property-implies-existence-of-infima`. -/
theorem glb_property_implies_existence_of_infima {A : Set ℝ}
    (hne : A.Nonempty) (hbdd : ∃ l, IsLowerBoundOf l A) :
    ∃! i : ℝ, IsInfimum i A := by
  sorry

/-- `cor:bounded-set-has-supremum-and-infimum`. Added in this pass — the
.tex previously stated `lub_property_implies_existence_of_suprema` and
`glb_property_implies_existence_of_infima` separately but never combined
them into a single citable "bounded ⟹ both exist" corollary, even though
`IsBounded` (both-sided boundedness) is the hypothesis that recurs
constantly from here on. Trivial given the two theorems above — literally
`⟨lub_property_implies_existence_of_suprema hne hbdd.1,
glb_property_implies_existence_of_infima hne hbdd.2⟩` — but kept as
`sorry` per house proof policy (statements only in this pass). -/
theorem bounded_set_has_supremum_and_infimum {A : Set ℝ}
    (hne : A.Nonempty) (hbdd : IsBounded A) :
    (∃! s : ℝ, IsSupremum s A) ∧ (∃! i : ℝ, IsInfimum i A) := by
  sorry

end Scratch
end Bounding
end Analysis
end VolumeIII
end LRA
