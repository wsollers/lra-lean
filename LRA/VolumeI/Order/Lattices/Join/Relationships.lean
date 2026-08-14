import LRA.VolumeI.Order.Lattices.Join.Definition
import LRA.VolumeI.Order.Lattices.Meet.Definition

namespace LRA.VolumeI.Order

universe u

/-- Joins for the converse relation are meets for the original relation. -/
theorem JoinOfConverseIffMeet
    {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha)
    (left right candidate : Alpha) :
    Join (LRA.VolumeI.Relations.Converse relation) left right candidate ↔
      Meet relation left right candidate := by
  sorry

end LRA.VolumeI.Order
