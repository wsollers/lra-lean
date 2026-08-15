import LRA.VolumeI.Order.Lattices.Join.Definition
import LRA.VolumeI.Order.Lattices.Meet.Definition

namespace LRA.Order

universe u

/-- Meets for the converse relation are joins for the original relation. -/
theorem MeetOfConverseIffJoin
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (left right candidate : Alpha) :
    Meet (LRA.Relation.Converse relation) left right candidate ↔
      Join relation left right candidate := by
  sorry

end LRA.Order
