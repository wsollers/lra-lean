import LRA.VolumeI.Order.OrderedSets.LinearOrder.Definition

namespace LRA.Order.OrderedSets.LinearOrder

/-- The usual non-strict order on integers is a linear order. -/
theorem IntegerOrderIsLinearOrder :
    LRA.Order.LinearOrder
      (fun left right : Int => left ≤ right) := by
  sorry

end LRA.Order.OrderedSets.LinearOrder
