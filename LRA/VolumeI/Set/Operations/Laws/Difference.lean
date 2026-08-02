import LRA.VolumeI.Set.Operations.Laws.Complement
import LRA.VolumeI.Set.Operations.Laws.Intersection

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

/-- Let `A` and `B` be sets. The difference `A \ B` is the intersection of `A`
with the complement of `B`; equivalently, for every element `x`,
`x ∈ A \ B` iff `x ∈ A ∩ Bᶜ`. -/
theorem DifferenceAsIntersectionComplement {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Difference Left Right = Intersection Left (Complement Right) := by
  sorry

/-- Let `A` be a set. Removing the empty set from `A` gives `A`;
equivalently, for every element `x`, `x ∈ A \ ∅` iff `x ∈ A`. -/
theorem DifferenceEmpty {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Difference Left (Empty Alpha) = Left := by
  sorry

/-- Let `A` be a set. Removing `A` from the empty set gives the empty set;
equivalently, for every element `x`, `x ∈ ∅ \ A` iff `x ∈ ∅`. -/
theorem EmptyDifference {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Difference (Empty Alpha) Right = Empty Alpha := by
  sorry

/-- Let `A` be a set. Removing the universal set from `A` gives the empty set;
equivalently, for every element `x`, `x ∈ A \ U` iff `x ∈ ∅`. -/
theorem DifferenceUniversal {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Difference Left (Universal Alpha) = Empty Alpha := by
  sorry

/-- Let `A` be a set. Removing `A` from the universal set gives the complement
of `A`; equivalently, for every element `x`, `x ∈ U \ A` iff `x ∈ Aᶜ`. -/
theorem UniversalDifference {Alpha : LRACarrier} (Right : LRASet Alpha) :
    Difference (Universal Alpha) Right = Complement Right := by
  sorry

/-- Let `A` be a set. Removing `A` from itself gives the empty set;
equivalently, for every element `x`, `x ∈ A \ A` iff `x ∈ ∅`. -/
theorem DifferenceSelf {Alpha : LRACarrier} (Left : LRASet Alpha) :
    Difference Left Left = Empty Alpha := by
  sorry

end LRA.VolumeI.Set.Operations.Laws
