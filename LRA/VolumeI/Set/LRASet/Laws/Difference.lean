import LRA.VolumeI.Set.LRASet.Instances
import LRA.VolumeI.Set.Interface.Difference

namespace LRA.VolumeI.Set.LRASet

universe u

variable {Alpha : Type u}

/-!
Difference (`\`) laws for predicate sets: the backend's certificate for
`LRA.VolumeI.Set.DifferenceLaws`. The universal-set difference laws are
not missing -- they live in `Laws/Complement.lean`, with the rest of the
family only this backend can register.
-/

theorem DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : LRASet Alpha, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B := by
  sorry

theorem DifferenceAntitoneRight :
    ∀ A B₁ B₂ : LRASet Alpha, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁ := by
  sorry

theorem DifferenceEmpty :
    ∀ A : LRASet Alpha, A \ (∅ : LRASet Alpha) = A := by
  sorry

theorem EmptyDifference :
    ∀ A : LRASet Alpha, (∅ : LRASet Alpha) \ A = (∅ : LRASet Alpha) := by
  sorry

theorem DifferenceSelf :
    ∀ A : LRASet Alpha, A \ A = (∅ : LRASet Alpha) := by
  sorry

theorem DifferenceUnion :
    ∀ A B C : LRASet Alpha, A \ (B ∪ C) = (A \ B) ∩ (A \ C) := by
  sorry

theorem DifferenceIntersection :
    ∀ A B C : LRASet Alpha, A \ (B ∩ C) = (A \ B) ∪ (A \ C) := by
  sorry

theorem UnionDifferenceDistributes :
    ∀ A B C : LRASet Alpha, (A ∪ B) \ C = (A \ C) ∪ (B \ C) := by
  sorry

theorem IntersectionDifferenceDistributes :
    ∀ A B C : LRASet Alpha, (A ∩ B) \ C = (A \ C) ∩ (B \ C) := by
  sorry

theorem DifferenceSubsetLeft : ∀ A B : LRASet Alpha, A \ B ⊆ A := by
  sorry

theorem DifferenceDisjointRight :
    ∀ A B : LRASet Alpha, (A \ B) ∩ B = (∅ : LRASet Alpha) := by
  sorry

/-- Registration: predicate sets satisfy the difference laws. Pure
delegation to the theorems above. -/
instance : DifferenceLaws (LRASet Alpha) where
  DifferenceMonotoneLeft := LRA.VolumeI.Set.LRASet.DifferenceMonotoneLeft
  DifferenceAntitoneRight := LRA.VolumeI.Set.LRASet.DifferenceAntitoneRight
  DifferenceEmpty := LRA.VolumeI.Set.LRASet.DifferenceEmpty
  EmptyDifference := LRA.VolumeI.Set.LRASet.EmptyDifference
  DifferenceSelf := LRA.VolumeI.Set.LRASet.DifferenceSelf
  DifferenceUnion := LRA.VolumeI.Set.LRASet.DifferenceUnion
  DifferenceIntersection := LRA.VolumeI.Set.LRASet.DifferenceIntersection
  UnionDifferenceDistributes :=
    LRA.VolumeI.Set.LRASet.UnionDifferenceDistributes
  IntersectionDifferenceDistributes :=
    LRA.VolumeI.Set.LRASet.IntersectionDifferenceDistributes
  DifferenceSubsetLeft := LRA.VolumeI.Set.LRASet.DifferenceSubsetLeft
  DifferenceDisjointRight := LRA.VolumeI.Set.LRASet.DifferenceDisjointRight

end LRA.VolumeI.Set.LRASet
