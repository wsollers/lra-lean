import LRA.VolumeI.Set.Implementations.LRASet.Operations.Complement.Laws
import LRA.VolumeI.Set.Implementations.LRASet.Operations.Intersection.Laws

namespace LRA.VolumeI.Set.Implementations.LRASet.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.Implementations.LRASet.LRASet

/-- Let `A` and `B` be sets. `A \ B = A ∩ Bᶜ`; equivalently, for every element `x`,
`x ∈ A \ B` iff `x ∈ A ∩ Bᶜ`. -/
theorem DifferenceAsIntersectionComplement {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Difference Left Right = Intersection Left (Complement Right) := by
  sorry

/-- Set difference is monotone in its left argument. If `A ⊆ B`, then
`A \ C ⊆ B \ C`. -/
theorem DifferenceMonotoneLeft {Alpha : LRACarrier}
    {Left Right Fixed : LRASet Alpha}
    (LeftSubsetRight : LRASet.Subset Left Right) :
    LRASet.Subset (Difference Left Fixed) (Difference Right Fixed) := by
  sorry

/-- Set difference is antitone in its right argument. If `C ⊆ D`, then
`A \ D ⊆ A \ C`. -/
theorem DifferenceAntitoneRight {Alpha : LRACarrier}
    {Smaller Larger Fixed : LRASet Alpha}
    (SmallerSubsetLarger : LRASet.Subset Smaller Larger) :
    LRASet.Subset (Difference Fixed Larger) (Difference Fixed Smaller) := by
  sorry

/-- Let `A` be a set. `A \ ∅ = A`; equivalently, for every element `x`,
`x ∈ A \ ∅` iff `x ∈ A`. -/
theorem DifferenceEmpty {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Difference Left (Empty Alpha) = Left := by
  sorry


/-- Let `A` be a set. `∅ \ A = ∅`; equivalently, for every element `x`,
`x ∈ ∅ \ A` iff `x ∈ ∅`. -/
theorem EmptyDifference {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Difference (Empty Alpha) Right = Empty Alpha := by
  sorry

/-- Let `A` be a set. `A \ U = ∅`; equivalently, for every element `x`,
`x ∈ A \ U` iff `x ∈ ∅`. -/
theorem DifferenceUniversal {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Difference Left (Universal Alpha) = Empty Alpha := by
  apply LRASet.Extensionality
  intro Element
  constructor
  · intro elementInDifference
    have elementInUniversal : Member Element (Universal Alpha) := by
      trivial
    exact elementInDifference.right elementInUniversal
  · intro elementInEmpty
    exact elementInEmpty.elim

/-- Let `A` be a set. `U \ A = Aᶜ`; equivalently, for every element `x`,
`x ∈ U \ A` iff `x ∈ Aᶜ`. -/
theorem UniversalDifference {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Difference (Universal Alpha) Right = Complement Right := by
  apply LRASet.Extensionality
  intro Element
  constructor
  · intro elementInDifference
    have elementInComplement : Member Element (Complement Right) := by
      exact elementInDifference.right
    exact elementInComplement
  · intro elementInComplement
    have elementInUniversal : Member Element (Universal Alpha) := by
      trivial
    have elementInDifference : Member Element (Difference (Universal Alpha) Right) := by
      exact ⟨elementInUniversal, elementInComplement⟩
    exact elementInDifference

/-- Let `A` be a set. `A \ A = ∅`; equivalently, for every element `x`,
`x ∈ A \ A` iff `x ∈ ∅`. -/
theorem DifferenceSelf {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Difference Left Left = Empty Alpha := by
  sorry

/-- Difference over a union in the right argument:
`A \ (B ∪ C) = (A \ B) ∩ (A \ C)`. -/
theorem DifferenceUnion {Alpha : LRACarrier}
    (Left Middle Right : LRASet Alpha) :
    Difference Left (Union Middle Right) =
      Intersection (Difference Left Middle) (Difference Left Right) := by
  sorry

/-- Difference over an intersection in the right argument:
`A \ (B ∩ C) = (A \ B) ∪ (A \ C)`. -/
theorem DifferenceIntersection {Alpha : LRACarrier}
    (Left Middle Right : LRASet Alpha) :
    Difference Left (Intersection Middle Right) =
      Union (Difference Left Middle) (Difference Left Right) := by
  sorry

/-- Difference distributes over union in the left argument:
`(A ∪ B) \ C = (A \ C) ∪ (B \ C)`. -/
theorem UnionDifferenceDistributes {Alpha : LRACarrier}
    (Left Middle Right : LRASet Alpha) :
    Difference (Union Left Middle) Right =
      Union (Difference Left Right) (Difference Middle Right) := by
  sorry

/-- Difference distributes over intersection in the left argument:
`(A ∩ B) \ C = (A \ C) ∩ (B \ C)`. -/
theorem IntersectionDifferenceDistributes {Alpha : LRACarrier}
    (Left Middle Right : LRASet Alpha) :
    Difference (Intersection Left Middle) Right =
      Intersection (Difference Left Right) (Difference Middle Right) := by
  sorry

/-- Difference is contained in its left argument: `A \ B ⊆ A`. -/
theorem DifferenceSubsetLeft {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Subset (Difference Left Right) Left := by
  sorry

/-- A difference is disjoint from its right argument:
`(A \ B) ∩ B = ∅`. -/
theorem DifferenceDisjointRight {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Intersection (Difference Left Right) Right = Empty Alpha := by
  sorry

end LRA.VolumeI.Set.Implementations.LRASet.Laws
