import LRA.VolumeI.Order.Lattices.Join.Definition
import LRA.VolumeI.Order.Lattices.Meet.Definition

namespace LRA.VolumeI.Order

universe u

/-- Meets for the converse relation are joins for the original relation. -/
theorem MeetOfConverseIffJoin
    {Alpha : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Alpha)
    (left right candidate : Alpha) :
    Meet (LRA.VolumeI.Relations.Converse relation) left right candidate ↔
      Join relation left right candidate := by
  sorry

end LRA.VolumeI.Order
