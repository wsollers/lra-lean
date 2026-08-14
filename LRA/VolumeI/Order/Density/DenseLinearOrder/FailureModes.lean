import LRA.VolumeI.Order.Density.DenseLinearOrder.Definition

namespace LRA.VolumeI.Order

/-- The integer strict order is linear but not dense. -/
theorem IntegerStrictOrderIsNotDenseLinearOrder :
    Not (DenseLinearOrder (fun left right : Int => left < right)) := by
  sorry

end LRA.VolumeI.Order
