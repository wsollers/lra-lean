import Mathlib.Data.Finite.Defs
import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Order.OrderedSets.WellOrder.Definition

namespace LRA.Order

universe u

/-- Every finite linear order is a well-order on predicate subsets. -/
theorem FiniteLinearOrderIsWellOrder
    {Alpha : Type u} [Finite Alpha]
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLinearOrder : LinearOrder relation) :
    WellOrder (Set Alpha) relation := by
  sorry

end LRA.Order
