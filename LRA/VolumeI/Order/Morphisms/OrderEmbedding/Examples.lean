import LRA.VolumeI.Order.Morphisms.OrderEmbedding.Definition

namespace LRA.Order

section NaturalNumbers

/--
Statement: The identity map embeds the usual natural-number order into itself.

Logical form: `OrderEmbedding (fun left right : Nat => left ≤ right) (fun left right : Nat => left ≤ right) id`.
-/
example :
    OrderEmbedding
      (fun left right : Nat => left ≤ right)
      (fun left right : Nat => left ≤ right)
      (fun value => value) := by
  intro left right
  rfl

end NaturalNumbers

end LRA.Order
