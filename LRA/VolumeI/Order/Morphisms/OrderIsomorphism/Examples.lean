import LRA.VolumeI.Order.Morphisms.OrderIsomorphism.Definition

namespace LRA.Order

section NaturalNumbers

/--
Statement: Identity maps exhibit an order isomorphism of natural numbers with themselves.

Logical form: `OrderIsomorphism (fun left right : Nat => left ≤ right) (fun left right : Nat => left ≤ right) id id`.
-/
example :
    OrderIsomorphism
      (fun left right : Nat => left ≤ right)
      (fun left right : Nat => left ≤ right)
      (fun value => value) (fun value => value) := by
  exact ⟨fun _ => rfl, fun _ => rfl, fun _ _ => Iff.rfl⟩

end NaturalNumbers

end LRA.Order
