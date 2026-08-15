import Mathlib.Data.Set.Basic
import LRA.VolumeI.Order.Directedness.Directed.Definition

namespace LRA.Order

section NaturalNumbers

/--
Statement: The natural numbers form a directed set under their usual order.

Logical form: `Directed (fun left right : Nat => left ≤ right) (Set.univ : Set Nat)`.
-/
example :
    Directed (fun left right : Nat => left ≤ right) (Set.univ : Set Nat) := by
  sorry

/--
Statement: Positive natural numbers are directed by divisibility.

Logical form: `Directed (fun left right : Nat => left ∣ right) {number | 0 < number}`.
-/
example :
    Directed (fun left right : Nat => left ∣ right)
      ({number | 0 < number} : Set Nat) := by
  sorry

end NaturalNumbers

end LRA.Order
