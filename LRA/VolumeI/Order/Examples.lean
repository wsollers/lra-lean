import LRA.VolumeI.Order.Dense
import LRA.VolumeI.Order.Completeness
import LRA.VolumeI.Order.Directed

namespace LRA.VolumeI.Order

/-- Divisibility on natural numbers is a partial order. -/
theorem NaturalDivisibilityIsPartialOrder :
    PartialOrder (fun left right : Nat => left ∣ right) := by
  sorry

/-- Divisibility on natural numbers is not total. -/
theorem NaturalDivisibilityIsNotTotal :
    Not (LRA.VolumeI.Relations.Total (fun left right : Nat => left ∣ right)) := by
  sorry

/-- The usual integer order is total. -/
theorem IntegerOrderIsTotal :
    LRA.VolumeI.Relations.Total (fun left right : Int => left ≤ right) := by
  sorry

/-- The usual integer order is not dense. -/
theorem IntegerOrderIsNotDense :
    Not (LRA.VolumeI.Relations.Dense (fun left right : Int => left < right)) := by
  sorry

end LRA.VolumeI.Order
