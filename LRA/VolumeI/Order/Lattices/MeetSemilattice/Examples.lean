import LRA.VolumeI.Order.Lattices.MeetSemilattice.Definition

namespace LRA.Order

section NaturalNumbers

/--
Statement: Natural numbers under their usual order form a meet-semilattice.

Logical form: `MeetSemilattice (fun left right : Nat => left ≤ right)`.
-/
example : MeetSemilattice (fun left right : Nat => left ≤ right) := by
  sorry

end NaturalNumbers

end LRA.Order
