import LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.UpperLowerBounds

/-!
Set operations and inherited bounds.
-/

namespace LRA.VolumeIII.Analysis.Bounding.BoundAlgebra

open LRA.VolumeIII.Analysis.Bounding.ExtremalBounds

variable {S : Type*}

/-- A common upper bound for two sets is an upper bound for their union. -/
theorem UnionPreservesUpperBounds [LE S] {A B : Set S} {u : S}
    (leftUpperBound : IsUpperBound u A)
    (rightUpperBound : IsUpperBound u B) :
    IsUpperBound u (A ∪ B) := by
  sorry

/-- A common lower bound for two sets is a lower bound for their union. -/
theorem UnionPreservesLowerBounds [LE S] {A B : Set S} {l : S}
    (leftLowerBound : IsLowerBound l A)
    (rightLowerBound : IsLowerBound l B) :
    IsLowerBound l (A ∪ B) := by
  sorry

/-- A union is bounded above exactly when both pieces are bounded above. -/
theorem UnionBoundedAboveIffPiecesBoundedAbove [LE S] {A B : Set S} :
    IsBoundedAbove (A ∪ B) ↔ IsBoundedAbove A ∧ IsBoundedAbove B := by
  sorry

/-- A union is bounded below exactly when both pieces are bounded below. -/
theorem UnionBoundedBelowIffPiecesBoundedBelow [LE S] {A B : Set S} :
    IsBoundedBelow (A ∪ B) ↔ IsBoundedBelow A ∧ IsBoundedBelow B := by
  sorry

/-- A union is bounded exactly when both pieces are bounded. -/
theorem UnionBoundedIffPiecesBounded [LE S] {A B : Set S} :
    IsBounded (A ∪ B) ↔ IsBounded A ∧ IsBounded B := by
  sorry

/-- Subsets inherit upper bounds from supersets. -/
theorem SubsetsPreserveUpperBounds [Preorder S] {C A : Set S} {u : S}
    (subsetHypothesis : C ⊆ A)
    (upperBoundHypothesis : IsUpperBound u A) :
    IsUpperBound u C := by
  sorry

/-- Subsets inherit lower bounds from supersets. -/
theorem SubsetsPreserveLowerBounds [Preorder S] {C A : Set S} {l : S}
    (subsetHypothesis : C ⊆ A)
    (lowerBoundHypothesis : IsLowerBound l A) :
    IsLowerBound l C := by
  sorry

/-- Intersections inherit upper bounds from either side. -/
theorem IntersectionsInheritUpperBounds [LE S] {A B : Set S} {u : S}
    (upperBoundHypothesis : IsUpperBound u A) :
    IsUpperBound u (A ∩ B) := by
  sorry

/-- Intersections inherit lower bounds from either side. -/
theorem IntersectionsInheritLowerBounds [LE S] {A B : Set S} {l : S}
    (lowerBoundHypothesis : IsLowerBound l A) :
    IsLowerBound l (A ∩ B) := by
  sorry

/-- Set differences inherit upper bounds from the minuend. -/
theorem DifferencesInheritUpperBounds [LE S] {A B : Set S} {u : S}
    (upperBoundHypothesis : IsUpperBound u A) :
    IsUpperBound u (A \ B) := by
  sorry

/-- Set differences inherit lower bounds from the minuend. -/
theorem DifferencesInheritLowerBounds [LE S] {A B : Set S} {l : S}
    (lowerBoundHypothesis : IsLowerBound l A) :
    IsLowerBound l (A \ B) := by
  sorry

/-- Relative complements inside a bounded universe inherit upper bounds. -/
theorem ComplementsInheritUpperBounds [LE S] {A T : Set S} {u : S}
    (upperBoundHypothesis : IsUpperBound u T) :
    IsUpperBound u (T \ A) := by
  sorry

/-- Relative complements inside a bounded universe inherit lower bounds. -/
theorem ComplementsInheritLowerBounds [LE S] {A T : Set S} {l : S}
    (lowerBoundHypothesis : IsLowerBound l T) :
    IsLowerBound l (T \ A) := by
  sorry

end LRA.VolumeIII.Analysis.Bounding.BoundAlgebra
