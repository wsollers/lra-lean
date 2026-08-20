import LRA.Set.NBGSet.Instances
import LRA.Set.Interface.Union

namespace LRA.Set.NBGSet

theorem UnionCommutative : forall A B : Set, A ∪ B = B ∪ A := by
  sorry


theorem UnionAssociative :
    forall A B C : Set, (A ∪ B) ∪ C = A ∪ (B ∪ C) := by
  sorry


theorem EmptyUnion : forall A : Set, (∅ : Set) ∪ A = A := by
  sorry


theorem UnionEmpty : forall A : Set, A ∪ (∅ : Set) = A := by
  sorry


theorem UnionIdempotent : forall A : Set, A ∪ A = A := by
  sorry


theorem UnionMonotone :
    forall A1 A2 B1 B2 : Set, A1 ⊆ A2 -> B1 ⊆ B2 -> A1 ∪ B1 ⊆ A2 ∪ B2 := by
  sorry


theorem SubsetIffUnionEqRight :
    forall A B : Set, A ⊆ B <-> A ∪ B = B := by
  sorry

instance : UnionLaws Set where
  UnionCommutative := UnionCommutative
  UnionAssociative := UnionAssociative
  EmptyUnion := EmptyUnion
  UnionEmpty := UnionEmpty
  UnionIdempotent := UnionIdempotent
  UnionMonotone := UnionMonotone
  SubsetIffUnionEqRight := SubsetIffUnionEqRight

end LRA.Set.NBGSet
