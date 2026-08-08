import LRA.VolumeI.Set.Implementations.LRASet.Operations.Difference.Laws
import LRA.VolumeI.Set.Implementations.LRASet.Operations.Union.Laws

namespace LRA.VolumeI.Set.Implementations.LRASet.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.Implementations.LRASet.LRASet

/-- Let `A` and `B` be sets. The complement of their union is the intersection
of their complements; equivalently, for every element `x`,
`x ∈ (A ∪ B)ᶜ` iff `x ∈ Aᶜ ∩ Bᶜ`. -/
theorem DeMorganUnion {Alpha : LRACarrier} (Left Right : LRASet Alpha) :
    Complement (Union Left Right) =
      Intersection (Complement Left) (Complement Right) := by
  sorry

/-- Let `A` and `B` be sets. The complement of their intersection is the union
of their complements; equivalently, for every element `x`,
`x ∈ (A ∩ B)ᶜ` iff `x ∈ Aᶜ ∪ Bᶜ`. -/
theorem DeMorganIntersection {Alpha : LRACarrier} (Left Right : LRASet Alpha) :
    Complement (Intersection Left Right) =
      Union (Complement Left) (Complement Right) := by
  sorry

/-- Intersection distributes over union: `A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)`;
equivalently, membership distributes conjunction over disjunction. -/
theorem IntersectionDistributesOverUnion {Alpha : LRACarrier}
    (Left Middle Right : LRASet Alpha) :
    Intersection Left (Union Middle Right) =
      Union (Intersection Left Middle) (Intersection Left Right) := by
  sorry

/-- Union distributes over intersection: `A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)`;
equivalently, membership distributes disjunction over conjunction. -/
theorem UnionDistributesOverIntersection {Alpha : LRACarrier}
    (Left Middle Right : LRASet Alpha) :
    Union Left (Intersection Middle Right) =
      Intersection (Union Left Middle) (Union Left Right) := by
  sorry

/-- Let `A` and `B` be sets. The union of `A` with `A ∩ B` is `A`;
equivalently, for every element `x`, `x ∈ A ∪ (A ∩ B)` iff `x ∈ A`. -/
theorem AbsorptionUnionIntersection {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Union Left (Intersection Left Right) = Left := by
  sorry

/-- Let `A` and `B` be sets. The intersection of `A` with `A ∪ B` is `A`;
equivalently, for every element `x`, `x ∈ A ∩ (A ∪ B)` iff `x ∈ A`. -/
theorem AbsorptionIntersectionUnion {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Intersection Left (Union Left Right) = Left := by
  sorry

end LRA.VolumeI.Set.Implementations.LRASet.Laws
