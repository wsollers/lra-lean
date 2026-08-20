import LRA.Set.PredicateSet.Instances
import LRA.Set.Interface.Difference

namespace LRA.Set.PredicateSet

universe u

variable {Alpha : Type u}

theorem DifferenceMonotoneLeft :
    ∀ A₁ A₂ B : LRA.Set.PredicateSet Alpha,
      A₁ ⊆ A₂ → A₁ \ B ⊆ A₂ \ B := by
  sorry


theorem DifferenceAntitoneRight :
    ∀ A B₁ B₂ : LRA.Set.PredicateSet Alpha,
      B₁ ⊆ B₂ → A \ B₂ ⊆ A \ B₁ := by
  sorry


theorem DifferenceEmpty :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A \ (∅ : LRA.Set.PredicateSet Alpha) = A := by
  sorry


theorem EmptyDifference :
    ∀ A : LRA.Set.PredicateSet Alpha,
      (∅ : LRA.Set.PredicateSet Alpha) \ A = (∅ : LRA.Set.PredicateSet Alpha) := by
  sorry


theorem DifferenceSelf :
    ∀ A : LRA.Set.PredicateSet Alpha,
      A \ A = (∅ : LRA.Set.PredicateSet Alpha) := by
  sorry


theorem DifferenceUnion :
    ∀ A B C : LRA.Set.PredicateSet Alpha,
      A \ (B ∪ C) = (A \ B) ∩ (A \ C) := by
  sorry


theorem DifferenceIntersection :
    ∀ A B C : LRA.Set.PredicateSet Alpha,
      A \ (B ∩ C) = (A \ B) ∪ (A \ C) := by
  sorry


theorem UnionDifferenceDistributes :
    ∀ A B C : LRA.Set.PredicateSet Alpha,
      (A ∪ B) \ C = (A \ C) ∪ (B \ C) := by
  sorry


theorem IntersectionDifferenceDistributes :
    ∀ A B C : LRA.Set.PredicateSet Alpha,
      (A ∩ B) \ C = (A \ C) ∩ (B \ C) := by
  sorry


theorem DifferenceSubsetLeft :
    ∀ A B : LRA.Set.PredicateSet Alpha, A \ B ⊆ A := by
  sorry


theorem DifferenceDisjointRight :
    ∀ A B : LRA.Set.PredicateSet Alpha,
      (A \ B) ∩ B = (∅ : LRA.Set.PredicateSet Alpha) := by
  sorry

instance : DifferenceLaws (LRA.Set.PredicateSet Alpha) where
  DifferenceMonotoneLeft := LRA.Set.PredicateSet.DifferenceMonotoneLeft
  DifferenceAntitoneRight := LRA.Set.PredicateSet.DifferenceAntitoneRight
  DifferenceEmpty := LRA.Set.PredicateSet.DifferenceEmpty
  EmptyDifference := LRA.Set.PredicateSet.EmptyDifference
  DifferenceSelf := LRA.Set.PredicateSet.DifferenceSelf
  DifferenceUnion := LRA.Set.PredicateSet.DifferenceUnion
  DifferenceIntersection := LRA.Set.PredicateSet.DifferenceIntersection
  UnionDifferenceDistributes :=
    LRA.Set.PredicateSet.UnionDifferenceDistributes
  IntersectionDifferenceDistributes :=
    LRA.Set.PredicateSet.IntersectionDifferenceDistributes
  DifferenceSubsetLeft := LRA.Set.PredicateSet.DifferenceSubsetLeft
  DifferenceDisjointRight := LRA.Set.PredicateSet.DifferenceDisjointRight

end LRA.Set.PredicateSet
