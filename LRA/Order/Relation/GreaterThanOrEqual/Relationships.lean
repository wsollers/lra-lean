import LRA.Relation.Operations.Converse.Definition
import LRA.Order.Relation.GreaterThanOrEqual.Definition
import LRA.Order.Relation.LessThanOrEqual.Definition

namespace LRA.Order

universe u

                                                                           
theorem GreaterThanOrEqualIsConverseOfLessThanOrEqual
    {Alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation Alpha) :
    GreaterThanOrEqual strictRelation =
      LRA.Relation.Converse (LessThanOrEqual strictRelation) := by
  sorry

end LRA.Order
