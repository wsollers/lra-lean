import LRA.VolumeI.Set.LRASet.LRASet

namespace LRA.VolumeI.Set

/-- Public name for an indexed family of typed sets. -/
abbrev IndexedFamily (Index : LRACarrier) (Alpha : LRACarrier) :=
  SetFamily Index Alpha

/-- Public name for the indexed union of a family of typed sets. -/
def IndexedUnion {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) : LRASet Alpha :=
  LRASet.IndexedUnion Family

/-- Public name for the indexed intersection of a family of typed sets. -/
def IndexedIntersection {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) : LRASet Alpha :=
  LRASet.IndexedIntersection Family

/-- Membership criterion for indexed unions. -/
theorem IndexedUnionMembershipIff {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) (Element : Alpha) :
    LRASet.Member Element (IndexedUnion Family) ↔
      ∃ IndexValue, LRASet.Member Element (Family IndexValue) := by
  sorry

/-- Membership criterion for indexed intersections. -/
theorem IndexedIntersectionMembershipIff {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) (Element : Alpha) :
    LRASet.Member Element (IndexedIntersection Family) ↔
      ∀ IndexValue, LRASet.Member Element (Family IndexValue) := by
  sorry

/-- Pointwise inclusion of families induces inclusion of indexed unions. -/
theorem IndexedUnionMonotone {Index Alpha : LRACarrier}
    {LeftFamily RightFamily : IndexedFamily Index Alpha}
    (PointwiseInclusion :
      ∀ IndexValue, LRASet.Subset (LeftFamily IndexValue) (RightFamily IndexValue)) :
    LRASet.Subset (IndexedUnion LeftFamily) (IndexedUnion RightFamily) := by
  sorry

/-- Pointwise inclusion of families induces inclusion of indexed intersections. -/
theorem IndexedIntersectionMonotone {Index Alpha : LRACarrier}
    {LeftFamily RightFamily : IndexedFamily Index Alpha}
    (PointwiseInclusion :
      ∀ IndexValue, LRASet.Subset (LeftFamily IndexValue) (RightFamily IndexValue)) :
    LRASet.Subset (IndexedIntersection LeftFamily) (IndexedIntersection RightFamily) := by
  sorry

end LRA.VolumeI.Set
