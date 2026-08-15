import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Order.OrderedSets.WellOrder.Definition

namespace LRA.Order

/-- The integers with their usual order are not well-ordered. -/
theorem IntegersAreNotWellOrdered :
    Not (WellOrder (Set Int) (fun left right : Int => left ≤ right)) := by
  sorry

end LRA.Order
