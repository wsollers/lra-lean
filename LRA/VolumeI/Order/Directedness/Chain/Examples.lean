import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Directedness.Chain.Definition

namespace LRA.Order

section NaturalNumbers

/--
Statement: Every represented subset of a linear order is a chain.

Logical form: `Chain (fun left right : Nat => left ≤ right) (Set.univ : Set Nat)`.
-/
example :
    Chain (fun left right : Nat => left ≤ right) (Set.univ : Set Nat) := by
  sorry

end NaturalNumbers

end LRA.Order
