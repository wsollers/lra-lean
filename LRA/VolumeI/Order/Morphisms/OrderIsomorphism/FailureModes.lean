import LRA.VolumeI.Order.Morphisms.OrderIsomorphism.Definition

namespace LRA.Order

universe u v

/--
`FailsOrderIsomorphism`

Statement: A proposed pair of maps fails to define an order isomorphism.

Logical form: `Not (OrderIsomorphism sourceRelation targetRelation forward inverse)`.
-/
def FailsOrderIsomorphism
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (forward : Source -> Target) (inverse : Target -> Source) : Prop :=
  Not (OrderIsomorphism sourceRelation targetRelation forward inverse)

section Booleans

/--
`BooleanConstantMapsFailOrderIsomorphism`

Statement: Constant maps cannot form an order isomorphism on the two-element chain.

Logical form: `FailsOrderIsomorphism BooleanChain BooleanChain (fun _ => false) (fun _ => false)`.
-/
theorem BooleanConstantMapsFailOrderIsomorphism :
    FailsOrderIsomorphism
      (fun left right : Bool => left = false \/ right = true)
      (fun left right : Bool => left = false \/ right = true)
      (fun _ => false) (fun _ => false) := by
  sorry

end Booleans

end LRA.Order
