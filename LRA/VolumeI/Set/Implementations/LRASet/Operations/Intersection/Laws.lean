import LRA.VolumeI.Set.Implementations.LRASet.LRASet

namespace LRA.VolumeI.Set.Implementations.LRASet.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.Implementations.LRASet.LRASet

/-- Let `A` and `B` be sets. Their intersection is commutative: `A ∩ B = B ∩ A`;
equivalently, for every element `x`, `x ∈ A ∩ B` iff `x ∈ B ∩ A`. -/
theorem IntersectionCommutative {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Intersection Left Right = Intersection Right Left := by
  sorry

/-- Intersection is monotone with respect to inclusion in either argument. If
`A ⊆ B`, then `A ∩ C ⊆ B ∩ C` and `C ∩ A ⊆ C ∩ B`. -/
theorem IntersectionMonotoneInclusion {Alpha : LRACarrier}
    {Left Right Fixed : LRASet Alpha}
    (LeftSubsetRight : Subset Left Right) :
    Subset (Intersection Left Fixed) (Intersection Right Fixed) ∧
      Subset (Intersection Fixed Left) (Intersection Fixed Right) := by
  sorry

/-- Let `A`, `B`, and `C` be sets. Their intersection is associative:
`(A ∩ B) ∩ C = A ∩ (B ∩ C)`; equivalently, for every element `x`,
`x ∈ (A ∩ B) ∩ C` iff `x ∈ A ∩ (B ∩ C)`. -/
theorem IntersectionAssociative {Alpha : LRACarrier}
    (Left Middle Right : LRASet Alpha) :
    Intersection (Intersection Left Middle) Right =
      Intersection Left (Intersection Middle Right) := by
  sorry

/-- Let `A` be a set. Intersecting `A` with the empty set gives the empty set:
`A ∩ ∅ = ∅`; equivalently, for every element `x`, `x ∈ A ∩ ∅` iff `x ∈ ∅`. -/
theorem IntersectionEmpty {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Intersection Left (Empty Alpha) = Empty Alpha := by
  sorry

/-- Let `A` be a set. Intersecting the empty set with `A` gives the empty set:
`∅ ∩ A = ∅`; equivalently, for every element `x`, `x ∈ ∅ ∩ A` iff `x ∈ ∅`. -/
theorem EmptyIntersection {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Intersection (Empty Alpha) Right = Empty Alpha := by
  sorry

/-- Let `A` be a set. Intersecting `A` with the universal set gives `A`:
`A ∩ U = A`; equivalently, for every element `x`, `x ∈ A ∩ U` iff `x ∈ A`. -/
theorem IntersectionUniversal {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Intersection Left (Universal Alpha) = Left := by
  sorry

/-- Let `A` be a set. Intersecting the universal set with `A` gives `A`:
`U ∩ A = A`; equivalently, for every element `x`, `x ∈ U ∩ A` iff `x ∈ A`. -/
theorem UniversalIntersection {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Intersection (Universal Alpha) Right = Right := by
  sorry

/-- Let `A` be a set. Intersecting `A` with itself gives `A`: `A ∩ A = A`;
equivalently, for every element `x`, `x ∈ A ∩ A` iff `x ∈ A`. -/
theorem IntersectionIdempotent {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Intersection Left Left = Left := by
  sorry

end LRA.VolumeI.Set.Implementations.LRASet.Laws
