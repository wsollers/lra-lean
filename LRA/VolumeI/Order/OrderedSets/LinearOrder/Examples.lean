import LRA.VolumeI.Order.OrderedSets.LinearOrder.Definition

namespace LRA.VolumeI.Order.OrderedSets.LinearOrder

/-- The usual non-strict order on integers is a linear order. -/
theorem IntegerOrderIsLinearOrder :
    LRA.VolumeI.Order.LinearOrder
      (fun left right : Int => left ≤ right) := by
  sorry

end LRA.VolumeI.Order.OrderedSets.LinearOrder
