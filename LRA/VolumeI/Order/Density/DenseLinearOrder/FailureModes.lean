import LRA.VolumeI.Order.Density.DenseLinearOrder.Definition

namespace LRA.Order

/-- The integer strict order is linear but not dense. -/
theorem IntegerStrictOrderIsNotDenseLinearOrder :
    Not (DenseLinearOrder (fun left right : Int => left < right)) := by
  sorry

end LRA.Order
