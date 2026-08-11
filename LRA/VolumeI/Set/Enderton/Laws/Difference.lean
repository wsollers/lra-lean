import LRA.VolumeI.Set.Enderton.Instances
import LRA.VolumeI.Set.Interface.Difference

namespace LRA.VolumeI.Set.Enderton

/-!
Difference (`\`) laws for Enderton sets: the backend's certificate for
`LRA.VolumeI.Set.DifferenceLaws`.

`DifferenceUniversal`/`UniversalDifference` are not here -- and no longer
need a prose apology: they now live in the interface's complement family
(`Interface/Complement.lean`), whose certificate requires
`HasUniversal`/`HasComplement` instances Enderton can never register
(Russell's paradox). The type system enforces the carve-out.
-/

theorem DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : Set, A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B := by
  sorry

theorem DifferenceAntitoneRight :
    ∀ A B₁ B₂ : Set, B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁ := by
  sorry

theorem DifferenceEmpty : ∀ A : Set, A \ (∅ : Set) = A := by
  sorry

theorem EmptyDifference : ∀ A : Set, (∅ : Set) \ A = (∅ : Set) := by
  sorry

theorem DifferenceSelf : ∀ A : Set, A \ A = (∅ : Set) := by
  sorry

theorem DifferenceUnion :
    ∀ A B C : Set, A \ (B ∪ C) = (A \ B) ∩ (A \ C) := by
  sorry

theorem DifferenceIntersection :
    ∀ A B C : Set, A \ (B ∩ C) = (A \ B) ∪ (A \ C) := by
  sorry

theorem UnionDifferenceDistributes :
    ∀ A B C : Set, (A ∪ B) \ C = (A \ C) ∪ (B \ C) := by
  sorry

theorem IntersectionDifferenceDistributes :
    ∀ A B C : Set, (A ∩ B) \ C = (A \ C) ∩ (B \ C) := by
  sorry

theorem DifferenceSubsetLeft : ∀ A B : Set, A \ B ⊆ A := by
  sorry

theorem DifferenceDisjointRight :
    ∀ A B : Set, (A \ B) ∩ B = (∅ : Set) := by
  sorry

/-- Registration: Enderton sets satisfy the difference laws. Pure
delegation to the theorems above. -/
instance : DifferenceLaws Set where
  DifferenceMonotoneLeft := LRA.VolumeI.Set.Enderton.DifferenceMonotoneLeft
  DifferenceAntitoneRight := LRA.VolumeI.Set.Enderton.DifferenceAntitoneRight
  DifferenceEmpty := LRA.VolumeI.Set.Enderton.DifferenceEmpty
  EmptyDifference := LRA.VolumeI.Set.Enderton.EmptyDifference
  DifferenceSelf := LRA.VolumeI.Set.Enderton.DifferenceSelf
  DifferenceUnion := LRA.VolumeI.Set.Enderton.DifferenceUnion
  DifferenceIntersection := LRA.VolumeI.Set.Enderton.DifferenceIntersection
  UnionDifferenceDistributes :=
    LRA.VolumeI.Set.Enderton.UnionDifferenceDistributes
  IntersectionDifferenceDistributes :=
    LRA.VolumeI.Set.Enderton.IntersectionDifferenceDistributes
  DifferenceSubsetLeft := LRA.VolumeI.Set.Enderton.DifferenceSubsetLeft
  DifferenceDisjointRight := LRA.VolumeI.Set.Enderton.DifferenceDisjointRight

end LRA.VolumeI.Set.Enderton
