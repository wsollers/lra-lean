import LRA.VolumeI.Set.Families
import LRA.VolumeI.Set.Operations.Laws.Complement

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

/-- Let `(Aᵢ)` be an indexed family of sets. An element belongs to the indexed
union exactly when it belongs to some member of the family; equivalently,
for every element `x`, `x ∈ ⋃ᵢ Aᵢ` iff `∃ i, x ∈ Aᵢ`. -/
theorem IndexedUnionMembership {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) (Element : Alpha) :
    Member Element (IndexedUnion Family) ↔
      ∃ IndexValue, Member Element (Family IndexValue) := by
  sorry

/-- Let `(Aᵢ)` be an indexed family of sets. An element belongs to the indexed
intersection exactly when it belongs to every member of the family; equivalently,
for every element `x`, `x ∈ ⋂ᵢ Aᵢ` iff `∀ i, x ∈ Aᵢ`. -/
theorem IndexedIntersectionMembership {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) (Element : Alpha) :
    Member Element (IndexedIntersection Family) ↔
      ∀ IndexValue, Member Element (Family IndexValue) := by
  sorry

/-- Let `(Aᵢ)` and `(Bᵢ)` be indexed families of sets. If `Aᵢ ⊆ Bᵢ` for every
index `i`, then `⋃ᵢ Aᵢ ⊆ ⋃ᵢ Bᵢ`; equivalently, each witness of membership in
the left indexed union transfers to a witness in the right indexed union. -/
theorem IndexedUnionMonotone {Index Alpha : LRACarrier}
    {LeftFamily RightFamily : IndexedFamily Index Alpha}
    (PointwiseInclusion :
      ∀ IndexValue, Subset (LeftFamily IndexValue) (RightFamily IndexValue)) :
    Subset (IndexedUnion LeftFamily) (IndexedUnion RightFamily) := by
  sorry

/-- Let `(Aᵢ)` and `(Bᵢ)` be indexed families of sets. If `Aᵢ ⊆ Bᵢ` for every
index `i`, then `⋂ᵢ Aᵢ ⊆ ⋂ᵢ Bᵢ`; equivalently, membership in every `Aᵢ`
transfers pointwise to membership in every `Bᵢ`. -/
theorem IndexedIntersectionMonotone {Index Alpha : LRACarrier}
    {LeftFamily RightFamily : IndexedFamily Index Alpha}
    (PointwiseInclusion :
      ∀ IndexValue, Subset (LeftFamily IndexValue) (RightFamily IndexValue)) :
    Subset (IndexedIntersection LeftFamily) (IndexedIntersection RightFamily) := by
  sorry

/-- Let `(Aᵢ)` be an indexed family of sets. The complement of the indexed union
is the indexed intersection of the complements; equivalently, for every element
`x`, `x ∈ (⋃ᵢ Aᵢ)ᶜ` iff `x ∈ ⋂ᵢ Aᵢᶜ`. -/
theorem ComplementIndexedUnion {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) :
    Complement (IndexedUnion Family) =
      IndexedIntersection (fun IndexValue => Complement (Family IndexValue)) := by
  sorry

/-- Let `(Aᵢ)` be an indexed family of sets. The complement of the indexed
intersection is the indexed union of the complements; equivalently, for every
element `x`, `x ∈ (⋂ᵢ Aᵢ)ᶜ` iff `x ∈ ⋃ᵢ Aᵢᶜ`. -/
theorem ComplementIndexedIntersection {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) :
    Complement (IndexedIntersection Family) =
      IndexedUnion (fun IndexValue => Complement (Family IndexValue)) := by
  sorry

end LRA.VolumeI.Set.Operations.Laws
