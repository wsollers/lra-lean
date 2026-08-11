import LRA.VolumeI.Set.LRASet.Instances
import LRA.VolumeI.Set.Interface.Intersection

namespace LRA.VolumeI.Set.LRASet

universe u

variable {Alpha : Type u}

/-!
Intersection laws for predicate sets: the backend's certificate for
`LRA.VolumeI.Set.IntersectionLaws`. Same discipline as `Laws/Union.lean`.
-/

theorem IntersectionCommutative :
    ∀ A B : LRASet Alpha, A ∩ B = B ∩ A := by
  sorry

theorem IntersectionAssociative :
    ∀ A B C : LRASet Alpha, (A ∩ B) ∩ C = A ∩ (B ∩ C) := by
  sorry

theorem EmptyIntersection :
    ∀ A : LRASet Alpha, (∅ : LRASet Alpha) ∩ A = (∅ : LRASet Alpha) := by
  sorry

theorem IntersectionEmpty :
    ∀ A : LRASet Alpha, A ∩ (∅ : LRASet Alpha) = (∅ : LRASet Alpha) := by
  sorry

theorem IntersectionIdempotent : ∀ A : LRASet Alpha, A ∩ A = A := by
  sorry

theorem IntersectionMonotone :
    ∀ A₁ A₂ B₁ B₂ : LRASet Alpha,
      A₁ ⊆ A₂ → B₁ ⊆ B₂ → A₁ ∩ B₁ ⊆ A₂ ∩ B₂ := by
  sorry

theorem SubsetIffIntersectionEqLeft :
    ∀ A B : LRASet Alpha, A ⊆ B ↔ A ∩ B = A := by
  sorry

/-- Registration: predicate sets satisfy the intersection laws. Pure
delegation to the theorems above. -/
instance : IntersectionLaws (LRASet Alpha) where
  IntersectionCommutative := LRA.VolumeI.Set.LRASet.IntersectionCommutative
  IntersectionAssociative := LRA.VolumeI.Set.LRASet.IntersectionAssociative
  EmptyIntersection := LRA.VolumeI.Set.LRASet.EmptyIntersection
  IntersectionEmpty := LRA.VolumeI.Set.LRASet.IntersectionEmpty
  IntersectionIdempotent := LRA.VolumeI.Set.LRASet.IntersectionIdempotent
  IntersectionMonotone := LRA.VolumeI.Set.LRASet.IntersectionMonotone
  SubsetIffIntersectionEqLeft :=
    LRA.VolumeI.Set.LRASet.SubsetIffIntersectionEqLeft

end LRA.VolumeI.Set.LRASet
