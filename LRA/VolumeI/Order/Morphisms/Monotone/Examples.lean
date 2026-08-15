import LRA.VolumeI.Order.Morphisms.Monotone.Definition

namespace LRA.Order

section NaturalNumbers

/--
Statement: The successor map preserves the usual order on natural numbers.

Logical form: `Monotone (fun left right : Nat => left ≤ right) (fun left right : Nat => left ≤ right) Nat.succ`.
-/
example :
    Monotone
      (fun left right : Nat => left ≤ right)
      (fun left right : Nat => left ≤ right)
      Nat.succ := by
  intro left right leftLeRight
  exact Nat.succ_le_succ leftLeRight

end NaturalNumbers

end LRA.Order
