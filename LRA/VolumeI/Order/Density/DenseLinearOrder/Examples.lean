import LRA.VolumeI.Order.Density.DenseLinearOrder.Definition

namespace LRA.Order

/--
Statement: The usual strict order on the rationals is a dense linear order.

Logical form: `DenseLinearOrder (fun left right : Rat => left < right)`.
-/
example :
    DenseLinearOrder (fun left right : Rat => left < right) := by
  sorry

end LRA.Order
