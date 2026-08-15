import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Order.OrderedSets.WellOrder.Definition

namespace LRA.Order

/-- The natural numbers with their usual order are well-ordered. -/
theorem NaturalNumbersAreWellOrdered :
    WellOrder (Set Nat) (fun left right : Nat => left ≤ right) := by
  sorry

end LRA.Order
