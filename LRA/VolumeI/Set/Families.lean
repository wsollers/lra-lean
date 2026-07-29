import LRA.VolumeI.Set.Set

namespace LRA.VolumeI.Set

universe u

/-!
Public interface home for indexed families of sets.
-/

/-- Public name for an indexed family of predicate-sets. -/
abbrev IndexedFamily (Index : LRACarrier) (Alpha : LRACarrier) :=
  SetFamily Index Alpha

/-- Public name for the indexed union of a family of predicate-sets. -/
def IndexedUnion {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) : LRASet Alpha :=
  LRASet.indexedUnion Family

/-- Public name for the indexed intersection of a family of predicate-sets. -/
def IndexedIntersection {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) : LRASet Alpha :=
  LRASet.indexedIntersection Family

/-- Membership criterion for indexed unions. -/
theorem IndexedUnionMembershipIff {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) (Element : Alpha) :
    LRASet.member Element (IndexedUnion Family) ↔
      ∃ IndexValue, LRASet.member Element (Family IndexValue) := by
  rfl

/-- Membership criterion for indexed intersections. -/
theorem IndexedIntersectionMembershipIff {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) (Element : Alpha) :
    LRASet.member Element (IndexedIntersection Family) ↔
      ∀ IndexValue, LRASet.member Element (Family IndexValue) := by
  rfl

/-- Pointwise inclusion of families induces inclusion of indexed unions. -/
theorem IndexedUnionMonotone {Index Alpha : LRACarrier}
    {LeftFamily RightFamily : IndexedFamily Index Alpha}
    (PointwiseInclusion :
      ∀ IndexValue, LRASet.subset (LeftFamily IndexValue) (RightFamily IndexValue)) :
    LRASet.subset (IndexedUnion LeftFamily) (IndexedUnion RightFamily) := by
  intro Element ElementInLeftUnion
  rcases ElementInLeftUnion with ⟨IndexValue, ElementInLeftSet⟩
  exact ⟨IndexValue, PointwiseInclusion IndexValue Element ElementInLeftSet⟩

/-- Pointwise inclusion of families induces inclusion of indexed intersections. -/
theorem IndexedIntersectionMonotone {Index Alpha : LRACarrier}
    {LeftFamily RightFamily : IndexedFamily Index Alpha}
    (PointwiseInclusion :
      ∀ IndexValue, LRASet.subset (LeftFamily IndexValue) (RightFamily IndexValue)) :
    LRASet.subset (IndexedIntersection LeftFamily) (IndexedIntersection RightFamily) := by
  intro Element ElementInLeftIntersection IndexValue
  exact PointwiseInclusion IndexValue Element (ElementInLeftIntersection IndexValue)

end LRA.VolumeI.Set
