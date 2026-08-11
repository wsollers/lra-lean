import LRA.VolumeI.Set.Enderton.Instances
import LRA.VolumeI.Set.Interface.Distributivity

namespace LRA.VolumeI.Set.Enderton

/-!
Distributivity and absorption laws for Enderton sets: the backend's
certificate for `LRA.VolumeI.Set.DistributivityLaws`.
-/

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

/-- Registration: Enderton sets satisfy the distributivity and absorption
laws. Pure delegation to the theorems above. -/
instance : DistributivityLaws Set where
  IntersectionDistributesOverUnion :=
    LRA.VolumeI.Set.Enderton.IntersectionDistributesOverUnion
  UnionDistributesOverIntersection :=
    LRA.VolumeI.Set.Enderton.UnionDistributesOverIntersection
  AbsorptionUnionIntersection :=
    LRA.VolumeI.Set.Enderton.AbsorptionUnionIntersection
  AbsorptionIntersectionUnion :=
    LRA.VolumeI.Set.Enderton.AbsorptionIntersectionUnion

end LRA.VolumeI.Set.Enderton
