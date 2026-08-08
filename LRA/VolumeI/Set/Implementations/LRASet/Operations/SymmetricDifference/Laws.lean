import LRA.VolumeI.Set.Implementations.LRASet.Operations.Difference.Laws

namespace LRA.VolumeI.Set.Implementations.LRASet.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.Implementations.LRASet.LRASet

/-- Symmetric difference is the union of the two one-sided differences:
`A △ B = (A \ B) ∪ (B \ A)`. -/
theorem SymmetricDifferenceAsUnionDifferences {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    SymmetricDifference Left Right =
      Union (Difference Left Right) (Difference Right Left) := by
  sorry

/-- Symmetric difference is the union minus the intersection:
`A △ B = (A ∪ B) \ (A ∩ B)`. -/
theorem SymmetricDifferenceAsUnionDifferenceIntersection {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    SymmetricDifference Left Right =
      Difference (Union Left Right) (Intersection Left Right) := by
  sorry

/-- Symmetric difference is commutative: `A △ B = B △ A`. -/
theorem SymmetricDifferenceCommutative {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    SymmetricDifference Left Right = SymmetricDifference Right Left := by
  sorry

/-- The empty set is a right identity for symmetric difference:
`A △ ∅ = A`. -/
theorem SymmetricDifferenceEmpty {Alpha : LRACarrier}
    (Left : LRASet Alpha) :
    SymmetricDifference Left (Empty Alpha) = Left := by
  sorry

/-- The empty set is a left identity for symmetric difference:
`∅ △ A = A`. -/
theorem EmptySymmetricDifference {Alpha : LRACarrier}
    (Right : LRASet Alpha) :
    SymmetricDifference (Empty Alpha) Right = Right := by
  sorry

/-- Every set is its own inverse under symmetric difference:
`A △ A = ∅`. -/
theorem SymmetricDifferenceSelf {Alpha : LRACarrier}
    (Left : LRASet Alpha) :
    SymmetricDifference Left Left = Empty Alpha := by
  sorry

/-- Symmetric difference is associative:
`(A △ B) △ C = A △ (B △ C)`. -/
theorem SymmetricDifferenceAssociative {Alpha : LRACarrier}
    (Left Middle Right : LRASet Alpha) :
    SymmetricDifference (SymmetricDifference Left Middle) Right =
      SymmetricDifference Left (SymmetricDifference Middle Right) := by
  sorry

/-- Symmetric difference is empty exactly when the two sets are equal:
`A △ B = ∅ ↔ A = B`. -/
theorem SymmetricDifferenceEqEmptyIff {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    SymmetricDifference Left Right = Empty Alpha ↔ Left = Right := by
  sorry

/-- Symmetric difference is contained in union:
`A △ B ⊆ A ∪ B`. -/
theorem SymmetricDifferenceSubsetUnion {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Subset (SymmetricDifference Left Right) (Union Left Right) := by
  sorry

end LRA.VolumeI.Set.Implementations.LRASet.Laws
