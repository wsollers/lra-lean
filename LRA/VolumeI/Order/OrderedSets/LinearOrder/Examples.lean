import LRA.VolumeI.Order.OrderedSets.LinearOrder.Definition

namespace LRA.Order.OrderedSets.LinearOrder

/--
Statement: The usual non-strict order on integers is a linear order.

Logical form: `LRA.Order.LinearOrder (fun left right : Int => left ≤ right)`.
-/
example :
    LRA.Order.LinearOrder
      (fun left right : Int => left ≤ right) := by
  sorry

end LRA.Order.OrderedSets.LinearOrder
