import LRA.Set.NBGSet.Instances
import LRA.Set.Interface.Intersection

namespace LRA.Set.NBGSet

theorem IntersectionCommutative : forall A B : Set, A ∩ B = B ∩ A := by
  sorry


theorem IntersectionAssociative :
    forall A B C : Set, (A ∩ B) ∩ C = A ∩ (B ∩ C) := by
  sorry


theorem IntersectionIdempotent : forall A : Set, A ∩ A = A := by
  sorry


theorem EmptyIntersection : forall A : Set, (∅ : Set) ∩ A = (∅ : Set) := by
  sorry


theorem IntersectionEmpty : forall A : Set, A ∩ (∅ : Set) = (∅ : Set) := by
  sorry


theorem IntersectionMonotone :
    forall A1 A2 B1 B2 : Set, A1 ⊆ A2 -> B1 ⊆ B2 -> A1 ∩ B1 ⊆ A2 ∩ B2 := by
  sorry


theorem SubsetIffIntersectionEqLeft :
    forall A B : Set, A ⊆ B <-> A ∩ B = A := by
  sorry

instance : IntersectionLaws Set where
  IntersectionCommutative := IntersectionCommutative
  IntersectionAssociative := IntersectionAssociative
  IntersectionIdempotent := IntersectionIdempotent
  EmptyIntersection := EmptyIntersection
  IntersectionEmpty := IntersectionEmpty
  IntersectionMonotone := IntersectionMonotone
  SubsetIffIntersectionEqLeft := SubsetIffIntersectionEqLeft

end LRA.Set.NBGSet
