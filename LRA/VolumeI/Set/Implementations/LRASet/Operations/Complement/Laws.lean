import LRA.VolumeI.Set.Implementations.LRASet.LRASet

namespace LRA.VolumeI.Set.Implementations.LRASet.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.Implementations.LRASet.LRASet

/-- Let `A` be a set. The complement of the complement of `A` is `A`;
equivalently, for every element `x`, `x ∈ (Aᶜ)ᶜ` iff `x ∈ A`. -/
theorem DoubleComplement {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Complement (Complement Left) = Left := by
  sorry

/-- Relative complement is antitone with respect to inclusion. If `A ⊆ B`,
then the complement of `B` inside a fixed ambient set is contained in the
complement of `A` inside that same ambient set. -/
theorem ComplementAntitoneInclusion {Alpha : LRACarrier}
    {Ambient Left Right : LRASet Alpha}
    (LeftSubsetRight : LRASet.Subset Left Right) :
    LRASet.Subset (LRASet.RelativeComplement Ambient Right)
      (LRASet.RelativeComplement Ambient Left) := by
  sorry

/-- Let `A` be the empty set. The complement of the empty set is the universal set;
equivalently, for every element `x`, `x ∈ ∅ᶜ` iff `x ∈ U`. -/
theorem ComplementEmpty {Alpha : LRACarrier} :
    Complement (Empty Alpha) = Universal Alpha := by
  sorry


/-- Let `U` be the universal set. The complement of the universal set is the empty set;
equivalently, for every element `x`, `x ∈ Uᶜ` iff `x ∈ ∅`. -/
theorem ComplementUniversal {Alpha : LRACarrier} :
    Complement (Universal Alpha) = Empty Alpha := by
  sorry

/-- A set union its complement is the universal set: `A ∪ Aᶜ = U`. -/
theorem UnionComplement {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Union Left (Complement Left) = Universal Alpha := by
  sorry

/-- A complement union the original set is the universal set: `Aᶜ ∪ A = U`. -/
theorem ComplementUnion {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Union (Complement Left) Left = Universal Alpha := by
  sorry

/-- A set intersect its complement is the empty set: `A ∩ Aᶜ = ∅`. -/
theorem IntersectionComplement {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Intersection Left (Complement Left) = Empty Alpha := by
  sorry

/-- A complement intersect the original set is the empty set: `Aᶜ ∩ A = ∅`. -/
theorem ComplementIntersection {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Intersection (Complement Left) Left = Empty Alpha := by
  sorry

end LRA.VolumeI.Set.Implementations.LRASet.Laws
