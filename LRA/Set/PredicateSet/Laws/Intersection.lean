import LRA.Set.PredicateSet.Instances
import LRA.Set.Interface.Intersection

namespace LRA.Set.PredicateSet

universe u

variable {Alpha : Type u}

theorem IntersectionCommutative :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ∩ B = B ∩ A := by
  sorry

theorem IntersectionAssociative :
    ∀ A B C : LRA.Set.PredicateSet Alpha, (A ∩ B) ∩ C = A ∩ (B ∩ C) := by
  sorry

theorem EmptyIntersection :
    ∀ A : LRA.Set.PredicateSet Alpha,
      (∅ : LRA.Set.PredicateSet Alpha) ∩ A = (∅ : LRA.Set.PredicateSet Alpha) := by
  sorry

theorem IntersectionEmpty :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A ∩ (∅ : LRA.Set.PredicateSet Alpha) = (∅ : LRA.Set.PredicateSet Alpha) := by
  sorry

theorem IntersectionIdempotent :
    ∀ A : LRA.Set.PredicateSet Alpha, A ∩ A = A := by
  sorry

theorem IntersectionMonotone :
    ∀ A₁ A₂ B₁ B₂ : LRA.Set.PredicateSet Alpha,
      A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂ := by
  sorry

theorem SubsetIffIntersectionEqLeft :
    ∀ A B : LRA.Set.PredicateSet Alpha, A ⊆ B ↔ A ∩ B = A := by
  sorry

instance : IntersectionLaws (LRA.Set.PredicateSet Alpha) where
  IntersectionCommutative := LRA.Set.PredicateSet.IntersectionCommutative
  IntersectionAssociative := LRA.Set.PredicateSet.IntersectionAssociative
  EmptyIntersection := LRA.Set.PredicateSet.EmptyIntersection
  IntersectionEmpty := LRA.Set.PredicateSet.IntersectionEmpty
  IntersectionIdempotent := LRA.Set.PredicateSet.IntersectionIdempotent
  IntersectionMonotone := LRA.Set.PredicateSet.IntersectionMonotone
  SubsetIffIntersectionEqLeft :=
    LRA.Set.PredicateSet.SubsetIffIntersectionEqLeft

end LRA.Set.PredicateSet
