import LRA.Set.TGSet.Instances
import LRA.Set.Interface.Difference

namespace LRA.Set.TGSet

/-! Difference-law certificate for the concrete TGSet backend. -/

theorem DifferenceMonotoneLeft :
    forall A1 A2 B : Set, A1 ⊆ A2 -> A1 \ B ⊆ A2 \ B := by
  sorry


theorem DifferenceAntitoneRight :
    forall A B1 B2 : Set, B1 ⊆ B2 -> A \ B2 ⊆ A \ B1 := by
  sorry


theorem DifferenceEmpty : forall A : Set, A \ (∅ : Set) = A := by
  sorry


theorem EmptyDifference : forall A : Set, (∅ : Set) \ A = (∅ : Set) := by
  sorry


theorem DifferenceSelf : forall A : Set, A \ A = (∅ : Set) := by
  sorry


theorem DifferenceUnion :
    forall A B C : Set, A \ (B ∪ C) = (A \ B) ∩ (A \ C) := by
  sorry


theorem DifferenceIntersection :
    forall A B C : Set, A \ (B ∩ C) = (A \ B) ∪ (A \ C) := by
  sorry


theorem UnionDifferenceDistributes :
    forall A B C : Set, (A ∪ B) \ C = (A \ C) ∪ (B \ C) := by
  sorry


theorem IntersectionDifferenceDistributes :
    forall A B C : Set, (A ∩ B) \ C = (A \ C) ∩ (B \ C) := by
  sorry


theorem DifferenceSubsetLeft : forall A B : Set, A \ B ⊆ A := by
  sorry


theorem DifferenceDisjointRight :
    forall A B : Set, (A \ B) ∩ B = (∅ : Set) := by
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

end LRA.Set.TGSet
