import LRA.Set.PredicateSet.Instances
import LRA.Set.Interface.Distributivity

namespace LRA.Set.PredicateSet

universe u

variable {Alpha : Type u}

theorem IntersectionDistributesOverUnion :
    ∀ A B C : LRA.Set.PredicateSet Alpha,
      A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C) := by
  sorry


theorem UnionDistributesOverIntersection :
    ∀ A B C : LRA.Set.PredicateSet Alpha,
      A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C) := by
  sorry


theorem AbsorptionUnionIntersection :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∪ (A ∩ B) = A := by
  sorry


theorem AbsorptionIntersectionUnion :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∩ (A ∪ B) = A := by
  sorry

instance : DistributivityLaws (LRA.Set.PredicateSet Alpha) where
  IntersectionDistributesOverUnion :=
    LRA.Set.PredicateSet.IntersectionDistributesOverUnion
  UnionDistributesOverIntersection :=
    LRA.Set.PredicateSet.UnionDistributesOverIntersection
  AbsorptionUnionIntersection :=
    LRA.Set.PredicateSet.AbsorptionUnionIntersection
  AbsorptionIntersectionUnion :=
    LRA.Set.PredicateSet.AbsorptionIntersectionUnion

end LRA.Set.PredicateSet
