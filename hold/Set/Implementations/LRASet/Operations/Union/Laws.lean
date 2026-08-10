import LRA.VolumeI.Set.Implementations.LRASet.LRASet

namespace LRA.VolumeI.Set.Implementations.LRASet.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.Implementations.LRASet.LRASet

/-- Let `A` and `B` be sets. Their union is commutative: `A ∪ B = B ∪ A`;
equivalently, for every element `x`, `x ∈ A ∪ B` iff `x ∈ B ∪ A`. -/
theorem UnionCommutative {Alpha : LRACarrier} (Left Right : LRASet Alpha) :
    Union Left Right = Union Right Left := by
  sorry

/-- Union is monotone with respect to inclusion in either argument. If
`A ⊆ B`, then `A ∪ C ⊆ B ∪ C` and `C ∪ A ⊆ C ∪ B`. -/
theorem UnionMonotoneInclusion {Alpha : LRACarrier}
    {Left Right Fixed : LRASet Alpha}
    (LeftSubsetRight : Subset Left Right) :
    Subset (Union Left Fixed) (Union Right Fixed) ∧
      Subset (Union Fixed Left) (Union Fixed Right) := by
  sorry

/-- Let `A`, `B`, and `C` be sets. Their union is associative:
`(A ∪ B) ∪ C = A ∪ (B ∪ C)`; equivalently, for every element `x`,
`x ∈ (A ∪ B) ∪ C` iff `x ∈ A ∪ (B ∪ C)`. -/
theorem UnionAssociative {Alpha : LRACarrier}

    (Left Middle Right : LRASet Alpha) :
    Union (Union Left Middle) Right = Union Left (Union Middle Right) := by
  sorry

/-- Let `A` be a set. Taking the union of `A` with the empty set gives `A`:
`A ∪ ∅ = A`; equivalently, for every element `x`, `x ∈ A ∪ ∅` iff `x ∈ A`. -/
theorem UnionEmpty {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Union Left (Empty Alpha) = Left := by
  sorry

/-- Let `A` be a set. Taking the union of the empty set with `A` gives `A`:
`∅ ∪ A = A`; equivalently, for every element `x`, `x ∈ ∅ ∪ A` iff `x ∈ A`. -/
theorem EmptyUnion {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Union (Empty Alpha) Right = Right := by
  sorry

/-- Let `A` be a set. Taking the union of `A` with the universal set gives
the universal set: `A ∪ U = U`; equivalently, for every element `x`,
`x ∈ A ∪ U` iff `x ∈ U`. -/
theorem UnionUniversal {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Union Left (Universal Alpha) = Universal Alpha := by
  sorry

/-- Let `A` be a set. Taking the union of the universal set with `A` gives
the universal set: `U ∪ A = U`; equivalently, for every element `x`,
`x ∈ U ∪ A` iff `x ∈ U`. -/
theorem UniversalUnion {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Union (Universal Alpha) Right = Universal Alpha := by
  sorry

/-- Let `A` be a set. Taking the union of `A` with itself gives `A`: `A ∪ A = A`;
equivalently, for every element `x`, `x ∈ A ∪ A` iff `x ∈ A`. -/
theorem UnionIdempotent {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Union Left Left = Left := by
  sorry


end LRA.VolumeI.Set.Implementations.LRASet.Laws
