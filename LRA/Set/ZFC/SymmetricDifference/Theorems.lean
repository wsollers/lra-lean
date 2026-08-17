import LRA.Set.ZFC.Union.Theorems
import LRA.Set.ZFC.RelativeComplement.Theorems

/-!
The symmetric difference of two sets, derived from relative complement and
binary union.
-/

namespace LRA.Set.ZFC

/-- The symmetric difference of `A` and `B`, derived as the union of the two
relative complements. -/
noncomputable def TheSymmetricDifference (A B : Set) : Set :=
  TheUnion (TheRelativeComplement A B) (TheRelativeComplement B A)

/-- The chosen symmetric difference has the expected members. -/
theorem TheSymmetricDifferenceIsSymmetricDifferenceOf (A B : Set) :
    IsSymmetricDifferenceOf A B (TheSymmetricDifference A B) := by
  sorry

/-- Membership in the chosen symmetric difference. -/
theorem TheSymmetricDifferenceMembership (A B x : Set) :
    x ∈ TheSymmetricDifference A B ↔
      (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A) := by
  sorry

/-- Every symmetric difference equals the chosen one. -/
theorem EverySymmetricDifferenceEqualsTheSymmetricDifference
    {A B D : Set}
    (DIsSymmetricDifferenceOf : IsSymmetricDifferenceOf A B D) :
    D = TheSymmetricDifference A B := by
  sorry

end LRA.Set.ZFC

/-! Compatibility aliases for the historical Enderton symmetric-difference names. -/
namespace LRA.Set.Enderton

noncomputable abbrev TheSymmetricDifference (A B : Set) : Set :=
  LRA.Set.ZFC.TheSymmetricDifference A B

abbrev TheSymmetricDifferenceIsSymmetricDifferenceOf (A B : Set) :=
  LRA.Set.ZFC.TheSymmetricDifferenceIsSymmetricDifferenceOf A B

abbrev TheSymmetricDifferenceMembership (A B x : Set) :=
  LRA.Set.ZFC.TheSymmetricDifferenceMembership A B x

abbrev EverySymmetricDifferenceEqualsTheSymmetricDifference
    {A B D : Set}
    (DIsSymmetricDifferenceOf : IsSymmetricDifferenceOf A B D) :
    D = TheSymmetricDifference A B :=
  LRA.Set.ZFC.EverySymmetricDifferenceEqualsTheSymmetricDifference DIsSymmetricDifferenceOf

end LRA.Set.Enderton
