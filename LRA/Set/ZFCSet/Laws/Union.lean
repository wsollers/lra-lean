import LRA.Set.ZFCSet.Instances
import LRA.Set.Interface.Union

namespace LRA.Set.ZFCSet

                                                             

theorem UnionCommutative : ∀ A B : Set, A ∪ B = B ∪ A := by
  sorry


theorem UnionAssociative :
    ∀ A B C : Set, (A ∪ B) ∪ C = A ∪ (B ∪ C) := by
  sorry


theorem EmptyUnion : ∀ A : Set, (∅ : Set) ∪ A = A := by
  sorry


theorem UnionEmpty : ∀ A : Set, A ∪ (∅ : Set) = A := by
  sorry


theorem UnionIdempotent : ∀ A : Set, A ∪ A = A := by
  sorry


theorem UnionMonotone :
    ∀ A₁ A₂ B₁ B₂ : Set, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂ := by
  sorry


theorem SubsetIffUnionEqRight :
    ∀ A B : Set, A ⊆ B ↔ A ∪ B = B := by
  sorry

instance : UnionLaws Set where
  UnionCommutative := UnionCommutative
  UnionAssociative := UnionAssociative
  EmptyUnion := EmptyUnion
  UnionEmpty := UnionEmpty
  UnionIdempotent := UnionIdempotent
  UnionMonotone := UnionMonotone
  SubsetIffUnionEqRight := SubsetIffUnionEqRight

end LRA.Set.ZFCSet
