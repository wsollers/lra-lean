import LRA.VolumeI.Set.Families
import LRA.VolumeI.Set.Operations.Laws.Complement

/-!
Indexed union and indexed intersection laws.
-/

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

/-- Membership criterion for indexed unions, re-exported in the laws namespace. -/
theorem IndexedUnionMembership {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) (Element : Alpha) :
    Member Element (IndexedUnion Family) ↔
      ∃ IndexValue, Member Element (Family IndexValue) := by
  exact LRA.VolumeI.Set.IndexedUnionMembershipIff Family Element

/-- Membership criterion for indexed intersections, re-exported in the laws namespace. -/
theorem IndexedIntersectionMembership {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) (Element : Alpha) :
    Member Element (IndexedIntersection Family) ↔
      ∀ IndexValue, Member Element (Family IndexValue) := by
  exact LRA.VolumeI.Set.IndexedIntersectionMembershipIff Family Element

/-- Pointwise inclusion of families induces inclusion of indexed unions. -/
theorem IndexedUnionMonotone {Index Alpha : LRACarrier}
    {LeftFamily RightFamily : IndexedFamily Index Alpha}
    (PointwiseInclusion :
      ∀ IndexValue, Subset (LeftFamily IndexValue) (RightFamily IndexValue)) :
    Subset (IndexedUnion LeftFamily) (IndexedUnion RightFamily) := by
  exact LRA.VolumeI.Set.IndexedUnionMonotone PointwiseInclusion

/-- Pointwise inclusion of families induces inclusion of indexed intersections. -/
theorem IndexedIntersectionMonotone {Index Alpha : LRACarrier}
    {LeftFamily RightFamily : IndexedFamily Index Alpha}
    (PointwiseInclusion :
      ∀ IndexValue, Subset (LeftFamily IndexValue) (RightFamily IndexValue)) :
    Subset (IndexedIntersection LeftFamily) (IndexedIntersection RightFamily) := by
  exact LRA.VolumeI.Set.IndexedIntersectionMonotone PointwiseInclusion

/-- The complement of an indexed union is the indexed intersection of complements. -/
theorem ComplementIndexedUnion {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) :
    Complement (IndexedUnion Family) =
      IndexedIntersection (fun IndexValue => Complement (Family IndexValue)) := by
  sorry

/-- The complement of an indexed intersection is the indexed union of complements. -/
theorem ComplementIndexedIntersection {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) :
    Complement (IndexedIntersection Family) =
      IndexedUnion (fun IndexValue => Complement (Family IndexValue)) := by
  sorry

end LRA.VolumeI.Set.Operations.Laws
