import LRA.Set.ZFCSet.Instances
import LRA.Set.Interface.Difference

namespace LRA.Set.ZFCSet

/-! Difference-law certificate for the concrete ZFCSet backend. -/

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

instance : DifferenceLaws Set where
  DifferenceMonotoneLeft := DifferenceMonotoneLeft
  DifferenceAntitoneRight := DifferenceAntitoneRight
  DifferenceEmpty := DifferenceEmpty
  EmptyDifference := EmptyDifference
  DifferenceSelf := DifferenceSelf
  DifferenceUnion := DifferenceUnion
  DifferenceIntersection := DifferenceIntersection
  UnionDifferenceDistributes := UnionDifferenceDistributes
  IntersectionDifferenceDistributes := IntersectionDifferenceDistributes
  DifferenceSubsetLeft := DifferenceSubsetLeft
  DifferenceDisjointRight := DifferenceDisjointRight

end LRA.Set.ZFCSet

namespace LRA.Set.Enderton

abbrev DifferenceMonotoneLeft := LRA.Set.ZFCSet.DifferenceMonotoneLeft
abbrev DifferenceAntitoneRight := LRA.Set.ZFCSet.DifferenceAntitoneRight
abbrev DifferenceEmpty := LRA.Set.ZFCSet.DifferenceEmpty
abbrev EmptyDifference := LRA.Set.ZFCSet.EmptyDifference
abbrev DifferenceSelf := LRA.Set.ZFCSet.DifferenceSelf
abbrev DifferenceUnion := LRA.Set.ZFCSet.DifferenceUnion
abbrev DifferenceIntersection := LRA.Set.ZFCSet.DifferenceIntersection
abbrev UnionDifferenceDistributes := LRA.Set.ZFCSet.UnionDifferenceDistributes
abbrev IntersectionDifferenceDistributes := LRA.Set.ZFCSet.IntersectionDifferenceDistributes
abbrev DifferenceSubsetLeft := LRA.Set.ZFCSet.DifferenceSubsetLeft
abbrev DifferenceDisjointRight := LRA.Set.ZFCSet.DifferenceDisjointRight

end LRA.Set.Enderton
