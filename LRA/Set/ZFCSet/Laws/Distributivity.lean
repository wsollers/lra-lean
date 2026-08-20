import LRA.Set.ZFCSet.Instances
import LRA.Set.Interface.Distributivity

namespace LRA.Set.ZFCSet

/-! Distributivity and absorption certificate for the concrete ZFCSet backend. -/

theorem IntersectionDistributesOverUnion :
    ∀ A B C : Set, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C) := by
  sorry


theorem UnionDistributesOverIntersection :
    ∀ A B C : Set, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C) := by
  sorry


theorem AbsorptionUnionIntersection :
    ∀ A B : Set, A ∪ (A ∩ B) = A := by
  sorry


theorem AbsorptionIntersectionUnion :
    ∀ A B : Set, A ∩ (A ∪ B) = A := by
  sorry

instance : DistributivityLaws Set where
  IntersectionDistributesOverUnion := IntersectionDistributesOverUnion
  UnionDistributesOverIntersection := UnionDistributesOverIntersection
  AbsorptionUnionIntersection := AbsorptionUnionIntersection
  AbsorptionIntersectionUnion := AbsorptionIntersectionUnion

end LRA.Set.ZFCSet
