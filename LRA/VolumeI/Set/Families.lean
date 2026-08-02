import LRA.VolumeI.Set.LRASet.LRASet

namespace LRA.VolumeI.Set

/-- An indexed family is a collection of sets `(Aᵢ)` indexed by values of `Index`;
equivalently, each index value `i` selects a set `Aᵢ` of elements of `Alpha`. -/
abbrev IndexedFamily (Index : LRACarrier) (Alpha : LRACarrier) :=
  SetFamily Index Alpha

/-- The indexed union of a family `(Aᵢ)` is the set of elements belonging to at
least one `Aᵢ`; equivalently, `x ∈ ⋃ᵢ Aᵢ` iff `∃ i, x ∈ Aᵢ`. -/
def IndexedUnion {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) : LRASet Alpha :=
  LRASet.IndexedUnion Family

/-- The indexed intersection of a family `(Aᵢ)` is the set of elements belonging
to every `Aᵢ`; equivalently, `x ∈ ⋂ᵢ Aᵢ` iff `∀ i, x ∈ Aᵢ`. -/
def IndexedIntersection {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) : LRASet Alpha :=
  LRASet.IndexedIntersection Family

/-- Let `(Aᵢ)` be an indexed family of sets. An element belongs to the indexed
union exactly when it belongs to some member of the family; equivalently,
for every element `x`, `x ∈ ⋃ᵢ Aᵢ` iff `∃ i, x ∈ Aᵢ`. -/
theorem IndexedUnionMembershipIff {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) (Element : Alpha) :
    LRASet.Member Element (IndexedUnion Family) ↔
      ∃ IndexValue, LRASet.Member Element (Family IndexValue) := by
  sorry

/-- Let `(Aᵢ)` be an indexed family of sets. An element belongs to the indexed
intersection exactly when it belongs to every member of the family; equivalently,
for every element `x`, `x ∈ ⋂ᵢ Aᵢ` iff `∀ i, x ∈ Aᵢ`. -/
theorem IndexedIntersectionMembershipIff {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) (Element : Alpha) :
    LRASet.Member Element (IndexedIntersection Family) ↔
      ∀ IndexValue, LRASet.Member Element (Family IndexValue) := by
  sorry

/-- Let `(Aᵢ)` and `(Bᵢ)` be indexed families of sets. If `Aᵢ ⊆ Bᵢ` for every
index `i`, then `⋃ᵢ Aᵢ ⊆ ⋃ᵢ Bᵢ`; equivalently, each indexed-union membership
witness for the left family transfers to one for the right family. -/
theorem IndexedUnionMonotone {Index Alpha : LRACarrier}
    {LeftFamily RightFamily : IndexedFamily Index Alpha}
    (PointwiseInclusion :
      ∀ IndexValue, LRASet.Subset (LeftFamily IndexValue) (RightFamily IndexValue)) :
    LRASet.Subset (IndexedUnion LeftFamily) (IndexedUnion RightFamily) := by
  sorry

/-- Let `(Aᵢ)` and `(Bᵢ)` be indexed families of sets. If `Aᵢ ⊆ Bᵢ` for every
index `i`, then `⋂ᵢ Aᵢ ⊆ ⋂ᵢ Bᵢ`; equivalently, membership in every `Aᵢ`
transfers pointwise to membership in every `Bᵢ`. -/
theorem IndexedIntersectionMonotone {Index Alpha : LRACarrier}
    {LeftFamily RightFamily : IndexedFamily Index Alpha}
    (PointwiseInclusion :
      ∀ IndexValue, LRASet.Subset (LeftFamily IndexValue) (RightFamily IndexValue)) :
    LRASet.Subset (IndexedIntersection LeftFamily) (IndexedIntersection RightFamily) := by
  sorry

end LRA.VolumeI.Set
