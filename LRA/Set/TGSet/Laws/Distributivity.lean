import LRA.Set.TGSet.Instances
import LRA.Set.Interface.Distributivity

namespace LRA.Set.TGSet

/-! Distributivity-law certificate for the concrete TGSet backend. -/

theorem IntersectionDistributesOverUnion :
    forall A B C : Set, A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C) := by
  sorry


theorem UnionDistributesOverIntersection :
    forall A B C : Set, A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C) := by
  sorry


theorem AbsorptionUnionIntersection :
    forall A B : Set, A ∪ (A ∩ B) = A := by
  sorry


theorem AbsorptionIntersectionUnion :
    forall A B : Set, A ∩ (A ∪ B) = A := by
  sorry

instance : DistributivityLaws Set where
  IntersectionDistributesOverUnion := IntersectionDistributesOverUnion
  UnionDistributesOverIntersection := UnionDistributesOverIntersection
  AbsorptionUnionIntersection := AbsorptionUnionIntersection
  AbsorptionIntersectionUnion := AbsorptionIntersectionUnion

end LRA.Set.TGSet
