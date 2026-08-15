import LRA.VolumeI.Order.Lattices.JoinSemilattice.Definition

namespace LRA.Order

section NaturalNumbers

/--
Statement: Natural numbers under their usual order form a join-semilattice.

Logical form: `JoinSemilattice (fun left right : Nat => left ≤ right)`.
-/
example : JoinSemilattice (fun left right : Nat => left ≤ right) := by
  sorry

end NaturalNumbers

end LRA.Order
