import LRA.Set.PredicateSet.Instances
import LRA.Set.Interface.Union

namespace LRA.Set.PredicateSet

universe u

variable {Alpha : Type u}

theorem UnionCommutative :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∪ B = B ∪ A := by
  sorry

theorem UnionAssociative :
    ∀ A B C : LRA.Set.PredicateSet Alpha, (A ∪ B) ∪ C = A ∪ (B ∪ C) := by
  sorry

theorem EmptyUnion :
    ∀ A : LRA.Set.PredicateSet Alpha,
      (∅ : LRA.Set.PredicateSet Alpha) ∪ A = A := by
  sorry

theorem UnionEmpty :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A ∪ (∅ : LRA.Set.PredicateSet Alpha) = A := by
  sorry

theorem UnionIdempotent :
    ∀ A : LRA.Set.PredicateSet Alpha, A ∪ A = A := by
  sorry

theorem UnionMonotone :
    ∀ A₁ A₂ B₁ B₂ : LRA.Set.PredicateSet Alpha,
      A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∪ B₁ ⊆ A₂ ∪ B₂ := by
  sorry

theorem SubsetIffUnionEqRight :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ⊆ B ↔ A ∪ B = B := by
  sorry

instance : UnionLaws (LRA.Set.PredicateSet Alpha) where
  UnionCommutative := LRA.Set.PredicateSet.UnionCommutative
  UnionAssociative := LRA.Set.PredicateSet.UnionAssociative
  EmptyUnion := LRA.Set.PredicateSet.EmptyUnion
  UnionEmpty := LRA.Set.PredicateSet.UnionEmpty
  UnionIdempotent := LRA.Set.PredicateSet.UnionIdempotent
  UnionMonotone := LRA.Set.PredicateSet.UnionMonotone
  SubsetIffUnionEqRight := LRA.Set.PredicateSet.SubsetIffUnionEqRight

end LRA.Set.PredicateSet
