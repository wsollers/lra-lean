import LRA.Set.TG.Union.Theorems
import LRA.Set.TG.RelativeComplement.Theorems

namespace LRA.Set.TG

noncomputable def TheSymmetricDifference (A B : Set) : Set :=
  TheUnion (TheRelativeComplement A B) (TheRelativeComplement B A)

theorem TheSymmetricDifferenceIsSymmetricDifferenceOf (A B : Set) :
    IsSymmetricDifferenceOf A B (TheSymmetricDifference A B) := by
  sorry


theorem TheSymmetricDifferenceMembership (A B x : Set) :
    x ∈ TheSymmetricDifference A B <-> (x ∈ A /\ x ∉ B) \/ (x ∈ B /\ x ∉ A) := by
  sorry

end LRA.Set.TG
