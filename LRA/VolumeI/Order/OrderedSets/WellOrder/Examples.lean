import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Order.OrderedSets.WellOrder.Definition

namespace LRA.Order

/--
Statement: The natural numbers with their usual order are well-ordered.

Logical form: `WellOrder (Set Nat) (fun left right : Nat => left ≤ right)`.
-/
example :
    WellOrder (Set Nat) (fun left right : Nat => left ≤ right) := by
  sorry

end LRA.Order
