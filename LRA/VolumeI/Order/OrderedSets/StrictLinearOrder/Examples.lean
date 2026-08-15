import LRA.VolumeI.Order.OrderedSets.StrictLinearOrder.Definition

namespace LRA.Order

section Integers

/--
Statement: The usual strict order on integers is a strict linear order.

Logical form: `StrictLinearOrder (fun left right : Int => left < right)`.
-/
example : StrictLinearOrder (fun left right : Int => left < right) := by
  sorry

end Integers

end LRA.Order
