import LRA.VolumeI.Set.Operations.Laws.Difference
import LRA.VolumeI.Set.Operations.Laws.Union

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

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

end LRA.VolumeI.Set.Operations.Laws
