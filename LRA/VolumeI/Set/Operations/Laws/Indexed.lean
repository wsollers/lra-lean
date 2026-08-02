import LRA.VolumeI.Set.Families
import LRA.VolumeI.Set.Operations.Laws.Complement

namespace LRA.VolumeI.Set.Operations.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.LRASet

theorem IndexedUnionMembership {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) (Element : Alpha) :
    Member Element (IndexedUnion Family) ↔
      ∃ IndexValue, Member Element (Family IndexValue) := by
  sorry

theorem IndexedIntersectionMembership {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) (Element : Alpha) :
    Member Element (IndexedIntersection Family) ↔
      ∀ IndexValue, Member Element (Family IndexValue) := by
  sorry

theorem IndexedUnionMonotone {Index Alpha : LRACarrier}
    {LeftFamily RightFamily : IndexedFamily Index Alpha}
    (PointwiseInclusion :
      ∀ IndexValue, Subset (LeftFamily IndexValue) (RightFamily IndexValue)) :
    Subset (IndexedUnion LeftFamily) (IndexedUnion RightFamily) := by
  sorry

theorem IndexedIntersectionMonotone {Index Alpha : LRACarrier}
    {LeftFamily RightFamily : IndexedFamily Index Alpha}
    (PointwiseInclusion :
      ∀ IndexValue, Subset (LeftFamily IndexValue) (RightFamily IndexValue)) :
    Subset (IndexedIntersection LeftFamily) (IndexedIntersection RightFamily) := by
  sorry

theorem ComplementIndexedUnion {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) :
    Complement (IndexedUnion Family) =
      IndexedIntersection (fun IndexValue => Complement (Family IndexValue)) := by
  sorry

theorem ComplementIndexedIntersection {Index Alpha : LRACarrier}
    (Family : IndexedFamily Index Alpha) :
    Complement (IndexedIntersection Family) =
      IndexedUnion (fun IndexValue => Complement (Family IndexValue)) := by
  sorry

end LRA.VolumeI.Set.Operations.Laws
