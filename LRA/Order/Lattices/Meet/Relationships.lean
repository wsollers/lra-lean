import LRA.Relation.Operations.Converse.Definition
import LRA.Order.Lattices.Join.Definition
import LRA.Order.Lattices.Meet.Definition

namespace LRA.Order

universe u

                                                                           
theorem MeetOfConverseIffJoin
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha)
    (left right candidate : Alpha) :
    Meet (LRA.Relation.Converse relation) left right candidate ↔
      Join relation left right candidate := by
  sorry

end LRA.Order
