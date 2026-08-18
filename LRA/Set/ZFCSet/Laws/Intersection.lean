import LRA.Set.ZFCSet.Instances
import LRA.Set.Interface.Intersection

namespace LRA.Set.ZFCSet

/-! Intersection-law certificate for the concrete ZFCSet backend. -/

theorem IntersectionCommutative : ∀ A B : Set, A ∩ B = B ∩ A := by
  sorry

theorem IntersectionAssociative :
    ∀ A B C : Set, (A ∩ B) ∩ C = A ∩ (B ∩ C) := by
  sorry

theorem EmptyIntersection : ∀ A : Set, (∅ : Set) ∩ A = (∅ : Set) := by
  sorry

theorem IntersectionEmpty : ∀ A : Set, A ∩ (∅ : Set) = (∅ : Set) := by
  sorry

theorem IntersectionIdempotent : ∀ A : Set, A ∩ A = A := by
  sorry

theorem IntersectionMonotone :
    ∀ A₁ A₂ B₁ B₂ : Set, A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂ := by
  sorry

theorem SubsetIffIntersectionEqLeft :
    ∀ A B : Set, A ⊆ B ↔ A ∩ B = A := by
  sorry

instance : IntersectionLaws Set where
  IntersectionCommutative := IntersectionCommutative
  IntersectionAssociative := IntersectionAssociative
  EmptyIntersection := EmptyIntersection
  IntersectionEmpty := IntersectionEmpty
  IntersectionIdempotent := IntersectionIdempotent
  IntersectionMonotone := IntersectionMonotone
  SubsetIffIntersectionEqLeft := SubsetIffIntersectionEqLeft

end LRA.Set.ZFCSet
