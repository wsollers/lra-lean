import LRA.Relation.Operations.Converse.Definition
import LRA.VolumeI.Order.Lattices.Join.Definition
import LRA.VolumeI.Order.Lattices.Meet.Definition

namespace LRA.Order

universe u

/-- Joins for the converse relation are meets for the original relation. -/
theorem JoinOfConverseIffMeet
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (left right candidate : Alpha) :
    Join (LRA.Relation.Converse relation) left right candidate ↔
      Meet relation left right candidate := by
  sorry

end LRA.Order
