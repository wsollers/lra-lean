import LRA.VolumeI.Order.Density.DenseLinearOrder.Definition

namespace LRA.Order

/-- The usual strict order on the rationals is a dense linear order. -/
theorem RationalStrictOrderIsDenseLinearOrder :
    DenseLinearOrder (fun left right : Rat => left < right) := by
  sorry

end LRA.Order
