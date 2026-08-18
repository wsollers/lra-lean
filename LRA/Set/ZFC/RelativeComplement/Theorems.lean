import LRA.Set.ZFC.Definitions
import LRA.Set.ZFC.Separation.Theorems

/-!
The relative complement of `B` in `A` (`A \ B`), derived from Separation.
-/

namespace LRA.Set.ZFC

/-- The relative complement of `B` in `A`, derived as the subset of `A`
separated by non-membership in `B`. -/
noncomputable def TheRelativeComplement (A B : Set) : Set :=
  TheSeparatedSubset A (fun x => x ∉ B)

/-- The chosen relative complement has the expected members. -/
theorem TheRelativeComplementIsRelativeComplementOf (A B : Set) :
    IsRelativeComplementOf A B (TheRelativeComplement A B) := by
  sorry

/-- Membership in the chosen relative complement. -/
theorem TheRelativeComplementMembership (A B x : Set) :
    x ∈ TheRelativeComplement A B ↔ x ∈ A ∧ x ∉ B := by
  sorry

/-- Every relative complement equals the chosen one. -/
theorem EveryRelativeComplementEqualsTheRelativeComplement
    {A B D : Set}
    (DIsRelativeComplementOf : IsRelativeComplementOf A B D) :
    D = TheRelativeComplement A B := by
  sorry

end LRA.Set.ZFC
